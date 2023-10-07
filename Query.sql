-- 1
SELECT 
    marital_status, ROUND(AVG(age), 2) AS average_age
FROM
    customer
WHERE
    marital_status IS NOT NULL
GROUP BY marital_status;

-- 2
SELECT 
    CASE
        WHEN gender = 0 THEN 'Wanita'
        ELSE 'Pria'
    END AS gender,
    ROUND(AVG(age), 2) AS average_age
FROM
    customer
GROUP BY gender;

-- 3
SELECT 
    storename, COUNT(qty) AS most_quantity
FROM
    store
        JOIN
    transaction USING (storeid)
GROUP BY storename
ORDER BY most_quantity
LIMIT 1;

-- 4
SELECT 
    product_name,
    CONCAT('Rp ', FORMAT(SUM(totalamount), 0)) AS totalamount
FROM
    product
        JOIN
    transaction USING (productId)
GROUP BY product_name
ORDER BY totalamount
LIMIT 1;

-- 5. Clustering
SELECT 
    c.customerid,
    age,
    gender,
    marital_status,
    income,
    ROUND((COUNT(transactionid) + SUM(qty) + SUM(totalamount)) / 100,
            2) AS spending_score
FROM
    customer c
        JOIN
    transaction t USING (customerid)
GROUP BY c.customerid , age , gender , marital_status , income
ORDER BY age;

-- 6. Time Series
select date, count(*) from transactions
group by date
order by date;
