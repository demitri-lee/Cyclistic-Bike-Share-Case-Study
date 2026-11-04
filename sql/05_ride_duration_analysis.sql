-- Cyclistic Bike-Share Case Study
-- Analysis 3: Ride Duration by Rider Type
-- Compares average and median ride duration for casual riders and annual members.

WITH filtered_data AS (
  SELECT
    member_casual,
    ride_length_minutes
  FROM
    `spartan-amphora-465916-r4.cyclistic_data.cyclistic_analysis_ready`
  WHERE
    ride_date >= DATE '2025-10-01'
    AND ride_date < DATE '2026-10-01'
)

SELECT
  member_casual,
  COUNT(*) AS ride_count,
  ROUND(AVG(ride_length_minutes), 2) AS average_ride_minutes,
  ROUND(
    APPROX_QUANTILES(ride_length_minutes, 100)[OFFSET(50)],
    2
  ) AS median_ride_minutes

FROM filtered_data

GROUP BY member_casual

ORDER BY member_casual;
