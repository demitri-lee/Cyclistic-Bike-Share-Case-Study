-- Cyclistic Bike-Share Case Study
-- Analysis 1: Ride Distribution by Day of Week
-- Compares how each rider type's annual rides are distributed across the week.

WITH filtered_data AS (
  SELECT
    day_of_week,
    day_of_week_number,
    member_casual
  FROM
    `spartan-amphora-465916-r4.cyclistic_data.cyclistic_analysis_ready`
  WHERE
    ride_date >= DATE '2025-10-01'
    AND ride_date < DATE '2026-10-01'
),

day_counts AS (
  SELECT
    day_of_week,
    day_of_week_number,
    COUNT(*) AS total_rides,
    COUNTIF(member_casual = 'casual') AS casual_rides,
    COUNTIF(member_casual = 'member') AS member_rides
  FROM filtered_data
  GROUP BY
    day_of_week,
    day_of_week_number
),

rider_totals AS (
  SELECT
    COUNTIF(member_casual = 'casual') AS total_casual_rides,
    COUNTIF(member_casual = 'member') AS total_member_rides
  FROM filtered_data
)

SELECT
  day_of_week,
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

FROM day_counts
CROSS JOIN rider_totals

ORDER BY day_of_week_number;
