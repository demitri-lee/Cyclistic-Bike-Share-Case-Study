-- Cyclistic Bike-Share Case Study
-- Analysis 5: Top Starting Stations by Rider Type
-- Identifies the top 10 known starting stations for casual riders and annual members.
-- Percentages are calculated within rides that have a known starting station.

WITH filtered_data AS (
  SELECT
    start_station_name,
    member_casual
  FROM
    `spartan-amphora-465916-r4.cyclistic_data.cyclistic_analysis_ready`
  WHERE
    ride_date >= DATE '2025-10-01'
    AND ride_date < DATE '2026-10-01'
    AND start_station_name IS NOT NULL
),

station_counts AS (
  SELECT
    member_casual,
    start_station_name,
    COUNT(*) AS ride_count
  FROM filtered_data
  GROUP BY
    member_casual,
    start_station_name
),

rider_totals AS (
  SELECT
    member_casual,
    COUNT(*) AS total_known_start_rides
  FROM filtered_data
  GROUP BY member_casual
),

ranked_stations AS (
  SELECT
    s.member_casual,
    s.start_station_name,
    s.ride_count,
    ROUND(
      SAFE_DIVIDE(s.ride_count, r.total_known_start_rides) * 100,
      2
    ) AS percentage_of_known_starts,
    ROW_NUMBER() OVER (
      PARTITION BY s.member_casual
      ORDER BY s.ride_count DESC
    ) AS station_rank

  FROM station_counts AS s
  JOIN rider_totals AS r
    ON s.member_casual = r.member_casual
)

SELECT
  member_casual,
  station_rank,
  start_station_name,
  ride_count,
  percentage_of_known_starts

FROM ranked_stations

WHERE station_rank <= 10

ORDER BY
  member_casual,
  station_rank;
