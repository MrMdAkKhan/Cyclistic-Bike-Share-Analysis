 --I created 12 tables in my database with identical column names for importing files from the past year.
CREATE TABLE feb (
	ride_id	varchar(50),
	rideable_type varchar(20),
	started_at timestamp,
	ended_at timestamp,
	start_station_name varchar(100),
	start_station_id varchar(50),
	end_station_name varchar(100),
	end_station_id	varchar(50),
	start_lat numeric,	
	start_lng numeric,
	end_lat	numeric,
	end_lng numeric,	
	member_casual varchar(50)
)

--Now Combining all tables in one table
CREATE TABLE Cyclistic_annual_data AS
SELECT * FROM feb
UNION ALL
SELECT * FROM march
UNION ALL
SELECT * FROM apr
UNION ALL
SELECT * FROM may
UNION ALL
SELECT * FROM june
UNION ALL
SELECT * FROM july
UNION ALL
SELECT * FROM august
UNION ALL
SELECT * FROM september
UNION ALL
SELECT * FROM october
UNION ALL
SELECT * FROM november
UNION ALL
SELECT * FROM december
UNION ALL
SELECT * FROM January_2024

--Cleaning data
--removing nulls, irrelevant values and identical values
SELECT *
FROM cyclistic_annual_data
WHERE (start_lat != end_lat OR start_lng != end_lng)
AND TIMESTAMPDIFF(SECOND, started_at, ended_at) > 0
AND start_station_name IS NOT NULL
AND end_station_name IS NOT NULL;

--Created a new table to store filtered data
CREATE TABLE filtered_cyclistic_annual_data AS
SELECT *
FROM cyclistic_annual_data
WHERE (start_lat != end_lat OR start_lng != end_lng)
AND TIMESTAMPDIFF(SECOND, started_at, ended_at) > 0
AND start_station_name IS NOT NULL
AND end_station_name IS NOT NULL;

--Analysis

--types of ride per users
SELECT
    rideable_type,
    COUNT(*) AS total_riders
FROM
    filtered_cyclistic_annual_data
WHERE
    member_casual = 'member'
GROUP BY
    rideable_type
ORDER BY
    COUNT(*) DESC;

-- types of ride per users
SELECT
    rideable_type,
    COUNT(*) AS total_riders
FROM
    filtered_cyclistic_annual_data
WHERE
    member_casual = 'casual'
GROUP BY
    rideable_type
ORDER BY
    COUNT(*) DESC;

    --Checking Member type percentage
SELECT member_casual,
       COUNT(*) AS total
FROM filtered_cyclistic_annual_data
GROUP BY member_casual
ORDER BY COUNT(*) DESC;

--Adding Column
ALTER TABLE filtered_cyclistic_annual_data
ADD COLUMN start_day_of_week INTEGER;

--Updating Column
UPDATE filtered_cyclistic_annual_data
SET start_day_of_week = EXTRACT(DOW FROM started_at);

--Changing column data type
UPDATE filtered_cyclistic_annual_data
SET start_day_of_week = TO_CHAR(started_at, 'Day');

--Checking start day of week, by member
SELECT
    start_day_of_week,
    COUNT(*) AS total_members
FROM
    filtered_cyclistic_annual_data
WHERE
    member_casual = 'member'
GROUP BY
    start_day_of_week
ORDER BY
    total_members DESC

----Checking start day of week, by casual
SELECT
    start_day_of_week,
    COUNT(*) AS total_casual
FROM
    filtered_cyclistic_annual_data
WHERE
    member_casual = 'casual'
GROUP BY
    start_day_of_week
ORDER BY
    total_casual DESC

--Adding Column
ALTER TABLE filtered_cyclistic_annual_data
ADD COLUMN started_month VARCHAR(20);

--Updating Column
UPDATE filtered_cyclistic_annual_data
SET started_month = TO_CHAR(started_at, 'Month');

--Checking Started Month, by member
SELECT started_month, COUNT(*)
FROM filtered_cyclistic_annual_data
WHERE member_casual = 'member'
GROUP BY started_month
ORDER BY started_month;

--Checking Started Month, by casual
SELECT started_month, COUNT(*)
FROM filtered_cyclistic_annual_data
WHERE member_casual = 'casual'
GROUP BY started_month
ORDER BY started_month;

--Adding Column
ALTER TABLE filtered_cyclistic_annual_data
ALTER COLUMN started_hour TYPE NUMERIC;

--Updating Column
UPDATE filtered_cyclistic_annual_data
SET started_hour = EXTRACT(hour FROM started_at);

--Checking Start Station Name, by member
SELECT
    start_station_name,
    COUNT(*) AS total_riders
FROM
    filtered_cyclistic_annual_data
WHERE
    member_casual = 'member'
GROUP BY
    start_station_name
ORDER BY
    total_riders DESC;

--Checking Start Station Name, by casual
SELECT
    start_station_name,
    COUNT(*) AS total_riders
FROM
    filtered_cyclistic_annual_data
WHERE
    member_casual = 'casual'
GROUP BY
    start_station_name
ORDER BY
    total_riders DESC;

---Average Ride Duration in minutes, member and casual riders
SELECT 
    member_casual,
    AVG(ride_length_in_mins) AS avg_ride_length
FROM 
    filtered_cyclistic_annual_data
WHERE 
    member_casual IN ('member', 'casual')
GROUP BY 
    member_casual
ORDER BY 
    member_casual;

