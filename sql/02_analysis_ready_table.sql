-- Cyclistic Bike-Share Case Study
-- Analysis-Ready Table
-- Adds date, weekday, month, and hour fields used in the final analysis.

CREATE OR REPLACE TABLE
  `spartan-amphora-465916-r4.cyclistic_data.cyclistic_analysis_ready` AS

SELECT
  *,
  DATE(started_at) AS ride_date,
  FORMAT_DATE('%A', DATE(started_at)) AS day_of_week,
  EXTRACT(DAYOFWEEK FROM started_at) AS day_of_week_number,
  FORMAT_DATE('%B', DATE(started_at)) AS month_name,
  EXTRACT(MONTH FROM started_at) AS month_number,
  EXTRACT(HOUR FROM started_at) AS start_hour

FROM
  `spartan-amphora-465916-r4.cyclistic_data.cyclistic_all_trips_clean`;
