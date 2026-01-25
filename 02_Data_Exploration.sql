--Data Exploration

--Count of all values
SELECT
  COUNT(*)
FROM `2025_vivvy_tripdata.tripdata`;
--A total of 5,552,994 rows of data

--Count of the stations names
SELECT
  COUNT(DISTINCT start_station_name) as num_start_station,
  COUNT(DISTINCT end_station_name) as num_end_station
FROM `2025_vivvy_tripdata.tripdata`;
--there are 1893 distinct start station names and 1901 end station names

--Count of duplicate values within the ride_id field
SELECT
  COUNT(*) - COUNT(DISTINCT ride_id)
FROM `2025_vivvy_tripdata.tripdata`;
--6 duplicate values within the ride_id field

--Finding which ride_ids have duplicate values
SELECT
  ride_id,
  COUNT(ride_id)
FROM `2025_vivvy_tripdata.tripdata`
GROUP BY 1
HAVING COUNT(ride_id) > 1;

--Count of null values throughout the fields
SELECT 
  COUNT(*) - COUNT(ride_id) null_ride_id,
  COUNT(*) - COUNT(rideable_type) null_rideable_type,
  COUNT(*) - COUNT(started_at) null_started_at,
  COUNT(*) - COUNT(ended_at) null_ended_at,
  COUNT(*) - COUNT(start_station_name) null_start_station_name,
  COUNT(*) - COUNT(start_station_id) null_start_station_id,
  COUNT(*) - COUNT(end_station_name) null_end_station_name,
  COUNT(*) - COUNT(end_station_id) null_end_station_id,
  COUNT(*) - COUNT(start_lat) null_start_lat,
  COUNT(*) - COUNT(start_lng) null_start_lng,
  COUNT(*) - COUNT(end_lat) null_end_lat,
  COUNT(*) - COUNT(end_lng) null_end_lng,
  COUNT(*) - COUNT(member_casual) null_member_casual
FROM `2025_vivvy_tripdata.tripdata`;
/*The fields that present null values are: start_station_name, start_station_id, end_station_name
end_station_id, end_lat and end_lng*/

--Types of rideable bikes
SELECT DISTINCT 
  rideable_type
FROM `2025_vivvy_tripdata.tripdata`;
--Two types found: electric bikes and classic bikes

--Types of riders
SELECT DISTINCT
  member_casual
FROM `2025_vivvy_tripdata.tripdata`;
--There are indeed only two types of riders: members and casuals


