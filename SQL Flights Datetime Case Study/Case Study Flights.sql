SELECT * FROM flights;

-- 1: Find the month with most number of flights (on the basis of departures)

SELECT MONTHNAME(Date_of_Journey) AS month_name, COUNT(*) AS number_of_flights  -- MONTHNAME gets the name of the months
FROM flights
GROUP BY month_name
ORDER BY COUNT(*) DESC;

-- June has the maximum number of flights, which seems logical as people travel more during summer holidays


-- 2: Which week has most costly flights?
SELECT * FROM flights;

SELECT DAYNAME(Date_of_Journey) AS day_of_week, ROUND(AVG(Price)) AS avg_price   -- Rounding average price to closest integer value
FROM flights
GROUP BY day_of_week
ORDER BY avg_price DESC;

-- Flights on Thurday have the highest average price followed by Monday and Sunday.

-- 3: Find the number of Indigo Flights every month

SELECT MONTHNAME(Date_of_Journey) AS month_name, COUNT(*) AS number_of_flights
FROM flights
WHERE Airline = 'Indigo'
GROUP BY month_name;

-- Maximum number of "Indigo" flights are in March

-- 4: Find the list of all flights that depart between 10AM and 2PM from Delhi to Bangalore
SELECT * FROM flights;

SELECT *
FROM flights
WHERE Source = 'Banglore' AND Destination = 'Delhi' AND Dep_time >= '10:00:00' AND Dep_time <= '14:00:00';

-- There are 185 flights going from Banglore to Delhi in the given timeframe.

-- 5: Find the number of flights departing on weekends from Banglore.

SELECT COUNT(*) AS 'Number of flights'
FROM flights
WHERE DAYNAME(date_of_journey) IN ('Saturday', 'Sunday') AND source = 'Banglore';

-- 6: Calculate the arrival time for all flights by adding the duration to the departure time.

SELECT * FROM flights;

/* To solve the problem (and future problems related to datetime) we are making a new column, i.e., departure, which would store the
date and time of departure as a single value. This would make our code more reliable */

ALTER TABLE flights                   -- Altering table flights
ADD COLUMN departure DATETIME;         -- New column named 'departure' with DATETIME datatype

SELECT * FROM flights;     -- Confirming the new column

/* -- our output string from CONCAT is in this ('%Y-%m-%d %H:%i') format and we want STR_TO_DATE to follow this format */

SELECT STR_TO_DATE(CONCAT(date_of_journey, ' ', dep_time), '%Y-%m-%d %H:%i')  
FROM flights;

UPDATE flights         -- Updating 'flights' departure column to have this value
SET departure = STR_TO_DATE(CONCAT(date_of_journey, ' ', dep_time), '%Y-%m-%d %H:%i');

SELECT * FROM flights;       -- confirming changes

-- Adding two more new columns

ALTER TABLE flights
ADD COLUMN duration_mins INTEGER,   -- this will store duration in minutes in integer format
ADD COLUMN arrival DATETIME;     -- this will be our final answer column

/* In the command below, the problem with SUSTRING_INDEX is that where it does not find a value it adds the hours value, instead we want
0 as our value, so we will use a CASE WHEN statement for this */

SELECT duration, SUBSTRING_INDEX(duration, ' ', 1) AS hours, 
CASE 
	WHEN SUBSTRING_INDEX(duration, ' ', -1) = SUBSTRING_INDEX(duration, ' ', 1) THEN 0
    ELSE SUBSTRING_INDEX(duration, ' ', -1)
    END AS mins
    
FROM flights;

-- But we also need to replace 'h' and 'm' from our outputs, so for that we would use replace command.

SELECT duration, REPLACE(SUBSTRING_INDEX(duration, ' ', 1), 'h', '') AS hours, 
CASE 
	WHEN SUBSTRING_INDEX(duration, ' ', -1) = SUBSTRING_INDEX(duration, ' ', 1) THEN 0
    ELSE REPLACE(SUBSTRING_INDEX(duration, ' ', -1), 'm', '')
    END AS mins
    
