---PERFORMING AGGREGATIONS---

-- 1. Get all number of orders
select count(*) from retail.orders;

-- 2. Get all number of order items
select count(*) from retail.order_items;

-- 3. Get all the number of distinct order status from orders table
select count(distinct order_status) from retail.orders;

-- 4. Get all the number of distinct order dates from orders table
select count(distinct order_date) from retail.orders;

-- 5. Get all columns from order item table
select * from retail.order_items;

-- 6. Get sum of order item subtotal for given order id
select sum(order_item_subtotal) from retail.order_items
where order_item_order_id = 2;


