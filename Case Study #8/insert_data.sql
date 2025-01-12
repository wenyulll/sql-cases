-- Create the interest_metrics table
CREATE TABLE fresh_segments.interest_metrics (
    _month INT,
    _year INT,
    month_year VARCHAR(10),
    interest_id INT,
    composition FLOAT,
    index_value FLOAT,
    ranking INT,
    percentile_ranking FLOAT
);

-- Create the interest_map table
CREATE TABLE fresh_segments.interest_map (
    id INT,
    interest_name VARCHAR(255),
    interest_summary TEXT,
    created_at TIMESTAMP,
    last_modified TIMESTAMP
);