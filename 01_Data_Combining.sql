--Data Combining

--Using drop as a preventinve measure
DROP TABLE IF EXISTS `2025_vivvy_tripdata.tripdata`;


CREATE TABLE IF NOT EXISTS `2025_vivvy_tripdata.tripdata` AS (
  SELECT * FROM `2025_vivvy_tripdata.202501_tripdata`
  UNION ALL 
  SELECT * FROM `2025_vivvy_tripdata.202502-tripdata`
  UNION ALL
  SELECT * FROM `2025_vivvy_tripdata.202503-tripdata`
  UNION ALL
  SELECT * FROM `2025_vivvy_tripdata.202504_tripdata`
  UNION ALL
  SELECT * FROM `2025_vivvy_tripdata.202505_tripdata`
  UNION ALL
  SELECT * FROM `2025_vivvy_tripdata.202506_tripdata`
  UNION ALL
  SELECT * FROM `2025_vivvy_tripdata.202507_tripdata`
  UNION ALL
  SELECT * FROM `2025_vivvy_tripdata.202508_tripdata`
  UNION ALL
  SELECT * FROM `2025_vivvy_tripdata.202509_tripdata`
  UNION ALL
  SELECT * FROM `2025_vivvy_tripdata.202510_tripdata`
  UNION ALL
  SELECT * FROM `2025_vivvy_tripdata.202511_tripdata`
  UNION ALL
  SELECT * FROM `2025_vivvy_tripdata.202512-_tripdata`
);
