--Data Cleaning
/*Created a new cleaned table with 7 more fields: start_date, start_hour, end_date, end_hour,
month,day_of_week and trip_duration_minutes*/
/*Negative values in trip_duration_minutes were brought to positive values with an 'absolute' function.
This decision was made as I have the assumption that these negative values come from an error in the data collection process
where the started_at and the ended_at were swaped*/ 

DROP TABLE IF EXISTS `2025_vivvy_tripdata.tripdata_cleaned`;

CREATE TABLE `2025_vivvy_tripdata.tripdata_cleaned` as(
  SELECT
    *,
    DATE(started_at) as start_date,
    EXTRACT(hour FROM started_at) as start_hour,
    DATE(ended_at) as end_date,
    EXTRACT(hour FROM ended_at) as end_hour,
    CASE 
    EXTRACT(MONTH FROM started_at)
      WHEN 1 THEN 'January'
      WHEN 2 THEN 'February'
      WHEN 3 THEN 'March'
      WHEN 4 THEN 'April'
      WHEN 5 THEN 'May'      
      WHEN 6 THEN 'June'
      WHEN 7 THEN 'July'
      WHEN 8 THEN 'August'
      WHEN 9 THEN 'September'
      WHEN 10 THEN 'October'      
      WHEN 11 THEN 'November'
      WHEN 12 THEN 'December'
    END AS month,
    CASE 
    EXTRACT(DAYOFWEEK FROM started_at)
      WHEN 1 THEN 'Sunday'
      WHEN 2 THEN 'Monday'
      WHEN 3 THEN 'Tuesday'
      WHEN 4 THEN 'Wednesday'
      WHEN 5 THEN 'Thursday'
      WHEN 6 THEN 'Friday'
      WHEN 7 THEN 'Saturday'    
    END AS day_of_week,
    abs(timestamp_diff(ended_at,started_at,minute)) as trip_duration_minutes
  FROM `2025_vivvy_tripdata.tripdata`
  WHERE start_station_name IS NOT NULL AND end_station_name IS NOT NULL
  AND abs(timestamp_diff(ended_at,started_at,minute)) <= 60
);


