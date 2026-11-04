-- Cyclistic Bike-Share Case Study
-- Data Cleaning Query
-- Analysis period: October 2025 through September 2026
--
-- Cleaning decisions:
-- 1. Correct calculated ride duration for 29 rides affected by the
--    November 2025 daylight-saving time change.
-- 2. Remove suspicious rides lasting less than one minute when:
--      - duration = 0 seconds
--      - start and end station are the same
--      - implied straight-line speed exceeds 50 km/h
-- 3. Remove rides lasting longer than 24 hours.
-- 4. Retain rides with missing station information unless they fail
--    one of the cleaning rules above.

CREATE OR REPLACE TABLE
  `spartan-amphora-465916-r4.cyclistic_data.cyclistic_all_trips_clean` AS

WITH prepared AS (
  SELECT
    *,

    -- Correct calculated duration for daylight-saving time records
    CASE
      WHEN TIMESTAMP_DIFF(ended_at, started_at, SECOND) < 0
      THEN TIMESTAMP_DIFF(ended_at, started_at, SECOND) + 3600
      ELSE TIMESTAMP_DIFF(ended_at, started_at, SECOND)
    END AS ride_length_seconds,

    -- Straight-line distance between start and end coordinates
    ST_DISTANCE(
      ST_GEOGPOINT(start_lng, start_lat),
      ST_GEOGPOINT(end_lng, end_lat)
    ) AS straight_line_distance_metres

  FROM
    `spartan-amphora-465916-r4.cyclistic_data.cyclistic_all_trips_raw`
),

calculated AS (
  SELECT
    *,
    ride_length_seconds / 60.0 AS ride_length_minutes,

    SAFE_DIVIDE(
      straight_line_distance_metres / 1000,
      ride_length_seconds / 3600.0
    ) AS implied_speed_kmh

  FROM prepared
)

SELECT *
FROM calculated

WHERE
  -- Remove rides longer than 24 hours
  ride_length_seconds <= 86400

  -- Remove suspicious sub-one-minute rides
  AND NOT (
    ride_length_seconds < 60
    AND (
      ride_length_seconds = 0

      OR COALESCE(
        start_station_name = end_station_name
        AND start_station_name IS NOT NULL,
        FALSE
      )

      OR COALESCE(implied_speed_kmh > 50, FALSE)
    )
  );
