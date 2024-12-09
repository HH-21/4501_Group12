
CREATE TABLE IF NOT EXISTS hourly_weather (
    weather_id INTEGER PRIMARY KEY AUTOINCREMENT,
    date DATETIME UNIQUE, -- DATE column
    DewPointTemperature FLOAT,
    DryBulbTemperature FLOAT,
    Precipitation FLOAT,
    PresentWeatherType TEXT,
    RelativeHumidity FLOAT,
    Visibility FLOAT,
    WindDirection FLOAT,
    WindSpeed FLOAT
);

CREATE TABLE IF NOT EXISTS daily_weather (
    weather_id INTEGER PRIMARY KEY AUTOINCREMENT,
    date DATE UNIQUE, -- DATE column
    AverageDewPointTemperature FLOAT,
    AverageDryBulbTemperature FLOAT,
    AverageRelativeHumidity FLOAT,
    AverageWindSpeed FLOAT,
    Precipitation FLOAT,
    Snowfall FLOAT,
    SnowDepth FLOAT,
    PeakWindSpeed FLOAT
);

CREATE TABLE IF NOT EXISTS taxi_trips (
    trip_id INTEGER PRIMARY KEY AUTOINCREMENT,
    tpep_pickup_datetime DATETIME,
    tpep_dropoff_datetime DATETIME,
    trip_distance FLOAT,
    fare_amount FLOAT,
    total_amount FLOAT,
    mta_tax FLOAT,
    improvement_surcharge FLOAT,
    congestion_surcharge FLOAT,
    pickup_latitude FLOAT,
    pickup_longitude FLOAT,
    dropoff_latitude FLOAT,
    dropoff_longitude FLOAT
);

CREATE TABLE IF NOT EXISTS uber_trips (
    trip_id INTEGER PRIMARY KEY AUTOINCREMENT,
    request_datetime DATETIME,
    pickup_datetime DATETIME,
    trip_miles FLOAT,
    base_passenger_fare FLOAT,
    tolls FLOAT,
    sales_tax FLOAT,
    congestion_surcharge FLOAT,
    pickup_latitude FLOAT,
    pickup_longitude FLOAT,
    dropoff_latitude FLOAT,
    dropoff_longitude FLOAT
);
