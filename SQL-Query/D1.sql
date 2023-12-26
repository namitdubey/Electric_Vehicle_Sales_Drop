SELECT sales_transaction_date AS Date, 
COUNT(sales_transaction_date) AS Unit_Sold,
CASE
 WHEN ROW_NUMBER() OVER (ORDER BY sales_transaction_date) > 6
 THEN SUM(COUNT(sales_transaction_date)) OVER (ORDER BY sales_transaction_date ROWS  BETWEEN 6 PRECEDING AND CURRENT ROW)
 ELSE NULL
 END AS CUMM_7_days
FROM sales
WHERE product_id = 7 AND sales_transaction_date BETWEEN '2016-10-10' AND '2016-10-31'
GROUP BY sales_transaction_date
ORDER BY sales_transaction_date;
