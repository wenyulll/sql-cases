CREATE TABLE clique_bait.event_identifier (
  event_type INTEGER,
  event_name VARCHAR(50)
);

CREATE TABLE clique_bait.campaign_identifier (
  campaign_id INTEGER,
  products VARCHAR(10),
  campaign_name VARCHAR(100),
  start_date TIMESTAMP,
  end_date TIMESTAMP
);

CREATE TABLE clique_bait.page_hierarchy (
  page_id INTEGER,
  page_name VARCHAR(50),
  product_category VARCHAR(50),
  product_id INTEGER
);

CREATE TABLE clique_bait.users (
  user_id INTEGER,
  cookie_id VARCHAR(50),
  start_date TIMESTAMP
);

CREATE TABLE clique_bait.events (
  visit_id VARCHAR(50),
  cookie_id VARCHAR(50),
  page_id INTEGER,
  event_type INTEGER,
  sequence_number INTEGER,
  event_time TIMESTAMP
);

-- Inserting data into event_identifier table
INSERT INTO clique_bait.event_identifier (event_type, event_name) VALUES
(1, 'Page View'),
(2, 'Add to Cart'),
(3, 'Purchase'),
(4, 'Ad Impression'),
(5, 'Ad Click');

-- Inserting data into campaign_identifier table
INSERT INTO clique_bait.campaign_identifier (campaign_id, products, campaign_name, start_date, end_date) VALUES
(1, '1-3', 'BOGOF - Fishing For Compliments', '2020-01-01 00:00:00', '2020-01-14 00:00:00'),
(2, '4-5', '25% Off - Living The Lux Life', '2020-01-15 00:00:00', '2020-01-28 00:00:00'),
(3, '6-8', 'Half Off - Treat Your Shellf(ish)', '2020-02-01 00:00:00', '2020-03-31 00:00:00');

-- Inserting data into page_hierarchy table
INSERT INTO clique_bait.page_hierarchy (page_id, page_name, product_category, product_id) VALUES
(1, 'Home Page', NULL, NULL),
(2, 'All Products', NULL, NULL),
(3, 'Salmon', 'Fish', 1),
(4, 'Kingfish', 'Fish', 2),
(5, 'Tuna', 'Fish', 3),
(6, 'Russian Caviar', 'Luxury', 4),
(7, 'Black Truffle', 'Luxury', 5),
(8, 'Abalone', 'Shellfish', 6),
(9, 'Lobster', 'Shellfish', 7),
(10, 'Crab', 'Shellfish', 8),
(11, 'Oyster', 'Shellfish', 9),
(12, 'Checkout', NULL, NULL),
(13, 'Confirmation', NULL, NULL);

-- Inserting data into users table
INSERT INTO clique_bait.users (user_id, cookie_id, start_date) VALUES
(397, '3759ff', '2020-03-30 00:00:00'),
(215, '863329', '2020-01-26 00:00:00'),
(191, 'eefca9', '2020-03-15 00:00:00'),
(89, '764796', '2020-01-07 00:00:00'),
(127, '17ccc5', '2020-01-22 00:00:00'),
(81, 'b0b666', '2020-03-01 00:00:00'),
(260, 'a4f236', '2020-01-08 00:00:00'),
(203, 'd1182f', '2020-04-18 00:00:00'),
(23, '12dbc8', '2020-01-18 00:00:00'),
(375, 'f61d69', '2020-01-03 00:00:00');

-- Inserting data into events table
INSERT INTO clique_bait.events (visit_id, cookie_id, page_id, event_type, sequence_number, event_time) VALUES
('719fd3', '3d83d3', 5, 1, 4, '2020-03-02 00:29:09.975502'),
('fb1eb1', 'c5ff25', 5, 2, 8, '2020-01-22 07:59:16.761931'),
('23fe81', '1e8c2d', 10, 1, 9, '2020-03-21 13:14:11.745667'),
('ad91aa', '648115', 6, 1, 3, '2020-04-27 16:28:09.824606'),
('5576d7', 'ac418c', 6, 1, 4, '2020-01-18 04:55:10.149236'),
('48308b', 'c686c1', 8, 1, 5, '2020-01-29 06:10:38.702163'),
('46b17d', '78f9b3', 7, 1, 12, '2020-02-16 09:45:31.926407'),
('9fd196', 'ccf057', 4, 1, 5, '2020-02-14 08:29:12.922164'),
('edf853', 'f85454', 1, 1, 1, '2020-02-22 12:59:07.652207'),
('3c6716', '02e74f', 3, 2, 5, '2020-01-31 17:56:20.777383');


SELECT COUNT(DISTINCT user_id) AS total_users
FROM clique_bait.users;

SELECT AVG(cookie_count) AS avg_cookies_per_user
FROM (
    SELECT user_id, COUNT(cookie_id) AS cookie_count
    FROM clique_bait.users
    GROUP BY user_id
) user_cookies;

SELECT DATE_TRUNC('month', event_time) AS month, COUNT(DISTINCT visit_id) AS unique_visits
FROM clique_bait.events
GROUP BY month
ORDER BY month;

SELECT ei.event_name, COUNT(e.event_type) AS event_count
FROM clique_bait.events e
JOIN clique_bait.event_identifier ei ON e.event_type = ei.event_type
GROUP BY ei.event_name
ORDER BY event_count DESC;


WITH total_visits AS (
    SELECT COUNT(DISTINCT visit_id) AS total_visits
    FROM clique_bait.events
),
purchase_visits AS (
    SELECT COUNT(DISTINCT visit_id) AS purchase_visits
    FROM clique_bait.events
    WHERE event_type = 3  -- 3代表购买事件
)
SELECT (purchase_visits::FLOAT / total_visits) * 100 AS purchase_percentage
FROM total_visits, purchase_visits;


