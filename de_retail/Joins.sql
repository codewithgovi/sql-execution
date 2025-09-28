/*
---PERFORMING JOINS---

1. INNER JOIN:
Role: Returns only rows that have a match in both tables.

Difference: Excludes non-matching rows.

When to use: When you want data that exists in both tables.


Example:
a. INNER JOIN - Get all the records from both datasets which satisfy the JOIN condition */

select * from retail.orders AS o 
JOIN retail.order_items AS oi 
ON o.order_id = oi.order_item_order_id;

--172198
/*
2. LEFT OUTER JOIN (OR) LEFT JOIN:
Role: Returns all rows from the left table, plus matching rows from the right table.

Difference: If no match exists, right-side columns become NULL.

When to use: When you want all rows from the left table, even if they don’t have matches.

Example:
a. Get the results which matches the Left join condition */
select * from retail.orders AS o; --left table
select * from retail.order_items AS oi; --right table

select o.order_id, o.order_date, oi.order_item_order_id, oi.order_item_product_id, oi.order_item_subtotal
from retail.orders AS o left join retail.order_items AS oi 
ON o.order_id = oi.order_item_order_id;

--183650

/*
3. RIGHT OUTER JOIN (OR) RIGHT JOIN:
Role: Returns all rows from the right table, plus matching rows from the left table.

Difference: If no match exists, left-side columns become NULL.

When to use: When you want all rows from the right table, even if they don’t have matches.

Example:
a. Get the records which satisfy the Right Join Condition. */
select * from retail.orders AS o; --left table
select * from retail.order_items AS oi; -- right table


select o.order_id, o.order_date, oi.order_item_order_id, oi.order_item_product_id, oi.order_item_subtotal
from retail.orders AS o RIGHT JOIN retail.order_items AS oi
ON o.order_id = oi.order_item_order_id;

--172198


/*
4. FULL OUTER JOIN
Role: Returns all rows from both tables.

Difference: Rows without a match on either side get NULLs.

When to use: When you need to combine all data, whether or not it matches.

Example:
a. Get the results which matches the Full outer join condition. */

select o.order_id, o.order_date, oi.order_item_order_id, oi.order_item_product_id, oi.order_item_subtotal
from retail.orders AS o FULL OUTER JOIN retail.order_items AS oi
ON o.order_id = oi.order_item_order_id;

--183650

/* Now Applying Join, Filters, Aggregations */

select o.order_id, o.order_date, oi.order_item_product_id,
round(sum(oi.order_item_subtotal):: numeric ,2) AS order_revenue
from
retail.orders AS o join retail.order_items AS oi
ON o.order_id = oi.order_item_order_id
where o.order_status in ('COMPLETE', 'CLOSED')
GROUP BY 1, 3
order by 4 desc;




 