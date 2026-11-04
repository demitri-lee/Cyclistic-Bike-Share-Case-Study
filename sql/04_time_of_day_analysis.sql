-- Cyclistic Bike-Share Case Study
-- Analysis 2: Ride Distribution by Time of Day
-- Compares how each rider type's annual rides are distributed across the day.

WITH filtered_data AS (
  SELECT
    start_hour,
    member_casual
  FROM
    `spartan-amphora-465916-r4.cyclistic_data.cyclistic_analysis_ready`
  WHERE
    ride_date >= DATE '2025-10-01'
    AND ride_date < DATE '2026-10-01'
),

hour_counts AS (
  SELECT
    start_hour,
    COUNT(*) AS total_rides,
    COUNTIF(member_casual = 'casual') AS casual_rides,
    COUNTIF(member_casual = 'member') AS member_rides
  FROM filtered_data
  GROUP BY start_hour
),

rider_totals AS (
  SELECT
    COUNTIF(member_casual = 'casual') AS total_casual_rides,
    COUNTIF(member_casual = 'member') AS total_member_rides
  FROM filtered_data
)

SELECT
  start_hour,
  total_rides,
  casual_rides,
  ROUND(
    SAFE_DIVIDE(casual_rides, total_casual_rides) * 100,
    2
  ) AS casual_percentage,
  member_rides,
  ROUND(
    SAFE_DIVIDE(member_rides, total_member_rides) * 100,
    2
  ) AS member_percentage

FROM hour_counts
CROSS JOIN rider_totals

ORDER BY start_hour;
