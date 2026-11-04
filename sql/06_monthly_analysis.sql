-- Cyclistic Bike-Share Case Study
-- Analysis 4: Ride Distribution by Month
-- Compares how each rider type's annual rides are distributed across the year.

WITH filtered_data AS (
  SELECT
    month_name,
    month_number,
    EXTRACT(YEAR FROM ride_date) AS ride_year,
    member_casual
  FROM
    `spartan-amphora-465916-r4.cyclistic_data.cyclistic_analysis_ready`
  WHERE
    ride_date >= DATE '2025-10-01'
    AND ride_date < DATE '2026-10-01'
),

month_counts AS (
  SELECT
    ride_year,
    month_name,
    month_number,
    COUNT(*) AS total_rides,
    COUNTIF(member_casual = 'casual') AS casual_rides,
    COUNTIF(member_casual = 'member') AS member_rides
  FROM filtered_data
  GROUP BY
    ride_year,
    month_name,
    month_number
),

rider_totals AS (
  SELECT
    COUNTIF(member_casual = 'casual') AS total_casual_rides,
    COUNTIF(member_casual = 'member') AS total_member_rides
  FROM filtered_data
)

SELECT
  ride_year,
  month_name,
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

FROM month_counts
CROSS JOIN rider_totals

ORDER BY
  ride_year,
  month_number;
