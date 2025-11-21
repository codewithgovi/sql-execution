--- SUB QUERIES
--- Write a query to fetch records greater than the avg price.
--1)
SELECT
	* 
FROM
	practice.dim_product 
WHERE
	unit_price > (SELECT AVG(unit_price) from practice.dim_product);

--2) Use the above query on FROM clause and fetch any record use WHERE clause
SELECT
	*
FROM
(
SELECT
	* 
FROM
	practice.dim_product 
WHERE
	unit_price > (SELECT AVG(unit_price) from practice.dim_product)
) AS sub_query_table
WHERE 
	product_name = 'Huge Change'


--Types of SubQueries:
/*
1.Scalar Subquery : Returns one single value.
Example: Find products with price greater than average price
*/
SELECT *
FROM practice.dim_product
WHERE unit_price > (
    SELECT AVG(unit_price) FROM practice.dim_product
);


/*
2.Row Subquery : Returns one row (multiple columns).
*/
SELECT *
FROM practice.dim_product
WHERE (category, brand) =
    (SELECT category, brand
     FROM practice.dim_product
     WHERE product_id = 'PROD0003');

/*
3.Column Subquery: Returns one column with many rows (list).
Example: Products in categories with high-priced items
*/
SELECT *
FROM practice.dim_product
WHERE category IN (
    SELECT category
    FROM practice.dim_product
    WHERE unit_price > 800
);


/*
4.Table Subquery (Used in FROM Clause) : Acts like a temporary table.
Example: Get top 2 priciest products per category
*/
SELECT *
FROM (
    SELECT *,
           ROW_NUMBER() OVER (PARTITION BY category ORDER BY unit_price DESC) AS rn
    FROM practice.dim_product
) t
WHERE rn <= 2;


/*
5. Correlated Subquery : A subquery that depends on the outer query.
Executed for each row (slower, but powerful).
Example: Find products more expensive than category average
*/

SELECT p1.*
FROM practice.dim_product p1
WHERE p1.unit_price > (
    SELECT AVG(p2.unit_price)
    FROM practice.dim_product p2
    WHERE p2.category = p1.category
);


/*
6.EXISTS Subquery: Checks if matching rows exist — efficient for filtering.
Example: Only categories that have at least one high-priced item
*/
SELECT DISTINCT category
FROM practice.dim_product p
WHERE EXISTS (
    SELECT 1 
    FROM practice.dim_product 
    WHERE category = p.category 
      AND unit_price > 800
);


