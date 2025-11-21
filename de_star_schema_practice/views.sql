--- Views
-- Standard Views
CREATE VIEW practice.product_summary AS
SELECT 
    category,
    AVG(unit_price) AS avg_price,
    COUNT(*) AS total_products
FROM practice.dim_product
GROUP BY category;


select * from practice.product_summary;

-- Materialized Views
CREATE MATERIALIZED VIEW practice.mv_product_summary AS
SELECT 
    category,
    AVG(unit_price) AS avg_price
FROM practice.dim_product
GROUP BY category;


REFRESH MATERIALIZED VIEW practice.mv_product_summary;






