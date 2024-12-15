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

-- Insert sample data into interest_metrics
INSERT INTO fresh_segments.interest_metrics
(_month, _year, month_year, interest_id, composition, index_value, ranking, percentile_ranking)
VALUES
(7, 2018, '07-2018', 32486, 11.89, 6.19, 1, 99.86),
(7, 2018, '07-2018', 6106, 9.93, 5.31, 2, 99.73),
(7, 2018, '07-2018', 18923, 10.85, 5.29, 3, 99.59),
(7, 2018, '07-2018', 6344, 10.32, 5.10, 4, 99.45),
(7, 2018, '07-2018', 100, 10.77, 5.04, 5, 99.31);

-- Create the interest_map table
CREATE TABLE fresh_segments.interest_map (
    id INT,
    interest_name VARCHAR(255),
    interest_summary TEXT,
    created_at TIMESTAMP,
    last_modified TIMESTAMP
);