
SELECT id, first_name, last_name, city
FROM customers
WHERE city = 'Los Angeles';

SELECT c.id AS customer_id,
       c.first_name,
       c.last_name,
       COUNT(a.id) AS account_count
FROM customers c
LEFT JOIN accounts a ON a.customer_id = c.id
GROUP BY c.id, c.first_name, c.last_name
ORDER BY account_count DESC;

SELECT COALESCE(SUM(t.amount), 0) AS total_last_month
FROM transactions t
WHERE t.date >= date_trunc('month', CURRENT_DATE) - INTERVAL '1 month'
  AND t.date <  date_trunc('month', CURRENT_DATE);
