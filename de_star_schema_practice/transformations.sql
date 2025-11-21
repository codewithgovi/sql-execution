-- Transformations

-- Numeric Transformations
SELECT
	unit_price * 0.90 AS discounted_price,
	unit_price + 10 AS taxed_price,
	unit_price / 10 AS fractioned_price,
	ROUND(unit_price, 1) AS rounded_price,
	unit_price * unit_price AS multiply_price
FROM practice.dim_product;


-- Date Transformations
SELECT 
	*
FROM
practice.dim_date;


-- Fetch current date, current time
SELECT
    date,
    NOW() AS "current_timestamp",
    CURRENT_DATE AS utc_date,                                    -- Date only
    (CURRENT_TIMESTAMP AT TIME ZONE 'UTC')::time AS utc_time,    -- Time only
    (CURRENT_TIMESTAMP AT TIME ZONE 'UTC') AS utc_timestamp      -- Full UTC timestamp
FROM
    practice.dim_date;


-- 2
SELECT 
	date
FROM
	practice.dim_date;

-- now fetch only, month, date, year, weekday, Dayname
SELECT 
    date,
    EXTRACT(YEAR FROM date)          AS year,
    EXTRACT(MONTH FROM date)         AS month,
    EXTRACT(DAY FROM date)           AS day,
    EXTRACT(DOW FROM date)           AS weekday,      
    TO_CHAR(date, 'Day')             AS dayname,
    
    -- UTC Date
    (CURRENT_TIMESTAMP AT TIME ZONE 'UTC')::date AS utc_date,
	((CURRENT_TIMESTAMP AT TIME ZONE 'UTC')::date - date) AS difference_in_days,

    -- Add & subtract days
    date + INTERVAL '2 days' AS date_plus_2,
    date - INTERVAL '2 days' AS date_minus_2,

	-- Type casting
	CAST(TO_DATE('25-01-01', 'YY-MM-DD') AS DATE), -- to date
	CAST(TO_TIMESTAMP('25-01-01', 'YY-MM-DD') AS timestamp)
	
FROM
    practice.dim_date;

-- 3. Date Formats
SELECT
    date,
    TO_CHAR(date, 'FMDay FMMonth FMDD YYYY') AS converted_date
FROM
    practice.dim_date;

--- TYPE CASTING
select * from practice.dim_customer;

-- mostly usefull at the time of joins between two tables
SELECT 
	customer_key,
	CAST(customer_key AS VARCHAR(100))
FROM
	practice.dim_customer;


-- STRING FUNCTIONS

select * from practice.dim_customer;

SELECT
	*,
	CONCAT(first_name,' ', last_name) AS full_name, --- concat both first_name and last_name
	LENGTH(country) AS country_size,  				--- length/size of a column
	LOWER(city) AS city_low_case,					--- coverted city into lower case	
	substring(email, 1, 4) AS email_4chars,			--- fetch only first 4 chars from email column(SLICE)
	REPLACE(email, '@', '$') AS email_to_$, 		--- Apply Replace for @ in email to $
	LEFT(country,3) AS left_conutry,				--- fetch 3 chars of country from left
	RIGHT(country,3) AS	right_country,				--- fetch 3 chars of country from right
	REVERSE(country) AS rev_country,				--- reverse the country column
	REPEAT(first_name, 2) AS repeat_firstName,		--- repeat the first_name 2 times
	CONCAT_WS(' ', first_name, last_name, country) 	--- Concat n number of columns with space
FROM
	practice.dim_customer;






