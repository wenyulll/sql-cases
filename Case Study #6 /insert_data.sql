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