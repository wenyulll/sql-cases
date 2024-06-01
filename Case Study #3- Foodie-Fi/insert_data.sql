-- Create the plans table
CREATE TABLE foodie_fi.plans (
    plan_id INT PRIMARY KEY,
    plan_name VARCHAR(50),
    price DECIMAL(5, 2)
);

-- Insert data into the plans table
INSERT INTO foodie_fi.plans (plan_id, plan_name, price) VALUES
(0, 'trial', 0),
(1, 'basic monthly', 9.90),
(2, 'pro monthly', 19.90),
(3, 'pro annual', 199),
(4, 'churn', NULL);

-- Create the subscriptions table
CREATE TABLE foodie_fi.subscriptions (
    customer_id INT,
    plan_id INT,
    start_date DATE,
    PRIMARY KEY (customer_id, plan_id, start_date)
);

-- Insert data into the subscriptions table
INSERT INTO foodie_fi.subscriptions (customer_id, plan_id, start_date) VALUES
(1, 0, '2020-08-01'),
(1, 1, '2020-08-08'),
(2, 0, '2020-09-20'),
(2, 3, '2020-09-27'),
(11, 0, '2020-11-19'),
(11, 4, '2020-11-26'),
(13, 0, '2020-12-15'),
(13, 1, '2020-12-22'),
(13, 2, '2021-03-29'),
(15, 0, '2020-03-17'),
(15, 2, '2020-03-24'),
(15, 4, '2020-04-29'),
(16, 0, '2020-05-31'),
(16, 1, '2020-06-07'),
(16, 3, '2020-10-21'),
(18, 0, '2020-07-06'),
(18, 2, '2020-07-13'),
(19, 0, '2020-06-22'),
(19, 2, '2020-06-29'),
(19, 3, '2020-08-29');

-- 1. How many customers has Foodie-Fi ever had?

SELECT COUNT(DISTINCT customer_id) AS total_customers
FROM foodie_fi.subscriptions;


-- 2. What is the monthly distribution of trial plan start_date values for our dataset? Use the start of the month as the group by value.
SELECT DATE_TRUNC('month', start_date) AS month_start, COUNT(*) AS trial_starts
FROM foodie_fi.subscriptions
WHERE plan_id = 0
GROUP BY DATE_TRUNC('month', start_date)
ORDER BY month_start;

-- 3. What plan start_date values occur after the year 2020 for our dataset? Show the breakdown by count of events for each plan_name.
SELECT p.plan_name, COUNT(*) AS count
FROM foodie_fi.subscriptions s
JOIN foodie_fi.plans p ON s.plan_id = p.plan_id
WHERE start_date > '2020-12-31'
GROUP BY p.plan_name
ORDER BY count DESC;

-- 4. What is the customer count and percentage of customers who have churned, rounded to 1 decimal place?
WITH total_customers AS (
    SELECT COUNT(DISTINCT customer_id) AS total
    FROM foodie_fi.subscriptions
),
churned_customers AS (
    SELECT COUNT(DISTINCT customer_id) AS churned
    FROM foodie_fi.subscriptions
    WHERE plan_id = 4
)
SELECT 
    churned_customers.churned,
    ROUND((churned_customers.churned::DECIMAL / total_customers.total) * 100, 1) AS churn_percentage
FROM churned_customers, total_customers;

-- 5. How many customers have churned straight after their initial free trial? What percentage is this, rounded to the nearest whole number?
WITH first_plan AS (
    SELECT customer_id, MIN(start_date) AS first_date
    FROM foodie_fi.subscriptions
    GROUP BY customer_id
),
churn_after_trial AS (
    SELECT s.customer_id
    FROM foodie_fi.subscriptions s
    JOIN first_plan fp ON s.customer_id = fp.customer_id AND s.start_date = fp.first_date
    WHERE s.plan_id = 0
    AND EXISTS (
        SELECT 1
        FROM foodie_fi.subscriptions s2
        WHERE s2.customer_id = s.customer_id
        AND s2.plan_id = 4
        AND s2.start_date > s.start_date
        AND NOT EXISTS (
            SELECT 1
            FROM foodie_fi.subscriptions s3
            WHERE s3.customer_id = s.customer_id
            AND s3.start_date > s.start_date AND s3.start_date < s2.start_date
        )
    )
),
total_customers AS (
    SELECT COUNT(DISTINCT customer_id) AS total
    FROM foodie_fi.subscriptions
)
SELECT 
    COUNT(churn_after_trial.customer_id) AS churn_after_trial_count,
    ROUND((COUNT(churn_after_trial.customer_id)::DECIMAL / total_customers.total) * 100) AS percentage
FROM churn_after_trial, total_customers;

-- 6. What is the number and percentage of customer plans after their initial free trial?
-- 7. What is the customer count and percentage breakdown of all 5 plan_name values as of 2020-12-31?
-- 8. How many customers have upgraded to an annual plan in 2020?
-- 9. How many days on average does it take for a customer to upgrade to an annual plan from the day they join Foodie-Fi?
-- 10. Can you further break down this average value into 30-day periods (i.e., 0-30 days, 31-60 days, etc.)?
-- 11. How many customers downgraded from a pro monthly to a basic monthly plan in 2020?
