WITH cte AS (
    SELECT visited_on, 
           SUM(amount * 1.0) OVER (ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS moving_sum,
           RANK() OVER (ORDER BY visited_on) AS rk
    FROM (
        SELECT visited_on, SUM(amount) AS amount
        FROM Customer
        GROUP BY visited_on
    ) AS temp
)
SELECT visited_on, 
       moving_sum AS amount, 
       ROUND(moving_sum / 7.0, 2) AS average_amount
FROM cte
WHERE rk > 6;
