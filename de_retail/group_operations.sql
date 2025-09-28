---PERFORMING GROUP BY OPERATIONS---

select * from retail.orders;

-- 1. Get the count for each order status and count should be in descending order
select order_status, count(order_status) AS order_status_count
from retail.orders
group by 1
order by 2 desc;


-- 2. Get the count for each order date and count should be in descending order
select order_date, count(order_date) AS order_date_count
from retail.orders
group by 1
order by 2 desc;


-- 3. Get the count for each order month (derived column) and count should be in descending order
select to_char(order_date, 'YYYY/MM') AS order_month, count(*) order_months_count
from retail.orders
group by 1
order by 2 desc;



-- 4. Get all the columns in order items table
select * from retail.order_items;


-- 5. Get the order revenue for each order id
select order_item_order_id, round(sum(order_item_subtotal)::numeric , 2) AS order_revenue
from retail.order_items
group by 1
order by 1;



