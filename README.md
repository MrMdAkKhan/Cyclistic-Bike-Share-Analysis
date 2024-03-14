# Cyclistic-Bike-Share-Analysis
## Scenario
You are a junior data analyst working in the marketing analyst team at Cyclistic, a bike-share company in Chicago. The director of marketing believes the company’s future success depends on maximizing the number of annual memberships. Therefore, your team wants to understand how casual riders and annual members use Cyclistic bikes differently. From these insights, your team will design a new marketing strategy to convert casual riders into annual members. But first, Cyclistic executives must approve your recommendations, so they must be backed up with compelling data insights and professional data visualizations.
## About Cyclistic
Cyclistic is a bike-share company based in Chicago that launched a successful bike-sharing program in 2016. Throughout the years, the program has expanded significantly to a fleet of 5,824 bicycles and a network of 692 geotracked stations sprawled across the city. With the large number of bicycles across numerous stations, customers can rent bikes from one station and return them to any other station within the network at their convenience. This encourages people to opt for cycling as a mode of transportation, therefore contributing to the success of Cyclistic's bike-sharing program.

Cyclistic's marketing strategy has so far focused on building general awareness and appealing to broad consumer segments. The company offers flexibile pricing plans that cater to diverse needs of users including single-ride passes, full-day passes, and annual memberships. Besides, it provides reclining bikes, hand tricycles, and cargo bikes, effectively welcoming individuals with disabilities and those who can't ride on the standard two-wheeled bicycles. Based on the company database, Cyclistic users are more likely to ride for leisure, but about 30% use them to commute to work each day. While traditional bikes remain as the popular option, around 8% of users opt for the assistive alternatives.

## The Stakeholders
> 1. **Lily Moreno**: The director of marketing and my manager. Moreno is responsible for the development of campaigns and initiatives to promote the bike-share program.
> 2. **Cyclistic marketing analytics team**: A team of data analysts who are responsible for collecting, analyzing, and reporting data that helps guide Cyclistic marketing strategy.
> 3. **Cyclistic executive team**: A notoriously detail-oriented team which will decide whether to approve the recommended marketing program.

## Data Analysis Process
## Ask Phase:
How do annual members and casual riders use Cyclistic bikes differently?

I need to analyze how annual members and casual riders use bikes differently by exploring the following:
* Percentage of Casual Riders vs Annual Members
* Proportion of Rides by Bike Type
* Total riders per month
* Number of Rides per Day
* Average Ride Duration by Day (in minutes)
* Frequency of Rides per Hour
* Top places where most of the riders started their trip.

## Prepare Phase:
### 2.1 Data source used:
* **Data source:** [Link](https://divvy-tripdata.s3.amazonaws.com/index.html?trk=article-ssr-frontend-pulse_little-text-block)

* **Data information:** Public Data, dataset made available through Motivate International Inc. under a license from divvybikes.com.

* Cyclistic is a fictional company. For the purposes of this case study, the datasets are appropriate and will enable to answer the business questions.
Since this is a public data or open source information, we can use this for the capstone project.

### 2.2 Data credibility:
* The ROCCC method which stands for Reliable, Original, Comprehensive, Current, and Cited, will be used to determine the credibility and integrity of the data source provided.
The data we are working on is first-party type: data collected and used by Cyclistic.
The data integrity was checked and deemed unbiased.

### 2.3 Dataset analysed:
* The Cyclistic’s dataset has the historical trip data from 2023, separeted in csv. files to analyze and identify trends.

### Tools used in Analysis
* PostgreSQL – pgAdmin4
* Microsoft Power BI

## Process Phase:
### Data Cleaning and Transformation in SQL:
* **Checking for Duplicates:** The duplicate values were examined and filtered out. This helped ensure data integrity and eliminate any duplicated entries.
* **Validating Column Values:** The values in specific columns, such as rideable_type and member_casual, were verified to ensure consistency and accuracy. The only valid values, including classic_bike, docked_bike, electric_bike for rideable_type, and casual, member for member_casual, were retained.
* **Removing Blank Values:** The data set was checked for incomplete or blank values across all columns. Rows with missing values, particularly in columns like start_station_name, start_station_id, end_station_name, and end_station_id, were removed to ensure data completeness.
* **Adding Columns:** Columns Like start_day_of_week, started_month, started_hour, ride_length_in_minutes were added to calculate ride length, day of the week and month when the ride started, as well as the hour of the day.
* **Importing Data:** The monthly files containing the ride data were imported into SQL Server.
* **Merging Data:** A new table named “cyclistic_annual_data” was created to store the consolidated data for the entire year.The data from tables were merged into the “cyclistic_annual_data” table using the UNION ALL statement.
* **Manipulate Data:** After merging and filtering data a new table named “filtered_cyclistic_annual_data” was generated. This table includes additional columns such as “month,” “day,” “hour,” and “duration_minutes” to facilitate the comparison and analysis of ride frequencies.

## Analyze Phase:
1. Which bike is the most used for both members and casual riders?

Member:

![file1](https://github.com/MrMdAkKhan/Cyclistic-Bike-Share-Analysis/assets/163100067/7c3ec42d-0c51-48c1-9eb9-9db6f0009724)

Casual:

![file 2](https://github.com/MrMdAkKhan/Cyclistic-Bike-Share-Analysis/assets/163100067/0094230c-f23e-4459-8aca-fdf73458cbc7)

2. How many members and casual riders does Cyclistic have?

Member:

![file 2-1](https://github.com/MrMdAkKhan/Cyclistic-Bike-Share-Analysis/assets/163100067/417ac19c-3fda-4ee7-a60b-6471007dee32)

Casual:

3. Which day has the most number of riders for both members and casual riders?

Member:

![file3](https://github.com/MrMdAkKhan/Cyclistic-Bike-Share-Analysis/assets/163100067/e0947517-31c7-4237-ae67-17c3a8a7219e)

Casual:

![file 3-1](https://github.com/MrMdAkKhan/Cyclistic-Bike-Share-Analysis/assets/163100067/04aed2e4-a4e4-47fb-92c8-d0c73c253225)

4. Which month has the most number of riders for both members and casual riders?

Member:

![file 4](https://github.com/MrMdAkKhan/Cyclistic-Bike-Share-Analysis/assets/163100067/1841fbb3-932e-49db-a479-03daf3d77519)

Casual:

![file 4-1](https://github.com/MrMdAkKhan/Cyclistic-Bike-Share-Analysis/assets/163100067/89c5b825-5326-4b28-8328-fcb8a2c62966)

5. What time do both users usually start their trip?

 ![file 5](https://github.com/MrMdAkKhan/Cyclistic-Bike-Share-Analysis/assets/163100067/91db6f1e-4dc1-4bc5-92d7-0217ac5083a2)


8. Where do the users usually start their trip?

Member:

![file 6-1](https://github.com/MrMdAkKhan/Cyclistic-Bike-Share-Analysis/assets/163100067/f5f021a3-4b94-4397-afc3-a32e4b1b23f4)

Casual:

![file 6](https://github.com/MrMdAkKhan/Cyclistic-Bike-Share-Analysis/assets/163100067/a9239193-2761-49eb-b601-627c2fbc3d88)
