WITH cte_table AS
(
SELECT 
	* 
FROM 
	practice.dim_product
WHERE 
	unit_price > (SELECT AVG(unit_price) FROM practice.dim_product)
),
cte_table_2 AS
(
SELECT * FROM cte_table
WHERE 
	product_name IN ('Figure Method','Huge Change', 'Film Finally') 
)
SELECT * FROM cte_table_2
WHERE product_name = 'Figure Method'