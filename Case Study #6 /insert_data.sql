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

SELECT COUNT(DISTINCT user_id) AS total_users
FROM clique_bait.users;