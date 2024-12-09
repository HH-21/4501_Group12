
WITH RECURSIVE hours AS (
    SELECT datetime('2023-09-25 00:00:00') AS hour
    UNION ALL
    SELECT datetime(hour, '+1 hour')
    FROM hours
    WHERE hour < datetime('2023-10-03 23:00:00')
),
hired_rides AS (
    SELECT 
        strftime('%Y-%m-%d %H:00:00', tpep_pickup_datetime) AS hour,
        COUNT(*) AS ride_count
    FROM 
        taxi_trips
    WHERE 
        tpep_pickup_datetime BETWEEN '2023-09-25' AND '2023-10-03 23:59:59'
    GROUP BY 
        hour
    
    UNION ALL
    
    SELECT 
        strftime('%Y-%m-%d %H:00:00', pickup_datetime) AS hour,
        COUNT(*) AS ride_count
    FROM 
        uber_trips
    WHERE 
        pickup_datetime BETWEEN '2023-09-25' AND '2023-10-03 23:59:59'
    GROUP BY 
        hour
),
rides_per_hour AS (
    SELECT 
        hour,
        SUM(ride_count) AS total_rides
    FROM 
        hired_rides
    GROUP BY 
        hour
),
weather_per_hour AS (
    SELECT 
        strftime('%Y-%m-%d %H:00:00', DATE) AS hour,
        SUM(Precipitation) AS total_precipitation,
        AVG(WindSpeed) AS avg_wind_speed
    FROM 
        hourly_weather
    WHERE 
        DATE BETWEEN '2023-09-25' AND '2023-10-03 23:59:59'
    GROUP BY 
        hour
)
SELECT 
    h.hour,
    COALESCE(r.total_rides, 0) AS total_rides,
    COALESCE(w.total_precipitation, 0.0) AS total_precipitation,
    COALESCE(w.avg_wind_speed, 0.0) AS avg_wind_speed
FROM 
    hours h
LEFT JOIN 
    rides_per_hour r ON h.hour = r.hour
LEFT JOIN 
    weather_per_hour w ON h.hour = w.hour
ORDER BY 
    h.hour ASC;
