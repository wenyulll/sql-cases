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
-- Creating the runner_orders table
CREATE TABLE runner_orders (
    order_id INT,
    runner_id INT,
    pickup_time TIMESTAMP,
    distance VARCHAR,
    duration VARCHAR,
    cancellation VARCHAR
);

-- Creating the pizza_names table
CREATE TABLE pizza_names (
    pizza_id INT,
    pizza_name VARCHAR
);

-- Creating the pizza_recipes table
CREATE TABLE pizza_recipes (
    pizza_id INT,
    toppings VARCHAR
);

-- Creating the pizza_toppings table
CREATE TABLE pizza_toppings (
    topping_id INT,
    topping_name VARCHAR
);


-- Inserting data into the runners table
INSERT INTO runners (runner_id, registration_date) VALUES
(1, '2021-01-01'),
(2, '2021-01-03'),
(3, '2021-01-08'),
(4, '2021-01-15');
