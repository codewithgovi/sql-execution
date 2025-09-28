---FILTER DATA BASED ON AGGREGATED RESULTS USING GROUP BY AND HAVING---

select * from retail.orders;
-- 1. Get the records that have a count of order date grater than or equal to 120  
-- and descending order by order count and they should be in complete or closed status
select order_date, count(*) AS order_date_count
from retail.orders
where order_status in ('COMPLETE', 'CLOSED')
group by 1
	HAVING count(*) >= 120
order by 2 desc;

-- 2. Typical query execution
--FROM, WHERE, GROUP BY, SELECT, ORDER BY


-- 3. Get the records which have order revenue more than or equal to 2000
select * from retail.order_items;

select order_item_order_id, round(sum(order_item_subtotal):: numeric, 2) AS order_revenue
from retail.order_items
group by 1
	having  sum(order_item_subtotal) >= 2000
order by 2 desc;
