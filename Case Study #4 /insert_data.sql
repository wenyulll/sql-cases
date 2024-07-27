 CREATE TABLE regions (
    region_id INT PRIMARY KEY,
    region_name VARCHAR(50)
);

 CREATE TABLE customer_nodes (
    customer_id INT,
    region_id INT,
    node_id INT,
    start_date DATE,
    end_date DATE,
    PRIMARY KEY (customer_id, start_date)
);

 CREATE TABLE customer_transactions (
    customer_id INT,
    txn_date DATE,
    txn_type VARCHAR(50),
    txn_amount INT
);

-- Insert data into the regions table
INSERT INTO regions (region_id, region_name) VALUES
(1, 'Africa'),
(2, 'America'),
(3, 'Asia'),
(4, 'Europe'),
(5, 'Oceania');

-- Insert data into the customer_nodes table
INSERT INTO customer_nodes (customer_id, region_id, node_id, start_date, end_date) VALUES
(1, 3, 4, '2020-01-02', '2020-01-03'),
(2, 3, 5, '2020-01-03', '2020-01-17'),
(3, 5, 4, '2020-01-27', '2020-02-18'),
(4, 5, 4, '2020-01-07', '2020-01-19'),
(5, 3, 3, '2020-01-15', '2020-01-23'),
(6, 1, 1, '2020-01-11', '2020-02-06'),
(7, 2, 5, '2020-01-20', '2020-02-04'),
(8, 1, 2, '2020-01-15', '2020-01-28'),
(9, 4, 5, '2020-01-21', '2020-01-25'),
(10, 3, 4, '2020-01-13', '2020-01-14');

-- Insert data into the customer_transactions table
INSERT INTO customer_transactions (customer_id, txn_date, txn_type, txn_amount) VALUES
(429, '2020-01-21', 'deposit', 82),
(155, '2020-01-10', 'deposit', 712),
(398, '2020-01-01', 'deposit', 196),
(255, '2020-01-14', 'deposit', 563),
(185, '2020-01-29', 'deposit', 626),
(309, '2020-01-13', 'deposit', 995),
(312, '2020-01-20', 'deposit', 485),
(376, '2020-01-03', 'deposit', 706),
(188, '2020-01-13', 'deposit', 601),
(138, '2020-01-11', 'deposit', 520);


-- How many unique nodes are there on the Data Bank system?


SELECT COUNT(DISTINCT node_id) AS unique_nodes FROM customer_nodes;

-- What is the number of nodes per region?

SELECT region_name, COUNT(DISTINCT node_id) AS node_count
FROM customer_nodes
JOIN regions ON customer_nodes.region_id = regions.region_id
GROUP BY region_name;

-- How many customers are allocated to each region?

SELECT region_name, COUNT(DISTINCT customer_id) AS customer_count
FROM customer_nodes
JOIN regions ON customer_nodes.region_id = regions.region_id
GROUP BY region_name;

-- How many days on average are customers reallocated to a different node?
SELECT AVG(end_date - start_date) AS average_days
FROM customer_nodes;

-- What is the median, 80th and 95th percentile for this same reallocation days metric for each region?
SELECT 
    region_name,
    PERCENTILE_CONT(0.50) WITHIN GROUP (ORDER BY end_date - start_date) AS median_days,
    PERCENTILE_CONT(0.80) WITHIN GROUP (ORDER BY end_date - start_date) AS percentile_80_days,
    PERCENTILE_CONT(0.95) WITHIN GROUP (ORDER BY end_date - start_date) AS percentile_95_days
FROM customer_nodes
JOIN regions ON customer_nodes.region_id = regions.region_id
GROUP BY region_name;

-- B. Customer Transactions
-- What is the unique count and total amount for each transaction type?

SELECT txn_type, COUNT(*) AS unique_count, SUM(txn_amount) AS total_amount
FROM customer_transactions
GROUP BY txn_type;

-- What is the average total historical deposit counts and amounts for all customers?
SELECT AVG(deposit_count) AS avg_deposit_count, AVG(deposit_amount) AS avg_deposit_amount
FROM (
    SELECT customer_id, COUNT(*) AS deposit_count, SUM(txn_amount) AS deposit_amount
    FROM customer_transactions
    WHERE txn_type = 'deposit'
    GROUP BY customer_id
) AS deposits;

-- 3. **Monthly Activity**: For each month, count how many Data Bank customers make more than one deposit and either one purchase or one withdrawal in a single month.

SELECT
    DATE_TRUNC('month', txn_date) AS txn_month,
    COUNT(DISTINCT customer_id) AS active_customers
