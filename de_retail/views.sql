---DATABASE VIEWS---

/*
Role:
A View is a saved SQL query (like a virtual table). 
It doesn’t store data itself (unless it’s a materialized view).
Provides abstraction, security, and simplicity.

Differnce:

When to use:
Abstraction / Simplification: Hide complex joins or aggregations behind a simple object.
Security: Restrict users from seeing entire tables (only expose necessary columns/rows).
Reusability: Common queries written once, reused multiple times.
Logical Separation: Can separate business logic from raw data structure.
*/


--Example 1:
--Write a query to store neccassary details on views
CREATE VIEW retail.order_details_v AS
select o.*, oi.order_item_product_id,
oi.order_item_subtotal from retail.orders AS o JOIN retail.order_items AS oi 
ON o.order_id = oi.order_item_id;


select * from retail.order_details_v;


--Example 2:
--write a query to add order_id into the existing view
CREATE OR REPLACE VIEW retail.order_details_v AS
select o.*, 
oi.order_item_product_id,
oi.order_item_subtotal,
oi.order_item_id
from retail.orders AS o JOIN retail.order_items AS oi 
ON o.order_id = oi.order_item_id;

/*
Note:
While add the column into the views. that column should be added at the end, 
not in between or at beginning.
*/
