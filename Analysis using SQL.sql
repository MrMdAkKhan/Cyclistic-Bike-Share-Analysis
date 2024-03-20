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


