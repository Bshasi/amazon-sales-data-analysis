USE ivy_sql;
SELECT *
FROM sales_data
LIMIT 10;
SELECT COUNT(*) AS total_records
FROM sales_data;
SELECT COUNT(DISTINCT amazon_order_id) AS total_orders
FROM sales_data;
SELECT SUM(quantity) AS total_items_sold
FROM sales_data;
SELECT 
SUM(item_price + item_tax + shipping_price) AS total_revenue
FROM sales_data;
SELECT 
SUM(
IFNULL(item_price,0) +
IFNULL(item_tax,0) +
IFNULL(shipping_price,0)
) AS total_revenue
FROM sales_data;
SELECT 
SUM(
IFNULL(item_price,0) +
IFNULL(item_tax,0) +
IFNULL(shipping_price,0)
) 
/
COUNT(DISTINCT amazon_order_id) 
AS avg_order_value
FROM sales_data;
SELECT 
YEAR(purchase_date) AS year,
SUM(
IFNULL(item_price,0) +
IFNULL(item_tax,0) +
IFNULL(shipping_price,0)
) AS revenue
FROM sales_data
GROUP BY year
ORDER BY year;
SELECT 
YEAR(purchase_date) AS year,
SUM(
IFNULL(item_price,0) +
IFNULL(item_tax,0) +
IFNULL(shipping_price,0)
) AS revenue
FROM sales_data
GROUP BY YEAR(purchase_date)
ORDER BY YEAR(purchase_date);
SELECT 
YEAR(purchase_date) AS year,
MONTH(purchase_date) AS month,
SUM(
IFNULL(item_price,0) +
IFNULL(item_tax,0) +
IFNULL(shipping_price,0)
) AS revenue
FROM sales_data
GROUP BY YEAR(purchase_date), MONTH(purchase_date)
ORDER BY YEAR(purchase_date), MONTH(purchase_date);
SELECT 
seller_sku AS vendor,
SUM(
IFNULL(item_price,0) +
IFNULL(item_tax,0) +
IFNULL(shipping_price,0)
) AS revenue
FROM sales_data
GROUP BY seller_sku
ORDER BY revenue DESC
LIMIT 10;
SELECT 
sku AS vendor,
SUM(
IFNULL(item_price,0) +
IFNULL(item_tax,0) +
IFNULL(shipping_price,0)
) AS revenue
FROM sales_data
GROUP BY sku
ORDER BY revenue DESC
LIMIT 10;
SELECT 
ship_state,
SUM(
IFNULL(item_price,0) +
IFNULL(item_tax,0) +
IFNULL(shipping_price,0)
) AS revenue
FROM sales_data
GROUP BY ship_state
ORDER BY revenue DESC
LIMIT 10;