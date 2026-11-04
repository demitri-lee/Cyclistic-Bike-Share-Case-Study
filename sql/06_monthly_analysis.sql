WITH filtered_data AS (
  SELECT *
  FROM `spartan-amphora-465916-r4.cyclistic_data.cyclistic_analysis_ready`
  WHERE
    ride_date >= DATE '2025-10-01'
    AND ride_date < DATE '2026-10-01'
),

month_counts AS (
  SELECT
    DATE_TRUNC(ride_date, MONTH) AS month,
    COUNT(*) AS total_rides,
    COUNTIF(member_casual = 'casual') AS casual_rides,
    COUNTIF(member_casual = 'member') AS member_rides
  FROM filtered_data
  GROUP BY month
),

rider_totals AS (
  SELECT
    COUNTIF(member_casual = 'casual') AS total_casual_rides,
    COUNTIF(member_casual = 'member') AS total_member_rides
  FROM filtered_data
)

SELECT
  month,
  total_rides,
  casual_rides,
  ROUND(
    100 * SAFE_DIVIDE(casual_rides, total_casual_rides),
    2
  ) AS casual_percentage,
  member_rides,
  ROUND(
    100 * SAFE_DIVIDE(member_rides, total_member_rides),
    2
  ) AS member_percentage
FROM month_counts
CROSS JOIN rider_totals
ORDER BY month;

ORDER BY
  ride_year,
  month_number;
