-- Create the interest_metrics table
CREATE TABLE fresh_segments.interest_metrics (
    _month INT,
    _year INT,
    month_year VARCHAR(7),
    interest_id INT,
    composition DECIMAL(5, 2),
    index_value DECIMAL(5, 2),
    ranking INT,
    percentile_ranking DECIMAL(5, 2)
);