--Data Analysis

--Count of rows after data cleaning
SELECT
  COUNT(*)
FROM `2025_vivvy_tripdata.tripdata_cleaned`;
--3.600.473 rows of data remaining

--Frequency of each rider type
SELECT
  member_casual,
  COUNT(*)
FROM `2025_vivvy_tripdata.tripdata_cleaned`
GROUP BY 1;
--Up to the end of 2025, there 1.8 times more members than casual riders

--Frequency of each bike type
SELECT
  rideable_type,
  COUNT(*)
FROM `2025_vivvy_tripdata.tripdata_cleaned`
GROUP BY 1;
--Up to the end of 2025, there 1.9 times more electric bikes than classic bikes

--Hour of the day frequency by type of rider
SELECT
  member_casual,
  start_hour,
  COUNT(start_hour)
FROM `2025_vivvy_tripdata.tripdata_cleaned`
WHERE started_at IS NOT NULL AND ended_at IS NOT NULL
GROUP BY 1,2
ORDER BY 1,3 DESC;
/*Overall, the hours of the afternoon are the most active for casual and member users, but they differ slightly with 
members having a peak in the morning(7-9am) and casual using bikes more throught the afternoon*/

--Day of the week frequency
SELECT
  day_of_week,
  COUNT(*)
FROM `2025_vivvy_tripdata.tripdata_cleaned`
GROUP BY 1
ORDER BY 2 DESC;
--Even those, most of the days were quite close in activity, the days close and beginning the weekend were the ones with the highest frequency

--Months frenquecy
SELECT 
  month,
  COUNT(*)
FROM `2025_vivvy_tripdata.tripdata_cleaned`
GROUP BY 1
ORDER BY 2 DESC;
--The months in the Q3 were the ones were the most activity was seen in the data, with months close to them following in frequency, this may be due to the summer season, with good weather, hectic neihgbourhoods and a better disposition for people to engage in outdoor activities

--Distribution of trip duration
SELECT
  member_casual,
  CASE
    WHEN trip_duration_minutes >=0 AND trip_duration_minutes <5 THEN '[0-5]'
    WHEN trip_duration_minutes >=5 AND trip_duration_minutes <10 THEN '[5-10]'
    WHEN trip_duration_minutes >=10 AND trip_duration_minutes <15 THEN '[10-15]'
    WHEN trip_duration_minutes >=15 AND trip_duration_minutes <20 THEN '[15-20]'
    WHEN trip_duration_minutes >=20 AND trip_duration_minutes <25 THEN '[20-25]'
    WHEN trip_duration_minutes >=25 AND trip_duration_minutes <30 THEN '[25-30]'
    WHEN trip_duration_minutes >=30 AND trip_duration_minutes <35 THEN '[30-35]'
    WHEN trip_duration_minutes >=35 AND trip_duration_minutes <40 THEN '[35-40]'
    WHEN trip_duration_minutes >=40 AND trip_duration_minutes <45 THEN '[40-45]'
    WHEN trip_duration_minutes >=45 AND trip_duration_minutes <50 THEN '[45-50]'
    WHEN trip_duration_minutes >=50 AND trip_duration_minutes <55 THEN '[50-55]'
    WHEN trip_duration_minutes >=55 AND trip_duration_minutes <60 THEN '[55-60]'
    ELSE '[60+]'
  END as time_duration_bins,
  COUNT(*) as number_of_rides
FROM `2025_vivvy_tripdata.tripdata_cleaned`
GROUP BY 1,2
ORDER BY 1,3 DESC;
/*Both members and casual riders have a peak duration at the interval of 5-10 minutes of travel,
members show a higher concentration in the interval of 0-5 minutes while
casual riders are more spread across the board.
*/

--Exploratory Analysis of the duration of trips
SELECT
  COUNT(trip_duration_minutes) as number_of_trips,
  ROUND(AVG(trip_duration_minutes),2) as avg_trip_duration,
  MIN(trip_duration_minutes) as min_trip_duration,
  MAX(trip_duration_minutes) as max_trip_duration,
  ROUND(STDDEV(trip_duration_minutes),2) as std_trip_duration,
  ROUND(VARIANCE(trip_duration_minutes),2) as var_trip_duration
FROM `2025_vivvy_tripdata.tripdata_cleaned`;

SELECT 
  member_casual, 
  day_of_week, 
  ROUND(AVG(trip_duration_minutes),2) AS avg_trip_duration, 
  ROUND(AVG(AVG(trip_duration_minutes)) OVER(PARTITION BY member_casual),2) AS overall_average,
  CASE
    WHEN ROUND(AVG(trip_duration_minutes),2) > ROUND(AVG(AVG(trip_duration_minutes)) OVER(PARTITION BY member_casual),2) THEN 'Above Average'
    WHEN ROUND(AVG(trip_duration_minutes),2) = ROUND(AVG(AVG(trip_duration_minutes)) OVER(PARTITION BY member_casual),2) THEN 'Same as Average'
    ELSE 'Below Average'
  END AS average_status
FROM `2025_vivvy_tripdata.tripdata_cleaned`
GROUP BY 1,2
ORDER BY 1;
