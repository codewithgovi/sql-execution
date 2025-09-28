---ORDER OF SQL SYNTAX BELOW---

--- SELECT => SPECIFIES -> COLUMNS
--- FROM => SPECIFIES -> TABLES, JOINS, SUB QUERIES
--- WHERE => SPECIFIES -> FILTERING DATA
--- GROUP BY => SPECIFIES -> GROUPING BY KEYS
--- ORDER BY => SPECIFIES -> SORTING DATA


---ORDER OF SQL EXECUTION BELOW---

-- FROM => It will try to fetch records from the table specified will be loaded into the memory
-- WHERE => It will try to filter records as user specified will be loaded into the memory
-- GROUP BY => It will try to grouping the filtered data as per the aggregation logic given by user.
-- SELECT => It will select the specified data as per user specified.
-- note: Both GROUP BY & SELECT clause run simultaneously, hence they are interdependent each other while retrieving the data.
-- ORDER BY => Finally data will be sorted based on the order provided.

---EXAMPLE BELOW:

select * from retail.orders;

select order_date, order_status, count(*) AS order_date_count
from retail.orders
where order_status in ('COMPLETE', 'CLOSED')
group by 1, 2
order by 3 desc;


---RULES and RESTRICTIONS TO GROUP and FILTER DATA in SQL QUERIES---
-- rules for GROUP BY : we should suppose to pass only key or fields specified in select clause or non-aggregate functions in nature like(date, year, month), derived fields using non-aggregate functions.

-- rules for WHERE : we should not use aggregate functions.

-- restrictions for WHERE : we can filter the data, when the column is exists in table. but the we cannot filter the derived column or ALIAS specified on the select clause

-- rules for ORDER BY : It can order or sort the data based on user specified both derived field, aggregation functions

