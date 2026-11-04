SELECT DISTINCT
  member_casual,

  COUNT(*) OVER (
    PARTITION BY member_casual
  ) AS ride_count,

  ROUND(
    AVG(ride_length_minutes) OVER (
      PARTITION BY member_casual
    ),
    2
  ) AS average_ride_minutes,

  ROUND(
    PERCENTILE_CONT(ride_length_minutes, 0.5) OVER (
      PARTITION BY member_casual
    ),
    2
  ) AS median_ride_minutes

FROM
  `spartan-amphora-465916-r4.cyclistic_data.cyclistic_analysis_ready`

WHERE
  ride_date >= DATE '2025-10-01'
  AND ride_date < DATE '2026-10-01'

ORDER BY
  member_casual;
