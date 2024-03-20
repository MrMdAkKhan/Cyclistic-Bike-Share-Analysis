# Cyclistic-Bike-Share-Analysis

![Logo Image](https://github.com/MrMdAkKhan/Cyclistic-Bike-Share-Analysis/assets/163100067/e630f404-7a2c-4334-904a-bac9f9ee337f)


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
* MS Excel
* Microsoft Power BI

## Process Phase:
### Data Cleaning and Transformation in SQL:
SQL Query : [Link](https://github.com/MrMdAkKhan/Cyclistic-Bike-Share-Analysis/blob/main/Analysis%20using%20SQL.sql)

* **Checking for Duplicates:** The duplicate values were examined and filtered out. This helped ensure data integrity and eliminate any duplicated entries.
* **Validating Column Values:** The values in specific columns, such as rideable_type and member_casual, were verified to ensure consistency and accuracy. The only valid values, including classic_bike, docked_bike, electric_bike for rideable_type, and casual, member for member_casual, were retained.
* **Removing Blank Values:** The data set was checked for incomplete or blank values across all columns. Rows with missing values, particularly in columns like start_station_name, start_station_id, end_station_name, and end_station_id, were removed to ensure data completeness.
* **Adding Columns:** Columns Like start_day_of_week, started_month, started_hour, ride_length_in_minutes were added to calculate ride length, day of the week and month when the ride started, as well as the hour of the day.
* **Importing Data:** The monthly files containing the ride data were imported into SQL Server.
* **Merging Data:** A new table named “cyclistic_annual_data” was created to store the consolidated data for the entire year.The data from tables were merged into the “cyclistic_annual_data” table using the UNION ALL statement.
* **Manipulate Data:** After merging and filtering data a new table named “filtered_cyclistic_annual_data” was generated. This table includes additional columns such as “month,” “day,” “hour,” and “duration_minutes” to facilitate the comparison and analysis of ride frequencies.

## Analyze Phase:

**1. Which bike is the most used for both members and casual riders?**

SQL Query : [Link](https://github.com/MrMdAkKhan/Cyclistic-Bike-Share-Analysis/blob/main/Analysis%20using%20SQL.sql)

   Member:

![file1](https://github.com/MrMdAkKhan/Cyclistic-Bike-Share-Analysis/assets/163100067/7c3ec42d-0c51-48c1-9eb9-9db6f0009724)

   Casual:

![file 2](https://github.com/MrMdAkKhan/Cyclistic-Bike-Share-Analysis/assets/163100067/0094230c-f23e-4459-8aca-fdf73458cbc7)


**2. How many members and casual riders does Cyclistic have?**

SQL Query : [Link](https://github.com/MrMdAkKhan/Cyclistic-Bike-Share-Analysis/blob/main/Analysis%20using%20SQL.sql)

   Member:

![file 2-1](https://github.com/MrMdAkKhan/Cyclistic-Bike-Share-Analysis/assets/163100067/417ac19c-3fda-4ee7-a60b-6471007dee32)


**3. Which day has the most number of riders for both members and casual riders?**

SQL Query : [Link](https://github.com/MrMdAkKhan/Cyclistic-Bike-Share-Analysis/blob/main/Analysis%20using%20SQL.sql)

   Member:

![file3](https://github.com/MrMdAkKhan/Cyclistic-Bike-Share-Analysis/assets/163100067/e0947517-31c7-4237-ae67-17c3a8a7219e)

   Casual:

![file 3-1](https://github.com/MrMdAkKhan/Cyclistic-Bike-Share-Analysis/assets/163100067/04aed2e4-a4e4-47fb-92c8-d0c73c253225)


**4. Which month has the most number of riders for both members and casual riders?**

SQL Query : [Link](https://github.com/MrMdAkKhan/Cyclistic-Bike-Share-Analysis/blob/main/Analysis%20using%20SQL.sql)

   Member:

![file 4](https://github.com/MrMdAkKhan/Cyclistic-Bike-Share-Analysis/assets/163100067/1841fbb3-932e-49db-a479-03daf3d77519)

   Casual:

![file 4-1](https://github.com/MrMdAkKhan/Cyclistic-Bike-Share-Analysis/assets/163100067/89c5b825-5326-4b28-8328-fcb8a2c62966)


**5. What time do both users usually start their trip?**

SQL Query : [Link](https://github.com/MrMdAkKhan/Cyclistic-Bike-Share-Analysis/blob/main/Analysis%20using%20SQL.sql)

 ![file 5](https://github.com/MrMdAkKhan/Cyclistic-Bike-Share-Analysis/assets/163100067/91db6f1e-4dc1-4bc5-92d7-0217ac5083a2)


**6. Where do the users usually start their trip?**

SQL Query : [Link](https://github.com/MrMdAkKhan/Cyclistic-Bike-Share-Analysis/blob/main/Analysis%20using%20SQL.sql)

   Member:

![file 6](https://github.com/MrMdAkKhan/Cyclistic-Bike-Share-Analysis/assets/163100067/a9239193-2761-49eb-b601-627c2fbc3d88)


   Casual:

![file 6-1](https://github.com/MrMdAkKhan/Cyclistic-Bike-Share-Analysis/assets/163100067/f5f021a3-4b94-4397-afc3-a32e4b1b23f4)


**7. What is the Avereage ride duration by members and casual riders in minutes?**

SQL Query : [Link](https://github.com/MrMdAkKhan/Cyclistic-Bike-Share-Analysis/blob/main/Analysis%20using%20SQL.sql)

![file 7](https://github.com/MrMdAkKhan/Cyclistic-Bike-Share-Analysis/assets/163100067/1a4da3a0-c2a6-41d0-8251-b53fe64228bd)

## Share Phase:

The share phase presents the insights and findings derived from the analysis of Cyclistic Bike Share data using Microsoft Power BI, a powerful data visualization tool. The analysis revealed several key findings:

**1. Which bike is the most used for both members and casual riders?**

Ans. The classic bike is the most used bike for both riders.

![P-1](https://github.com/MrMdAkKhan/Cyclistic-Bike-Share-Analysis/assets/163100067/027d9acc-5d0c-42ff-9ac1-7a73821959f6)

![P-2](https://github.com/MrMdAkKhan/Cyclistic-Bike-Share-Analysis/assets/163100067/de7214ed-4e86-4d45-b60c-f59d3f3bb754)


**2. How many members and casual riders does Cyclistic have?**

Ans. 65.61% are members, but still, we need to find ways to increase the Cyclistic annual members.

![p-3](https://github.com/MrMdAkKhan/Cyclistic-Bike-Share-Analysis/assets/163100067/92ebe767-5004-4160-9bfd-ca152075b290)


**3. Which day has the most number of riders for both members and casual riders?**

Ans. The members, they are usually riding during the weekdays but our casual riders, mostly are riding during the weekends.

![p-4](https://github.com/MrMdAkKhan/Cyclistic-Bike-Share-Analysis/assets/163100067/aab23832-91d7-4403-9147-66ceeb994f97)

![p-5](https://github.com/MrMdAkKhan/Cyclistic-Bike-Share-Analysis/assets/163100067/bf5dc12c-8ffb-4d89-bc44-519031219eae)


**4. Which month has the most number of riders for both members and casual riders?**

Ans. Both casual and member riders use bikes more in the summer, particularly in July and August

![p-6](https://github.com/MrMdAkKhan/Cyclistic-Bike-Share-Analysis/assets/163100067/6443c2c0-f761-48fa-b535-78bf1134ac53)

![p-7](https://github.com/MrMdAkKhan/Cyclistic-Bike-Share-Analysis/assets/163100067/5e565b9e-3d73-45ea-b3ed-1151d92a062e)


**5. What time do both users usually start their trip?**

Ans. Trips for both members and casual riders often start around 5 PM.

![p-8](https://github.com/MrMdAkKhan/Cyclistic-Bike-Share-Analysis/assets/163100067/851aff51-fbef-4873-a2bf-17de63eb5f48)

![p-9](https://github.com/MrMdAkKhan/Cyclistic-Bike-Share-Analysis/assets/163100067/54ac4987-827c-463c-9c30-96dbf625b60e)


### Complete Dashboard

[Visualization using Power BI.pdf](https://github.com/MrMdAkKhan/Cyclistic-Bike-Share-Analysis/files/14601269/Visualization.using.Power.BI.pdf)

--Due to Liscensing restrictions in Power BI, I was able to attach only a pdf file for visualization report.

## Act Phase:

### Insights: 

* Members prefer riding bikes on weekdays, especially Wednesdays, which are their busiest days.
* Casual riders like riding on weekends, especially Sundays, which is when they ride the most.
* Casual riders often take longer rides than members, showing that they have different preferences for how long they ride.
* The majority of these trips for both member and casual riders commence around 5 PM.
* Most members start their trips at "Clinton St & Washington Blvd" station whereas most casual riders opt to start at "Streeter Dr & Grand Ave".
* Both casual and member riders use bikes more in the summer, particularly in July and August, probably because the weather is better.
* However, bike use drops a lot during the winter, especially in December, January, and February. This is likely because the snow in Chicago makes biking less convenient or enjoyable.

## Recommendations: 

* Cyclistic could offer weekend promotions exclusively for members to encourage weekend rides. This way, members can enjoy special benefits when riding on weekends, attracting more 
  casual riders to consider membership.

* To cater to casual riders who often start their trips at "Streeter Dr & Grand Ave", Cyclistic should consider placing more stations in that area. This makes it convenient for casual 
  riders to access Cyclistic bikes, potentially motivating them to become members for easier access to the station.

* Introducing summer promotions exclusively for Cyclistic members could entice more casual riders to sign up for annual membership. With benefits tailored for summer riding, such as 
  discounts or special offers, casual riders may find it worthwhile to join Cyclistic to access these promotions during their preferred riding season.






