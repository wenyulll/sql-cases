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
