WITH filtered_data AS (
  SELECT *
  FROM `spartan-amphora-465916-r4.cyclistic_data.cyclistic_analysis_ready`
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

ranked_stations AS (
  SELECT
    *,
    ROW_NUMBER() OVER (
      PARTITION BY member_casual
      ORDER BY ride_count DESC
    ) AS station_rank,

    SUM(ride_count) OVER (
      PARTITION BY member_casual
    ) AS total_known_station_rides
  FROM station_counts
)

SELECT
  member_casual,
  station_rank,
  start_station_name,
  ride_count,
  ROUND(
    100 * SAFE_DIVIDE(ride_count, total_known_station_rides),
    2
  ) AS percentage_of_known_start_station_rides
FROM ranked_stations
WHERE station_rank <= 10
ORDER BY
  member_casual,
  station_rank;
