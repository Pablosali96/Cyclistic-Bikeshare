# Cyclistic Bikeshare Case Study Project

## Introduction
This project is part of the **Google Analytics Professional Certificate**. Here, I'll follow the steps and guidelines taught throughout the course to tackle problems faced by the fictional company **Cyclistic Bike-share** with the methodology of: **ask, prepare, process, analyze, share and act. This is the last step to culminate the certificate and, at the end, I'll be able to create a project to add to my portofolio ready to show to the world.

## Context
I'm a junior data analyst working on the marketing analyst team at Cyclistic, a bike-share company in Chicago. The director of marketing believes the company’s future success depends on maximizing the number of annual memberships. Therefore, your team wants to understand how casual riders and annual members use Cyclistic bikes differently. From these insights, your team will design a new marketing strategy to convert casual riders into annual members. But first, Cyclistic executives must approve your recommendations, so they must be backed up with compelling data insights and professional data visualizations.

**Cyclistic Bike-share** is a company that features more than 5,824 bicycles that are geotracked and locked into a network of 692 stations across
Chicago. Cyclistic sets itself apart by also offering reclining bikes, hand tricycles, and cargo bikes, making bike-share more inclusive to people with disabilities and riders who can’t use a standard two-wheeled bike. The bikes can be unlocked from one station and returned to any other station in the system anytime.

## Approach

### Step 1. Ask
Three questions will guide the future marketing program:
1. How do annual members and casual riders use Cyclistic bikes differently?
2. Why would casual riders buy Cyclistic annual memberships?
3. How can Cyclistic use digital media to influence casual riders to become members?

Lily Moreno, The director of marketing and my manager, assigned me the first task: an analysis into the behaviours of annual members and casual riders.

This will be the deliverables for this project:
1. A description of all data sources used
2. Documentation of any cleaning or manipulation of data
3. A summary of your analysis
4. Supporting visualizations and key findings
5. Your top three recommendations based on your analysis

### Step 2. Prepare
The following data has been made available by Motivate International Inc. under the following [license](https://divvybikes.com/data-license-agreement).
Source of the data: [divvy-tripdata](https://divvy-tripdata.s3.amazonaws.com/index.html)

Note: Even thought the scenario and the company are fictional, the data provided is real

I decided to use the most recent and available data from the year 2025. This will be usefull overall as the results from this project, even though this is out of the scope of the project, can be compared with those of prevous project and years. It can tell us how the patterns of behaviour from the annual members and casual riders have evolved overtime.

The tools used for this project are as follow:
1. **Excel**: Used to execute a quick scan of the data and the change the data type of some columns (started_at and ended_at fields) for an easier transition into the next tool.
2. **Google Storage**: Used to store all the datasets as some of them were too heavy to upload locally to Google BigQuery
3. **Google BigQuery**: Used to communicate with the datasets via SQL, here is where most of the work took place, from data combining, to data cleaning and data analysis.
4. **Tableau Public**: Used to visualize the data, this helps stakeholders to digest the information in an easier way with the production of dashboards.

The datasets were divided into 12, each representing a month of the year, which contains 13 fields related to Ids, dates, locations, riders association status and type of bikes. All documents combined create a single dataset with 5.552.994 rows of data.

| No. | Field | Type | Description |
| --| -- | -- | -- |
| 1 | ride_id | String | Id of each ride |
| 2 | rideable_type | String | Types of bike: electric or casual |
| 3 | started_at | Timestamp | Date and hour at the beginning of the trip |
| 4 | ended_at | Timestamp | Date and hour at the end of the trip |
| 5 | start_station_name | String | Name of the station at the beginning of the trip |
| 6 | start_station_id | String | ID of the station at the beginning of the trip |
| 7 | end_station_name | String | Name of the station at the end of the trip |
| 8 | end_station_id | String | ID of the station at the end of the trip |
| 9 | start_lat | Float | Latitud at the beginning |
| 10 | start_lng | Float | Longitud at the beginning |
| 11 | end_lat | Float | Latitud at the end |
| 12 | end_lng | Float | Longitud at the end |
| 13 | member_casual | String | Rider status: annual member or casual rider |

### Step 3. Process

For the data cleaning process, I made sure to:
1. Excel: Change the types of the previously mentioned columns to a more timestamp standard format as it allowed me to process it easier in BigQuery once I uploaded the data.
2. On BigQuery: created 7 more columns using the fields started_at and ended_at:
   
| No. | Field | Type | Description |
| --| -- | -- | -- |
| 1 |start_date | Date | Date at the start of the trip |
| 2 | start_hour | Integer | Hour (0-23) at the start of the trip |
| 3 | end_date | Date | Date at the end of the trip |
| 4 | end_hour | Integer | Hour (0-23) at the end of the trip |
| 5 | month | String | List of months |
| 6 | day_of_week | String | List of day of the week with Sunday being the first |
| 7 | trip_duration_minutes | Integer | Duration in minutes of the trip from start to end |

Note: To calculate the trip duration, I used a function to convert all the result of the differece from start to end to their abolute value, some of the values encountered were negative. My assumption is that there was an error withing the tracking system which swaped the started_at and ended_at dates creating these values. I kept those values and performed my analysis following said assumption.

3. Filtered the data to exclude null values within the columns start_station_name and end_station_name. 
4. Filtered the data to allow trip_duration_minutes values within the range of 0 to 60 minutes. This range was chosen as activities and trips perfomed out of said range were considered out of the behaviour of regular bikes(outliers).

With these measures, the final dataset has 3.600.473 out of the 5.552.994 rows of data (around 64% of the combined dataset). 

### Step 4. Analysis 

- **Totals Rides per Type of Rider**
  
![]("C:\Users\juanp\Pictures\Screenshots\Member vs Casual  Total.png")
