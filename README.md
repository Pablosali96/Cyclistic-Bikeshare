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

The datasets were divided into 12, each representing a month of the year, which contains 13 fields related to Ids, dates, locations, riders association status and type of bikes. All documents combined create a single dataset with 5.552.994 rows of data 
