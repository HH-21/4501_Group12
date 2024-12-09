
WITH daily_ride_counts AS (
    SELECT 
        DATE(tpep_pickup_datetime) AS trip_date,
        COUNT(*) AS total_rides
    FROM 
        taxi_trips
    WHERE 
        tpep_pickup_datetime BETWEEN '2020-01-01' AND '2024-08-31'
    GROUP BY 
        trip_date

    UNION ALL

    SELECT 
        DATE(pickup_datetime) AS trip_date,
        COUNT(*) AS total_rides
    FROM 
        uber_trips
    WHERE 
        pickup_datetime BETWEEN '2020-01-01' AND '2024-08-31'
    GROUP BY 
        trip_date
),
combined_daily_rides AS (
    SELECT 
        trip_date,
        SUM(total_rides) AS total_rides
    FROM 
        daily_ride_counts
    GROUP BY 
        trip_date
),
snowiest_days AS (
    SELECT 
        d.date,
        d.Snowfall AS total_snowfall,
        r.total_rides
    FROM 
        daily_weather d
    LEFT JOIN 
        combined_daily_rides r
    ON 
        d.date = r.trip_date
    WHERE 
        d.Snowfall > 0
)
SELECT 
    date,
    total_snowfall,
    total_rides
FROM 
    snowiest_days
ORDER BY 
    total_snowfall DESC
LIMIT 10;
