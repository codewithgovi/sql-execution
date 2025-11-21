--- CONDITIONALS
select * from practice.dim_product limit 5;

-- 1)
SELECT 
	*,
	CASE
	WHEN unit_price <= 100 THEN 'afforable'
	WHEN unit_price <= 200 THEN 'normal'
	ELSE 'expensive'
	END AS price_category
FROM 
	practice.dim_product;



--2) Applying the conditions along with category
SELECT 
	*,
	CASE
	WHEN unit_price <= 100 AND category = 'Clothing' THEN 'afforable'
	WHEN unit_price <= 200 AND category = 'Clothing' THEN 'normal'
	WHEN unit_price > 200 AND category = 'Clothing' THEN 'expensive'
	ELSE CONCAT('N/A for ', category)
	END AS price_category
FROM 
	practice.dim_product;
	
/* 3) Categorize launch year as “Old”, “Recent”, or “Future Launch” using launch_date
Before 2022 → Old
Between 2022 and 2024 → Recent
After 2024 → Future Launch */

SELECT
	*,
	CASE
	WHEN launch_date < '2022-01-01' THEN 'Old'
	WHEN launch_date >= '2022-01-01' AND launch_date < '2024-01-01' THEN 'Recent'
	ELSE 'Future Launch'
	END AS launch_status
FROM
	practice.dim_product;

/*
4) Create a discount rule based on category
Define a column discount_percent:
Clothing → 10%
Home & Kitchen → 5%
Others → 0%
*/

SELECT 
	*,
	CASE 
	WHEN category = 'Clothing' THEN '10%'
	WHEN category = 'Home & Kitchen' THEN '5%'
	ELSE '0%'
	END AS discount_percent
FROM
	practice.dim_product;



/*
5) Brands BrandA and BrandD should be labeled as Premium
All others → Standard
*/
SELECT
	*,
	CASE
	WHEN brand in ('BrandA', 'BrandD') THEN 'Premium'
	ELSE 'Standard'
	END AS brand_label
FROM 
	practice.dim_product;

/*
6) Find products launched on weekends
Add a column launch_day_type:
If launch_date is Saturday/Sunday → “Weekend”
Else → “Weekday”
Use a CASE WHEN + DAYNAME/DAYOFWEEK.
*/

SELECT 
	*,
	launch_date,
	TO_CHAR(launch_date, 'Day')  AS dayname,  
	CASE
	WHEN TRIM(TO_CHAR(launch_date, 'Day')) in ('Sunday', 'Saturday') THEN 'Weekend'
	ELSE 'Weekday'
	END AS launch_day_type
FROM
	practice.dim_product;


