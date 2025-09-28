--1. CTE(Common Table Expression) in SQL
/*
A Common Table Expression (CTE) is the result set of a query 
which exists temporarily and for use only within the context of a larger query.

Role:
A CTE is a temporary, named result set defined within a query using the WITH clause.
It acts like a “temporary view” that exists only for the duration of the query.

When to use:
Break down a large query into smaller, logical chunks.
If the same derived result is needed multiple times.
Instead of nesting multiple subqueries inside FROM, WHERE, or JOIN, a CTE makes it clean.

*/

--Exmaple:
--Write a query which satisfy the CTE condition.

WITH order_details_cte AS
(select o.*, oi.order_item_product_id, oi.order_item_subtotal, oi.order_item_id
from retail.orders AS o join retail.order_items AS oi
on o.order_id = oi.order_item_id)
select * from order_details_cte;





