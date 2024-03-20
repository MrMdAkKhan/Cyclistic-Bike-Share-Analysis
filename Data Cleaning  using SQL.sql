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

