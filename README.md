# Pizza Runner Case Study - 8 Week SQL Challenge

## Overview
Welcome to the Pizza Runner case study from Danny Ma's 8 Week SQL Challenge! This repository contains SQL queries and solutions for various business questions posed in the Pizza Runner case study. This fictional pizza delivery company, Pizza Runner, uses a mobile app to manage orders and deliveries.

## Entity Relationship Diagram
Below is the entity relationship diagram for the Pizza Runner database which outlines how each table is interconnected:


## Raw Data
The Pizza Runner case study includes several key tables:

### Table 1: runners
| runner_id | registration_date |
|-----------|-------------------|
| 1         | 2021-01-01        |
| 2         | 2021-01-03        |
| 3         | 2021-01-08        |
| 4         | 2021-01-15        |

### Table 2: customer_orders
| order_id | customer_id | pizza_id | exclusions | extras | order_time          |
|----------|-------------|----------|------------|--------|---------------------|
| 1        | 101         | 1        |            |        | 2021-01-01 18:05:02 |
| 2        | 101         | 1        |            |        | 2021-01-01 19:00:52 |
| 3        | 102         | 1        |            | NaN    | 2021-01-02 23:51:23 |

### Table 3: runner_orders
| order_id | runner_id | pickup_time           | distance | duration   | cancellation           |
|----------|-----------|-----------------------|----------|------------|------------------------|
| 1        | 1         | 2021-01-01 18:15:34   | 20km     | 32 minutes |                        |
| 2        | 1         | 2021-01-01 19:10:54   | 20km     | 27 minutes |                        |

### Table 4: pizza_names
| pizza_id | pizza_name  |
|----------|-------------|
| 1        | Meat Lovers |
| 2        | Vegetarian  |

### Table 5: pizza_recipes
| pizza_id | toppings       |
|----------|----------------|
| 1        | 1,2,3,4,5,6,8,10 |
| 2        | 4,6,7,9,11,12  |

### Table 6: pizza_toppings
| topping_id | topping_name |
|------------|--------------|
| 1          | Bacon        |
| 2          | BBQ Sauce    |

## Case Study Questions
This case study is divided into several sections, each addressing different aspects of Pizza Runner's operations:

### A. Pizza Metrics
- How many pizzas were ordered?
- How many unique customer orders were made?
- How many successful orders were delivered by each runner?
- And more...

### B. Runner and Customer Experience
- How many runners signed up for each 1-week period?
- What was the average time it took for runners to arrive at Pizza Runner HQ?
- What was the average distance travelled for each customer?
- And more...

### C. Ingredient Optimisation
- What are the standard ingredients for each pizza?
- What was the most commonly added extra?
- What was the most common exclusion?
- And more...

### D. Pricing and Ratings
- Total revenue calculations
- Implementation of a new rating system
- Revenue after runner payments
- And more...

### E. Bonus Challenges
- Data design impact for new pizza types
- SQL INSERT demonstrations for new items
edit