FROM flights;

-- Now, we finally need duration in mins, for that we would multiply hours with 60 and add it to mins col as follows:
SELECT duration, REPLACE(SUBSTRING_INDEX(duration, ' ', 1), 'h', '')*60 + 
CASE 
	WHEN SUBSTRING_INDEX(duration, ' ', -1) = SUBSTRING_INDEX(duration, ' ', 1) THEN 0
    ELSE REPLACE(SUBSTRING_INDEX(duration, ' ', -1), 'm', '')
    END AS mins
    
FROM flights;      -- Have a look at the query closely and its output too.

-- finally, we update our dauration_mins column to have the above value
/* UPDATE flights
SET duration_mins = REPLACE(SUBSTRING_INDEX(duration, ' ', 1), 'h', '')*60 + 
CASE 
	WHEN SUBSTRING_INDEX(duration, ' ', -1) = SUBSTRING_INDEX(duration, ' ', 1) THEN 0
    ELSE REPLACE(SUBSTRING_INDEX(duration, ' ', -1), 'm', '')
END;

-- Since the above command is throwing error and not able to update, we will use another          */

UPDATE flights
SET duration_mins =
    CASE
        WHEN duration LIKE '%h %m' THEN
            CAST(SUBSTRING_INDEX(SUBSTRING_INDEX(duration, 'h', 1), ' ', -1) AS UNSIGNED) * 60 +
            CAST(REPLACE(REPLACE(SUBSTRING_INDEX(duration, ' ', -1), 'm', ''), ' ', '') AS UNSIGNED)
        WHEN duration LIKE '%h' THEN
            CAST(REPLACE(duration, 'h', '') AS UNSIGNED) * 60
        WHEN duration LIKE '%m' THEN
            CAST(REPLACE(duration, 'm', '') AS UNSIGNED)
        ELSE 0
    END;                -- Works


SELECT * FROM flights;  -- Confirming changes

-- Now, let us get arrival

-- DATE_ADD, takes the departure column and adds duration_mins which is in MINUTE format to departure in INTERVAL and get arrival
SELECT departure, duration_mins, DATE_ADD(departure, INTERVAL duration_mins MINUTE) AS arrival
FROM flights;

-- Finally,

UPDATE flights
SET arrival = DATE_ADD(departure, INTERVAL duration_mins MINUTE);

-- Reconfirming the changes in the arrival column;

SELECT * FROM flights;

-- Final answer:

SELECT *, TIME(arrival) AS arrival_time
FROM flights;


/* ------------------------------------------------------------------------------------------------------------------------------*/

-- 7: Calculate arrival dates for all the flights
SELECT * FROM flights;

SELECT DATE(arrival) AS date_of_arrival
FROM flights;


-- 8: Find the number of flights which travel on multiple dates.

SELECT COUNT(*) AS number_of_flights
FROM flights
WHERE DATE(departure) != DATE(arrival);


-- 9. Calculate the average duration of flights between all city pairs

SELECT source, destination, TIME_FORMAT(SEC_TO_TIME(AVG(duration_mins)*60), '%hh %im') AS average_flight_duration
FROM flights
GROUP BY source, destination;


-- 10: Find all the flights which departed before midnight but arrived at their destination after midnight having only 0 stop
SELECT * FROM flights;

SELECT *
FROM flights
WHERE total_stops = 'non-stop' AND DATE(departure) < DATE(arrival);


-- 11: Find quarter wise number of flights for each airline.

SELECT airline, QUARTER(departure) AS quarter, COUNT(*) AS number_of_flights
FROM flights
GROUP BY airline, quarter
ORDER BY airline;         -- Gives quarter-wise number of flights for each airline


-- 12: Find the longest flight distance (between cities in terms of time) in India
SELECT * FROM flights;

