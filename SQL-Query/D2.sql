SELECT
  sales_transaction_date AS Date,
  SUM(CASE WHEN product_id = 7 THEN 1 ELSE 0 END) AS Sprint,
  SUM(CASE WHEN product_id = 8 THEN 1 ELSE 0 END) AS Sprint_LE
FROM sales
WHERE 
  (product_id = 8 AND sales_transaction_date BETWEEN '2017-02-15' AND '2017-03-08')
  OR
  (product_id = 7 AND sales_transaction_date BETWEEN '2016-10-10' AND '2016-10-31')
GROUP BY sales_transaction_date
ORDER BY sales_transaction_date;