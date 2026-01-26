# Cyclistic Bike-share Case Study Project

## Introduction
This project is part of the **Google Analytics Professional Certificate**. Here, I'll follow the steps and guidelines taught throughout the course to tackle problems faced by the fictional company **Cyclistic Bike-share** with the methodology of: **ask, prepare, process, analyze, share and act. This is the last step to culminate the certificate and, at the end, I'll be able to create a project to add to my portfolio ready to show to the world.

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

Here you can find the links for the SQL queries within the project:
- [Data Combining](https://github.com/Pablosali96/Cyclistic-Bikeshare/blob/c8a66fad930cf9e613a2419ee7ffdbf6a109a758/01_Data_Combining.sql) 
- [Data Exploration](https://github.com/Pablosali96/Cyclistic-Bikeshare/blob/c8a66fad930cf9e613a2419ee7ffdbf6a109a758/02_Data_Exploration.sql)
- [Data Cleaning](https://github.com/Pablosali96/Cyclistic-Bikeshare/blob/c8a66fad930cf9e613a2419ee7ffdbf6a109a758/03_Data_Cleaning.sql)
- [Data Analysis](https://github.com/Pablosali96/Cyclistic-Bikeshare/blob/c8a66fad930cf9e613a2419ee7ffdbf6a109a758/04_Data%20Analysis.sql)

Note: Even though the scenario and the company are fictional, the data provided is real.

I decided to use the most recent and available data from the year 2025. This will be useful overall, as the results from this project, even though this is out of the scope of the project, can be compared with those of previous projects and years. It can tell us how the patterns of behavior of the annual members and casual riders have evolved overtime.

The tools used for this project are as follows:
1. **Excel**: Used to execute a quick scan of the data and to change the data type of some columns (started_at and ended_at fields) for an easier transition into the next tool.
2. **Google Storage**: Used to store all the datasets as some of them were too heavy to upload locally to Google BigQuery
3. **Google BigQuery**: Used to communicate with the datasets via SQL. Here is where most of the work takes place, from data combining, to data cleaning and data analysis.
4. **Tableau Public**: Used to visualize the data, this helps stakeholders to digest the information in an easier way with the production of dashboards.

The datasets were divided into 12, each representing a month of the year, which contained 13 fields related to Ids, dates, locations, riders association status and type of bike. All documents combined create a single dataset with 5.552.994 rows of data.

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
1. Excel: Change the types of the previously mentioned columns to a more timestamp standard format as it allowed me to process it easily in BigQuery once I uploaded the data.
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

Note: To calculate the trip duration, I used a function to convert all the results of the difference from start to end to their absolute value as some of the values encountered were negative. My assumption is that there was an error within the tracking system which swapped the started_at and ended_at dates creating these values. I kept those values and performed my analysis following said assumption.

3. Filtered the data to exclude null values within the columns start_station_name and end_station_name. 
4. Filtered the data to allow trip_duration_minutes values within the range of 0 to 60 minutes. This range was chosen as activities and trips performed outside of said range were considered out of the behavior of regular bikes(outliers).

With these measures, the final dataset has 3.600.473 out of the 5.552.994 rows of data (around 64% of the combined dataset). 

### Step 4. Analysis 

- **Totals Rides per Type of Rider**
  
![image alt](https://github.com/Pablosali96/Cyclistic-Bikeshare/blob/dc658217c0f8fc9d3093ff8150b3735f1d2b22fd/Cyclistic%20Images/Distribution%20Members-Casual.png)

<ins>65.43%</ins> of riders are annual members while casual riders represent <ins>34.57%</ins> of riders. This goes against my initial assumption. Starting this project I thought that casual riders would represent most of the total riders.


-**Bike Types per Type of Rider**
<img width="1238" height="712" alt="Distribution Bikes Type" src="https://github.com/user-attachments/assets/abfe79c3-965f-41af-ae40-865d574b3d38" />

We can see that **Annual members** are more eager to use classic bikes than electric bikes (54% to 46% respectively), while **Casual riders** opt to use electric bikes with more frequency than classic bikes (51% to 49% respectively). In previous years, there was another type of bike called **docked bikes** but this was not found within the 2025 data.


-**Most Frequent Hours For Rides**
<img width="1233" height="714" alt="Screenshot 2026-01-24 071034" src="https://github.com/user-attachments/assets/ffd4a9df-e2c7-4295-9048-e80487353a55" />

Both **Annual members** and **Casual riders** use the bikes with more frequency in the afternoon hours (3pm to 6 pm). The former differentiates from the latter with two peaks of activity in the morning hours of 7-8 am. This could mean that **Annual Members** are using Cyclistic bikes for morning activities such as exercise or to commute to work, while **Casual riders** may be taking advantage of the afternoon hours to exercise, explore the city or to socialize.


-**Days of the Week**

<img width="1644" height="790" alt="Screenshot 2026-01-24 072221" src="https://github.com/user-attachments/assets/74451ab5-4ef9-4a7e-ba39-f42af1aab839" />


There are some interesting trends here:
-**Annual members** use the cyclistic bikes more often on the weekdays, with weekends being given less priority. This may support the theory that these members use their bikes to commute to work or as exercise pre-work or study activities.
-**Casual riders**, on the contrary, use cyclistic bikes on the weekends, with **saturday** being the peak. These members may be taking advantage of the time and freedom from work activities to engage on the points previously mentioned in the graph before.

-**Number of Rides per Month**

<img width="1236" height="713" alt="Number of Rides per Month" src="https://github.com/user-attachments/assets/61e4bdc7-db15-49e6-89ca-d3de0c642686" />

Both groups take advantage of the summer months (June-July-August), with good weather, more activities around the city and better capacity to enjoy the beaches. **Annual members** do extend their activity peak to halfway through Autumn (September-Obtober) plummeting their riding activities afterwards, while **Casual riders** start slowing down just as the summer comes to an end.


-**Trip duration length per Group**

<img width="1238" height="716" alt="Distribution Trip Duration" src="https://github.com/user-attachments/assets/27add34a-cded-4d02-ab33-e5e6e81ce5e5" />

An interesting observation in this graph comes from the time bin of 0 to 5-minute trips, where both groups present higher activities than the average with **Annual members** being predominant in this category. This is something that needs to be looked after with greater detail: What is the distribution in this time bin alone? Where could these short trips lead users to? Is this information accurate?

Nonetheless, **Annual members** engage more on trips from 0 to 20 minutes, which might be a more supporting factor in the theory previously mentioned. **Casual riders** do spread themselves a bit more throughout the different time bins having an additional time being (20-25 minutes) above average. This group of riders may be using cyclistic bikes to explore further, to more distant places; they also could be more prone to not dock the bikes after each use.


-**Annual members maps**

For the analysis of both maps (start and end station names) for both groups (annual members and casual riders), I decided to select the top 200 stations as I found 1893 distinct start station names and 1901 end station names.

<img width="1628" height="777" alt="Station Map Annual Members" src="https://github.com/user-attachments/assets/b04cd573-127d-4862-8539-db4a91e4fc7a" />


Annual members are more prone to start and end their rides around the areas of West Loop Gate and River North:
- Kingsbury St & Kinzie St: 26k rides
- Clinton St & Washington Blvd: 22k rides
- Clinton St & Madison St: 19k rides
- Canal St & Madison St: 19k rides

These stations remain consistent for both beginning and end of the trips.

-**Casual members maps**

<img width="1632" height="781" alt="Station Map Casual Riders" src="https://github.com/user-attachments/assets/69ca9f2e-f974-4be3-ac3f-7768af9c6171" />



Casual riders frequent more the beaches and the roads along the coast, as well as Grant Parl and the Museum Campus:
- DuSable Lake Shore Dr & Monroe St: 24k rides
- Navy Pier: 22k rides
- DuSable Lake Shore Dr & North Blvd: 17k rides
- Michigan Ave & Oak St: 17k rides


### Step 5. Share

<img width="1645" height="793" alt="Cyclistic 1" src="https://github.com/user-attachments/assets/ffcb688e-c215-4a7e-a2c6-88bccde0cc00" />
<img width="1645" height="793" alt="Cyclistic 2" src="https://github.com/user-attachments/assets/5314d41f-9782-4fcc-bdac-5f0951807b01" />

Link to view the [Tableau Dashboard](https://public.tableau.com/app/profile/juan.pablo.alvarez5922/viz/CyclisticBikeshareAnalysis_17693104188700/DistributionMembers-CasualRiders)


These are the main differences we can see from each groups:

| Annual Members | Casual Riders |
| -- | -- |
| Peak activity in hours of commute to and from work (7-8 am & 3-6 pm) | Peak activity hours throughout the afternoon |
| Use classic bikes with more frequency | Use electric bikes with more frequency |
| More active on the weekdays | More active on the weekends |
| Externd their activity peak all summer through the middle of autumn | Peak activity on the summer months decreasing as autumn comes |
| Prone to use cyclistic bikes for trips up to 20 min | Prone to extend their bike ride duration more evenly |
| More usage of cyclistic bikes near the urban central area of chicago city | More usage of cyclistic bikes near the beach and other touristic places  |

### Step 6. Act

After identifying how casual riders behave with the previous analysis, my top <ins>recommendations</ins> are as follow:

1. <ins>Advertisement</ins>.
   
   We should start promoting cyclistic bike-share services eagerly in the months of spring in preparation for the summer months when both groups start getting active. This can be a great opportunity to show what the company has to offer in conjunction with places of interest around the city which may attract the attention of potential customers. We could also advertise group events in and out of the cyclistic bike-share company, such as group rides to explore the city or festivals around the city which could be accessed with bikes.

2. <ins>Monthly membership</ins>

   A new tier of **membership of monthly usage** could be enticing for riders who may come to the city for a season or for those who want to take advantage of the membership perks without having to commit for the whole year. This also allows users to have a taste of the membership experience, which may change their minds aboout purchasing an annual membership.

3. <ins>Seasonal membership</ins>

   A **summer membership** or summer deal could be created where members pay lower prices and/or be offered discounts on touristic places such as restaurants along the beach, museums, zoos or businesses in popular parks. This will fit well as summer is the busiest season for the company for both groups.

## Conclusion
Cyclistic Bike-share is doing a good job already on the proportion of annual members to casual riders. I am sure that with these recommendations, the company will be able to increase even further the number of members by tackling the areas where casual riders operate, their patterns and behaviors.

