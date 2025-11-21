-- WINDOW FUNCTIONS
-- RUNNING TOTAL

-- On Unit price
select * from practice.dim_product;

SELECT
	*,
	SUM(unit_price) OVER (ORDER BY unit_price)
FROM
	practice.dim_product;

-- On launch_date
SELECT
	*,
	SUM(unit_price) OVER (ORDER BY launch_date)
FROM
	practice.dim_product;

--- Running AVG on launch_date
SELECT
	*,
	AVG(unit_price) OVER (ORDER BY launch_date)
FROM
	practice.dim_product;


-- FRAME CLAUSES
SELECT 
	*,
	SUM(unit_price) OVER (ORDER BY launch_date ROWS BETWEEN unbounded preceding AND current row)
FROM
	practice.dim_product;


SELECT 
	*,
	SUM(unit_price) OVER (ORDER BY launch_date ROWS BETWEEN unbounded preceding AND unbounded following)
FROM
	practice.dim_product;


--- RANKING FUNCTIONS
	--ROW_NUMBER() 	-> unique number for each row
	--RANK()		-> Rank with gaps
	--DENSE_RANK()	-> Rank without gaps

-- Apply ranking based on the unit_price
SELECT 
	unit_price,
	ROW_NUMBER() OVER(ORDER BY unit_price) AS "row_number",
	RANK() OVER(ORDER BY unit_price) AS "rank",
	DENSE_RANK() OVER(ORDER BY unit_price) AS "dense_rank"
FROM
	practice.dim_product;

-- Apply ranking on unit_price by differentiating the category
SELECT 
	unit_price,
	category,
	ROW_NUMBER() OVER(PARTITION BY category ORDER BY unit_price) AS "row_number",
	RANK() OVER(PARTITION BY category ORDER BY unit_price) AS "rank",
	DENSE_RANK() OVER(PARTITION BY category ORDER BY unit_price) AS "dense_rank"
FROM
	practice.dim_product;

--- Aggregate Window Functions
SELECT
    category,
    AVG(unit_price) OVER (PARTITION BY category) AS avg_category_price
FROM practice.dim_product;


SELECT
    category,
    SUM(unit_price) OVER (PARTITION BY category) AS avg_category_price
FROM practice.dim_product;


SELECT
    category,
    MIN(unit_price) OVER (PARTITION BY category) AS avg_category_price
FROM practice.dim_product;


SELECT
    category,
    MAX(unit_price) OVER (PARTITION BY category) AS avg_category_price
FROM practice.dim_product;


SELECT
    category,
    COUNT(unit_price) OVER (PARTITION BY category) AS avg_category_price
FROM practice.dim_product;

--- VALUE FUNCTIONS
SELECT
    unit_price,
    LAG(unit_price) OVER (ORDER BY launch_date) AS prev_price
FROM practice.dim_product;


SELECT
    unit_price,
    LEAD(unit_price) OVER (ORDER BY launch_date) AS next_price
FROM practice.dim_product;







