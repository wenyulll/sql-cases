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

-- Insert sample data into interest_map
INSERT INTO fresh_segments.interest_map
(id, interest_name, interest_summary, created_at, last_modified)
VALUES
(1, 'Fitness Enthusiasts', 'Consumers using fitness tracking apps and websites.', '2016-05-26 14:57:59', '2018-05-23 11:30:12'),
(2, 'Gamers', 'Consumers researching game reviews and cheat codes.', '2016-05-26 14:57:59', '2018-05-23 11:30:12'),
(3, 'Car Enthusiasts', 'Readers of automotive news and car reviews.', '2016-05-26 14:57:59', '2018-05-23 11:30:12'),
(4, 'Luxury Retail Researchers', 'Consumers researching luxury product reviews and gift ideas.', '2016-05-26 14:57:59', '2018-05-23 11:30:12'),
(5, 'Brides & Wedding Planners', 'People researching wedding ideas and vendors.', '2016-05-26 14:57:59', '2018-05-23 11:30:12');

-- Question 1: Modify month_year column to a date type with the start of the month
ALTER TABLE fresh_segments.interest_metrics
ALTER COLUMN month_year TYPE DATE USING TO_DATE(month_year, 'MM-YYYY');