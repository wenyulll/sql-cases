-- ERD creation using DB Diagram tool

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


-- Number of users
SELECT COUNT(DISTINCT user_id) AS total_users
FROM clique_bait.users;

-- Average cookies per user
SELECT AVG(cookie_count) AS avg_cookies_per_user
FROM (
    SELECT user_id, COUNT(cookie_id) AS cookie_count
    FROM clique_bait.users
    GROUP BY user_id
) AS cookie_counts;


-- Unique visits per month
SELECT DATE_TRUNC('month', event_time) AS month, COUNT(DISTINCT visit_id) AS unique_visits
FROM clique_bait.events
GROUP BY month
ORDER BY month;


-- Events count by event type
SELECT ei.event_name, COUNT(e.event_type) AS event_count
FROM clique_bait.events e
JOIN clique_bait.event_identifier ei
ON e.event_type = ei.event_type
GROUP BY ei.event_name;

-- Percentage of visits with a purchase event
SELECT 
    (COUNT(DISTINCT CASE WHEN e.event_type = 3 THEN visit_id END) * 100.0 / COUNT(DISTINCT visit_id)) AS purchase_percentage
FROM clique_bait.events e;


-- Percentage of visits viewing the checkout page but not purchasing
SELECT 
    (COUNT(DISTINCT CASE WHEN e.page_id = 12 AND e.visit_id NOT IN (SELECT visit_id FROM clique_bait.events WHERE event_type = 3) THEN e.visit_id END) * 100.0 / COUNT(DISTINCT visit_id)) AS checkout_no_purchase_percentage
FROM clique_bait.events e;


-- Top 3 pages by views
SELECT ph.page_name, COUNT(e.page_id) AS views
FROM clique_bait.events e
JOIN clique_bait.page_hierarchy ph
ON e.page_id = ph.page_id
WHERE e.event_type = 1
GROUP BY ph.page_name
ORDER BY views DESC
LIMIT 3;

-- Views and cart adds per product category
SELECT ph.product_category, 
    COUNT(CASE WHEN e.event_type = 1 THEN 1 END) AS views, 
    COUNT(CASE WHEN e.event_type = 2 THEN 1 END) AS cart_adds
FROM clique_bait.events e
JOIN clique_bait.page_hierarchy ph
ON e.page_id = ph.page_id
GROUP BY ph.product_category;



-- Top 3 products by purchases
SELECT ph.page_name, COUNT(e.event_type) AS purchases
FROM clique_bait.events e
JOIN clique_bait.page_hierarchy ph
ON e.page_id = ph.page_id
WHERE e.event_type = 3
GROUP BY ph.page_name
ORDER BY purchases DESC
LIMIT 3;

-- Funnel data for each product
SELECT 
    ph.page_name AS product_name,
    COUNT(CASE WHEN e.event_type = 1 THEN 1 END) AS views, 
    COUNT(CASE WHEN e.event_type = 2 THEN 1 END) AS cart_adds, 
    COUNT(CASE WHEN e.event_type = 2 AND e.visit_id NOT IN (SELECT visit_id FROM clique_bait.events WHERE event_type = 3) THEN 1 END) AS abandoned_cart,
    COUNT(CASE WHEN e.event_type = 3 THEN 1 END) AS purchases
FROM clique_bait.events e
JOIN clique_bait.page_hierarchy ph
ON e.page_id = ph.page_id
GROUP BY ph.page_name;


-- Funnel data for each product category
SELECT 
    ph.product_category,
    COUNT(CASE WHEN e.event_type = 1 THEN 1 END) AS views, 
    COUNT(CASE WHEN e.event_type = 2 THEN 1 END) AS cart_adds, 
    COUNT(CASE WHEN e.event_type = 2 AND e.visit_id NOT IN (SELECT visit_id FROM clique_bait.events WHERE event_type = 3) THEN 1 END) AS abandoned_cart,
    COUNT(CASE WHEN e.event_type = 3 THEN 1 END) AS purchases
FROM clique_bait.events e
JOIN clique_bait.page_hierarchy ph
ON e.page_id = ph.page_id
GROUP BY ph.product_category;

-- Campaign analysis table
CREATE TABLE campaign_analysis AS
SELECT 
    u.user_id,
    e.visit_id,
    MIN(e.event_time) AS visit_start_time,
    COUNT(CASE WHEN e.event_type = 1 THEN 1 END) AS page_views,
    COUNT(CASE WHEN e.event_type = 2 THEN 1 END) AS cart_adds,
    MAX(CASE WHEN e.event_type = 3 THEN 1 ELSE 0 END) AS purchase,
    ci.campaign_name,
    COUNT(CASE WHEN e.event_type = 4 THEN 1 END) AS impressions,
    COUNT(CASE WHEN e.event_type = 5 THEN 1 END) AS clicks,

JOIN clique_bait.users u
ON e.cookie_id = u.cookie_id
LEFT JOIN clique_bait.campaign_identifier ci
ON e.event_time BETWEEN ci.start_date AND ci.end_date
JOIN