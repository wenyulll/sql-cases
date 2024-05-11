-- Creating the runners table
CREATE TABLE runners (
    runner_id INT,
    registration_date DATE
);
-- Creating the customer_orders table
CREATE TABLE customer_orders (
    order_id INT,
    customer_id INT,
    pizza_id INT,
    exclusions VARCHAR,
    extras VARCHAR,
    order_time TIMESTAMP
);