SELECT source, destination, AVG(duration_mins) as average_duration
FROM flights
GROUP BY source, destination
ORDER BY average_duration DESC;

-- Delhi to Cochin has the highest flight distance in India


-- 13: Average time duration for flights that have non-stop vs more than 0 stops

SELECT 
    CASE 
        WHEN total_stops = 'non-stop' THEN 'non-stop'
        ELSE 'More than 0 stop'
    END AS stops,
    AVG(
        CASE
            WHEN total_stops = 'non-stop' THEN duration_mins
            ELSE NULL
        END
    ) AS duration_nonstop,
    AVG(
        CASE
            WHEN total_stops != 'non-stop' THEN duration_mins
            ELSE NULL
        END
    ) AS duration_more_than_0stop
FROM flights
GROUP BY stops;


-- Another way:

CREATE TEMPORARY TABLE stops_table (      -- is created only when this query is run
SELECT *, 
CASE
	WHEN total_stops = 'non-stop' THEN 'non-stop' 
    ELSE 'with-stop'
    END AS 'stops'
FROM flights);

SELECT stops, AVG(duration_mins) AS average_duration
FROM stops_table
GROUP BY stops;

-- As expected, non-stop flights have lower duration of time than the ones with stops.


-- 14: Average price for flights that have non-stop vs more than 0 stops

SELECT stops, AVG(price) AS average_price
FROM stops_table
GROUP BY stops;

-- It can be observed that the average price of non-stop flights is lower than that with the stops.


-- 15: Find all Air India flights in a given date range (1 Mar 2019 - 10 Mar 2019) originating from Delhi 

SELECT * FROM flights;

SELECT * 
FROM flights
WHERE source = 'Delhi'
AND DATE(departure) BETWEEN '2019-03-01' AND '2019-03-10';

-- 16: Find the longest flight of each airline

SELECT airline, MAX(duration_mins) AS maximum_duration
FROM flights
GROUP BY airline
ORDER BY maximum_duration DESC;

-- 17: Make a weekday vs time grid showing frequency of flights from banglore and Delhi

SELECT DAYNAME(departure) AS DayOfWeek,
    SUM(CASE WHEN HOUR(departure) BETWEEN 0 AND 5 THEN 1 ELSE 0 END) AS '12AM - 6AM', 
    SUM(CASE WHEN HOUR(departure) BETWEEN 6 AND 11 THEN 1 ELSE 0 END) AS '6AM - 12PM',
    SUM(CASE WHEN HOUR(departure) BETWEEN 12 AND 17 THEN 1 ELSE 0 END) AS '12PM - 6PM',
    SUM(CASE WHEN HOUR(departure) BETWEEN 18 AND 23 THEN 1 ELSE 0 END) AS '6PM - 12AM'
FROM flights
WHERE source = 'Banglore' AND destination = 'Delhi'
GROUP BY DAYNAME(departure)
ORDER BY DAYNAME(departure);


-- 18: Make a weekday vs time grid for showing average flight price from Banglore and Delhi

SELECT DAYNAME(departure) AS DayOfWeek,
    AVG(CASE WHEN HOUR(departure) BETWEEN 0 AND 5 THEN price ELSE NULL END) AS '12AM - 6AM',   -- Here, null is not counted in the average
    AVG(CASE WHEN HOUR(departure) BETWEEN 6 AND 11 THEN price ELSE NULL END) AS '6AM - 12PM',
    AVG(CASE WHEN HOUR(departure) BETWEEN 12 AND 17 THEN price ELSE NULL END) AS '12PM - 6PM',
    AVG(CASE WHEN HOUR(departure) BETWEEN 18 AND 23 THEN price ELSE NULL END) AS '6PM - 12AM'
FROM flights
WHERE source = 'Banglore' AND destination = 'Delhi'
GROUP BY DAYNAME(departure)
ORDER BY DAYNAME(departure);


------------------------------------------------------------------ END --------------------------------------------------------------------------------




