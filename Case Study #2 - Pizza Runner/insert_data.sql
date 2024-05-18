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

-- Inserting data into the customer_orders table
INSERT INTO customer_orders (order_id, customer_id, pizza_id, exclusions, extras, order_time) VALUES
(1, 101, 1, NULL, NULL, '2021-01-01 18:05:02'),
(2, 101, 1, NULL, NULL, '2021-01-01 19:00:52'),
(3, 102, 1, NULL, NULL, '2021-01-02 23:51:23'),
(3, 102, 2, NULL, 'NaN', '2021-01-02 23:51:23'),
(4, 103, 1, '4', NULL, '2021-01-04 13:23:46'),
(4, 103, 1, '4', NULL, '2021-01-04 13:23:46'),
(4, 103, 2, '4', NULL, '2021-01-04 13:23:46'),
(5, 104, 1, 'null', '1', '2021-01-08 21:00:29'),
(6, 101, 2, 'null', 'null', '2021-01-08 21:03:13'),
(7, 105, 2, 'null', '1', '2021-01-08 21:20:29'),
(8, 102, 1, 'null', 'null', '2021-01-09 23:54:33'),
(9, 103, 1, '4', '1, 5', '2021-01-10 11:22:59'),
(10, 104, 1, 'null', 'null', '2021-01-11 18:34:49'),
(10, 104, 1, '2, 6', '1, 4', '2021-01-11 18:34:49');

-- Inserting data into the runner_orders table
INSERT INTO runner_orders (order_id, runner_id, pickup_time, distance, duration, cancellation) VALUES
(1, 1, '2021-01-01 18:15:34', '20km', '32 minutes', NULL),
(2, 1, '2021-01-01 19:10:54', '20km', '27 minutes', NULL),
(3, 1, '2021-01-03 00:12:37', '13.4km', '20 mins', 'NaN'),
(4, 2, '2021-01-04 13:53:03', '23.4', '40', 'NaN'),
(5, 3, '2021-01-08 21:10:57', '10', '15', 'NaN'),
(6, 3, NULL, NULL, NULL, 'Restaurant Cancellation'),
(7, 2, '2020-01-08 21:30:45', '25km', '25mins', NULL),
(8, 2, '2020-01-10 00:15:02',

SELECT COUNT(*) AS total_pizzas_ordered
FROM customer_orders;

SELECT COUNT(DISTINCT order_id) AS unique_customer_orders
FROM customer_orders;

SELECT runner_id, COUNT(*) AS successful_orders
FROM runner_orders
WHERE cancellation IS NULL OR cancellation = 'NaN'
GROUP BY runner_id;
