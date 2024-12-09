
WITH combined_trips AS (
    SELECT 
        trip_distance
    FROM 
        taxi_trips
    WHERE 
        tpep_pickup_datetime BETWEEN '2024-01-01' AND '2024-01-31'
    
    UNION ALL
    
    SELECT 
        trip_miles AS trip_distance
    FROM 
        uber_trips
    WHERE 
        pickup_datetime BETWEEN '2024-01-01' AND '2024-01-31'
),
ranked_trips AS (
    SELECT 
        trip_distance,
        NTILE(100) OVER (ORDER BY trip_distance ASC) AS percentile_rank
    FROM 
        combined_trips
)
SELECT 
    MAX(trip_distance) AS percentile_95
FROM 
    ranked_trips
WHERE 
    percentile_rank = 95;
