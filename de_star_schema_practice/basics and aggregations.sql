--SELECT
Select * from practice.dim_customer;


--Using Intendation(Which can read and understand easily)
--Retreving only required columns
select 
	customer_id,
	email
from
	practice.dim_customer;


-- LIMIT
select customer_id, email from practice.dim_customer limit 19;


-- WHERE [Applying Conditions/Filter the records]
-- LEVEL 1:
select 
	*
from
	practice.dim_customer
where
	gender = 'F';


--LEVEL 2:(AND/OR)
-- IF multiple conditions, we need to put them on brackets ()
-- AND Operator
select 
	*
from
	practice.dim_customer
where
	(gender = 'F') and (country = 'Finland') and (join_date > '2023-02-01');

--OR Operator
SELECT 
	*
FROM
	practice.dim_customer
WHERE
	(gender = 'F') AND ((country = 'Finland') OR (join_date > '2023-02-01'));


-- LIKE Operator
-- Fetch the records where first name starts with R
SELECT 
	*
FROM 
	practice.dim_customer
WHERE
	first_name LIKE 'R%';


-- Fetch the records where First name starts with S and End with A
SELECT 
	*
FROM 
	practice.dim_customer
WHERE
	first_name LIKE 'S%a';


-- Fetch the records which first name starts with S and End with A, fourth letter a
SELECT 
	*
FROM 
	practice.dim_customer
WHERE
	first_name LIKE 'S__a%a';



-- SORTING
-- Sort the records based on unit price on ascending order
SELECT 
	*
FROM
	practice.dim_product
ORDER BY 
	unit_price ASC;

-- Sort the records based on unit price on decending order
SELECT 
	*
FROM
	practice.dim_product
ORDER BY 
	unit_price DESC
LIMIT 3;


-- ALIAS(AS)
-- Give a naming convention for product_name and category column as your wish

SELECT
	product_id,
	product_name AS "product name",
	category AS "product category",
	brand
FROM
	practice.dim_product;


-- GROUPING
-- I want the AVG unit price as per the category
SELECT 
	category,
	AVG(unit_price) AS avg_unit_price,
FROM
	practice.dim_product
GROUP BY
	category;


-- I want the total unit price as per the category
SELECT 
	category,
	SUM(unit_price) AS total_price
FROM
	practice.dim_product
GROUP BY
	category;

-- I want the both total and avg unit price as per the category
SELECT 
	category,
	AVG(unit_price) AS avg_price, -- derived columns
	SUM(unit_price) AS total_price -- derived columns
FROM
	practice.dim_product
GROUP BY
	category;


-- I need the records which avg unit_price by category more than 500
SELECT
	category,
	AVG(unit_price) AS avg_price
FROM
	practice.dim_product
GROUP BY
	category
HAVING 
	AVG(unit_price) > 500;