FROM (
    SELECT
        customer_id,
        txn_date,
        COUNT(*) FILTER (WHERE txn_type = 'deposit') AS deposit_count,
        COUNT(*) FILTER (WHERE txn_type = 'purchase') AS purchase_count,
        COUNT(*) FILTER (WHERE txn_type = 'withdrawal') AS withdrawal_count
    FROM customer_transactions
    GROUP BY customer_id, txn_date
) AS monthly_activity
WHERE deposit_count > 1 AND (purchase_count > 0 OR withdrawal_count > 0)
GROUP BY txn_month;

-- 4. **Closing Balance**: Calculate the closing balance for each customer at the end of the month.
SELECT customer_id,
       SUM(CASE WHEN txn_type = 'deposit' THEN txn_amount ELSE -txn_amount END) AS closing_balance
FROM customer_transactions
GROUP BY customer_id;

-- 5. **Balance Increase Percentage**: Find the percentage of customers who increase their closing balance by more than 5%.

SELECT
    DATE_TRUNC('month', txn_date) AS txn_month,
    COUNT(DISTINCT customer_id) AS active_customers
FROM (
    SELECT
        customer_id,
        txn_date,
        COUNT(*) FILTER (WHERE txn_type = 'deposit') AS deposit_count,
        COUNT(*) FILTER (WHERE txn_type = 'purchase') AS purchase_count,
        COUNT(*) FILTER (WHERE txn_type = 'withdrawal') AS withdrawal_count
    FROM customer_transactions
    GROUP BY customer_id, txn_date
) AS monthly_activity
WHERE deposit_count > 1 AND (purchase_count > 0 OR withdrawal_count > 0)
GROUP BY txn_month;

-- ### C. Data Allocation Challenge
-- To test various hypotheses, Data Bank wants to allocate data using three different options:
-- 1. **Option 1**: Data allocation based on the amount of money at the end of the previous month.
WITH monthly_end_balance AS (
    SELECT
        customer_id,
        DATE_TRUNC('month', txn_date) AS txn_month,
        SUM(CASE WHEN txn_type = 'deposit' THEN txn_amount ELSE -txn_amount END) AS monthly_balance
    FROM customer_transactions
    GROUP BY customer_id, txn_month
)
SELECT
    customer_id,
    txn_month,
    monthly_balance AS end_month_balance
FROM monthly_end_balance;

-- 2. **Option 2**: Data allocation based on the average amount of money kept in the account in the previous 30 days.
WITH daily_balance AS (
    SELECT
        customer_id,
        txn_date,
        SUM(CASE WHEN txn_type = 'deposit' THEN txn_amount ELSE -txn_amount END) OVER (PARTITION BY customer_id ORDER BY txn_date) AS running_balance
    FROM customer_transactions
)
SELECT
    customer_id,
    txn_date,
    AVG(running_balance) OVER (PARTITION BY customer_id ORDER BY txn_date ROWS BETWEEN 29 PRECEDING AND CURRENT ROW) AS average_30_day_balance
FROM daily_balance;

-- 3. **Option 3**: Data updated in real-time.

SELECT
    customer_id,
    txn_date,
    SUM(CASE WHEN txn_type = 'deposit' THEN txn_amount ELSE -txn_amount END) OVER (PARTITION BY customer_id ORDER BY txn_date) AS real_time_balance
FROM customer_transactions;
-- Running Customer Balance, Customer Balance at End of Month, and Minimum, Average, Maximum Values of Running Balance for Each Customer:

WITH running_balance AS (
    SELECT
        customer_id,
        txn_date,
        SUM(CASE WHEN txn_type = 'deposit' THEN txn_amount ELSE -txn_amount END) OVER (PARTITION BY customer_id ORDER BY txn_date) AS balance
    FROM customer_transactions
),
monthly_balance AS (
    SELECT
        customer_id,
        DATE_TRUNC('month', txn_date) AS month,
        MAX(balance) AS end_month_balance
    FROM running_balance
    GROUP BY customer_id, month
)
SELECT
    customer_id,
    MIN(balance) AS min_balance,
    AVG(balance) AS avg_balance,
    MAX(balance) AS max_balance
FROM running_balance
GROUP BY customer_id;

SELECT
    customer_id,
    month,
    end_month_balance
FROM monthly_balance;

-- D. Extra Challenge
-- Data Growth Using an Interest Calculation without Compounding:

WITH daily_interest AS (
    SELECT
        customer_id,
        txn_date,
        SUM(CASE WHEN txn_type = 'deposit' THEN txn_amount ELSE -txn_amount END) OVER (PARTITION BY customer_id ORDER BY txn_date) AS daily_balance,
        SUM(CASE WHEN txn_type = 'deposit' THEN txn_amount ELSE -txn_amount END) OVER (PARTITION BY customer_id ORDER BY txn_date) * (0.06 / 365) AS daily_interest
    FROM customer_transactions
)
SELECT
    customer_id,
    DATE_TRUNC('month', txn_date) AS month,
    SUM(daily_interest) AS monthly_interest
FROM daily_interest
GROUP BY customer_id, month;
