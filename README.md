# NYC Taxi vs Uber Analysis Project

## Overview
This project analyzes NYC Yellow Taxi and Uber ride data from January 2020 through August 2024, combined with local weather data, to understand various trends and patterns in hired rides across New York City. The analysis includes data preprocessing, database storage, and visualization of key metrics such as ride patterns, pricing, and weather impacts.

## Project Components

### 1. Data Preprocessing
- Downloaded and cleaned Yellow Taxi and Uber (HVFHV) trip data using Python
- Implemented Cochran's sampling formula to manage large datasets
- Converted location IDs to coordinates using taxi zone shapefiles
- Filtered trips within NYC geographical boundaries
- Normalized data formats and column names
- Handled missing values and removed invalid entries

### 2. Data Storage
- Created SQLite database with four main tables:
  - Yellow taxi trips
  - Uber trips
  - Hourly weather data
  - Daily weather data
- Implemented appropriate schema with proper data types
- Created SQL queries for data analysis

### 3. Data Analysis
Implemented 6 SQL queries to answer questions such as:
- Most popular hours for taxi rides
- Most popular days for Uber rides
- Trip distance analysis
- Weather impact on ride patterns
- Special event analysis (e.g., Tropical Storm Ophelia impact)

### 4. Data Visualization
Created visualizations including:
- Hourly ride patterns
- Monthly ride trends with confidence intervals
- Airport destination analysis
- Fare comparison analysis
- Weather impact on tips
- Geospatial ride distribution

## Technologies Used
- Python 3.10+
- Pandas & GeoPandas
- SQLite & SQLAlchemy
- Matplotlib
- BeautifulSoup
- Requests
- Other supporting libraries (see requirements.txt)

## Group Information
- Group Name: IEOR 4501 Group 12
- Group Member: Xibei Li and Hao Huang
- UNIs: [xl3465, hh3087]