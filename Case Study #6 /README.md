# 8 Week SQL Challenge: Case Study #6 - Clique Bait

## Introduction

**Clique Bait** is an online seafood store with a unique twist. Its founder and CEO, Danny Ma, has a background in digital data analytics and decided to expand his expertise into the seafood industry. This case study focuses on supporting Danny’s vision by analyzing data from the Clique Bait online store and calculating funnel fallout rates.

## Available Data

For this case study, there are 5 datasets provided, which need to be combined to answer the various questions.

### 1. `users`

This table contains information about customers visiting the Clique Bait website, identified by their `cookie_id`.

| user_id | cookie_id | start_date          |
|---------|-----------|---------------------|
| 397     | 3759ff    | 2020-03-30 00:00:00 |
| 215     | 863329    | 2020-01-26 00:00:00 |
| 191     | eefca9    | 2020-03-15 00:00:00 |
| 89      | 764796    | 2020-01-07 00:00:00 |
| 127     | 17ccc5    | 2020-01-22 00:00:00 |

### 2. `events`

This table logs customer visits at a `cookie_id` level. It captures events like page views, add to cart actions, and purchases.

| visit_id | cookie_id | page_id | event_type | sequence_number | event_time              |
|----------|-----------|---------|------------|-----------------|-------------------------|
| 719fd3   | 3d83d3    | 5       | 1          | 4               | 2020-03-02 00:29:09.975 |
| fb1eb1   | c5ff25    | 5       | 2          | 8               | 2020-01-22 07:59:16.762 |
| 23fe81   | 1e8c2d    | 10      | 1          | 9               | 2020-03-21 13:14:11.746 |
| ad91aa   | 648115    | 6       | 1          | 3               | 2020-04-27 16:28:09.825 |
| 5576d7   | ac418c    | 6       | 1          | 4               | 2020-01-18 04:55:10.149 |
### 3. `event_identifier`

This table provides descriptions for each event type captured in the `events` table.

| event_type | event_name   |
|------------|--------------|
| 1          | Page View    |
| 2          | Add to Cart  |
| 3          | Purchase     |
| 4          | Ad Impression|
| 5          | Ad Click     |

### 4. `campaign_identifier`

This table contains information about the campaigns run on the Clique Bait website in 2020.

| campaign_id | products | campaign_name                   | start_date            | end_date              |
|-------------|----------|---------------------------------|-----------------------|-----------------------|
| 1           | 1-3      | BOGOF - Fishing For Compliments | 2020-01-01 00:00:00   | 2020-01-14 00:00:00   |
| 2           | 4-5      | 25% Off - Living The Lux Life   | 2020-01-15 00:00:00   | 2020-01-28 00:00:00   |
| 3           | 6-8      | Half Off - Treat Your Shellf(ish)| 2020-02-01 00:00:00  | 2020-03-31 00:00:00   |

### 5. `page_hierarchy`

This table lists all pages on the Clique Bait website tagged with data from user interactions.

| page_id | page_name     | product_category | product_id |
|---------|---------------|------------------|------------|
| 1       | Home Page     | null             | null       |
| 2       | All Products  | null             | null       |
| 3       | Salmon        | Fish             | 1          |
| 4       | Kingfish      | Fish             | 2          |
| 5       | Tuna          | Fish             | 3          |
| 6       | Russian Caviar| Luxury           | 4          |
| 7       | Black Truffle | Luxury           | 5          |
| 8       | Abalone       | Shellfish        | 6          |
| 9       | Lobster       | Shellfish        | 7          |
| 10      | Crab          | Shellfish        | 8          |
| 11      | Oyster        | Shellfish        | 9          |
| 12      | Checkout      | null             | null       |
| 13      | Confirmation  | null             | null       |

## Case Study Questions

### 1. Enterprise Relationship Diagram

Using the provided schema details, create an ERD (Entity Relationship Diagram) for the datasets:

```sql
CREATE TABLE clique_bait.event_identifier (
  "event_type" INTEGER,
  "event_name" VARCHAR(13)
);

CREATE TABLE clique_bait.campaign_identifier (
  "campaign_id" INTEGER,
  "products" VARCHAR(3),
  "campaign_name" VARCHAR(33),
  "start_date" TIMESTAMP,
  "end_date" TIMESTAMP
);

CREATE TABLE clique_bait.page_hierarchy (
  "page_id" INTEGER,
  "page_name" VARCHAR(14),
  "product_category" VARCHAR(9),
  "product_id" INTEGER
);

CREATE TABLE clique_bait.users (
  "user_id" INTEGER,
  "cookie_id" VARCHAR(6),
  "start_date" TIMESTAMP
);

CREATE TABLE clique_bait.events (
  "visit_id" VARCHAR(6),
  "cookie_id" VARCHAR(6),
  "page_id" INTEGER,
  "event_type" INTEGER,
  "sequence_number" INTEGER,
  "event_time" TIMESTAMP
);

2. Digital Analysis
Using the available datasets, answer the following questions with a single query for each:

How many users are there?
How many cookies does each user have on average?
What is the unique number of visits by all users per month?
What is the number of events for each event type?
What is the percentage of visits which have a purchase event?
What is the percentage of visits which view the checkout page but do not have a purchase event?
What are the top 3 pages by number of views?
What is the number of views and cart adds for each product category?
What are the top 3 products by purchases?
3. Product Funnel Analysis
Using a single SQL query, create a new output table with the following details:

How many times was each product viewed?
How many times was each product added to cart?
How many times was each product added to a cart but not purchased (abandoned)?
How many times was each product purchased?
Additionally, create another table with similar details aggregated for each product category.

Use the two new output tables to answer the following questions:

Which product had the most views, cart adds, and purchases?
Which product was most likely to be abandoned?
Which product had the highest view-to-purchase percentage?
What is the average conversion rate from view to cart add?
What is the average conversion rate from cart add to purchase?
4. Campaigns Analysis
Generate a table for each unique visit_id with the following columns:

user_id
visit_id
visit_start_time: the earliest event_time for each visit
page_views: count of page views for each visit
cart_adds: count of product cart add events for each visit
purchase: 1/0 flag if a purchase event exists for each visit
campaign_name: map the visit to a campaign if the visit_start_time falls between the start_date and end_date
impression: count of ad impressions for each visit
click: count of ad clicks for each visit
(Optional): cart_products: a comma-separated list of products added to the cart sorted by the order they were added to the cart.
Use the generated table to derive at least 5 insights for the Clique Bait team. Emphasize the most important points in an infographic.

