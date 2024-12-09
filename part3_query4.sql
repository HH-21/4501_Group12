
WITH daily_ride_counts AS (
    SELECT 
        DATE(tpep_pickup_datetime) AS trip_date,
        COUNT(*) AS total_rides,
        AVG(trip_distance) AS avg_distance
    FROM 
        taxi_trips
    WHERE 
        tpep_pickup_datetime BETWEEN '2023-01-01' AND '2023-12-31'
    GROUP BY 
        trip_date
    
    UNION ALL
    
    SELECT 
        DATE(pickup_datetime) AS trip_date,
        COUNT(*) AS total_rides,
        AVG(trip_miles) AS avg_distance
    FROM 
        uber_trips
    WHERE 
        pickup_datetime BETWEEN '2023-01-01' AND '2023-12-31'
    GROUP BY 
        trip_date
),
combined_daily_rides AS (
    SELECT 
        trip_date,
        SUM(total_rides) AS total_rides,
        AVG(avg_distance) AS avg_distance
    FROM 
        daily_ride_counts
    GROUP BY 
        trip_date
),
busiest_days AS (
    SELECT 
        trip_date,
        total_rides,
        avg_distance
    FROM 
        combined_daily_rides
    ORDER BY 
        total_rides DESC
    LIMIT 10
)
SELECT 
    b.trip_date AS date,
    b.total_rides AS total_rides,
    b.avg_distance AS avg_distance,
    w.Precipitation AS avg_precipitation,
    w.AverageWindSpeed AS avg_wind_speed
FROM 
    busiest_days b
LEFT JOIN 
    daily_weather w
ON 
    b.trip_date = w.date
ORDER BY 
    b.total_rides DESC;
