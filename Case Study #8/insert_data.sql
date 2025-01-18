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

INSERT INTO fresh_segments.interest_metrics (_month, _year, month_year, interest_id, composition, index_value, ranking, percentile_ranking)
VALUES
(7, 2018, '07-2018', 32486, 11.89, 6.19, 1, 99.86),
(7, 2018, '07-2018', 6106, 9.93, 5.31, 2, 99.73),
(7, 2018, '07-2018', 18923, 10.85, 5.29, 3, 99.59),
(7, 2018, '07-2018', 6344, 10.32, 5.1, 4, 99.45),
(7, 2018, '07-2018', 100, 10.77, 5.04, 5, 99.31),
(7, 2018, '07-2018', 69, 10.82, 5.03, 6, 99.18),
(7, 2018, '07-2018', 79, 11.21, 4.97, 7, 99.04),
(7, 2018, '07-2018', 6111, 10.71, 4.83, 8, 98.90),
(7, 2018, '07-2018', 6214, 9.71, 4.83, 8, 98.90),
(7, 2018, '07-2018', 19422, 10.11, 4.81, 10, 98.63);

INSERT INTO fresh_segments.interest_map (id, interest_name, interest_summary, created_at, last_modified)
VALUES
(1, 'Fitness Enthusiasts', 'Consumers using fitness tracking apps and websites.', '2016-05-26 14:57:59', '2018-05-23 11:30:12'),
(2, 'Gamers', 'Consumers researching game reviews and cheat codes.', '2016-05-26 14:57:59', '2018-05-23 11:30:12'),
(3, 'Car Enthusiasts', 'Readers of automotive news and car reviews.', '2016-05-26 14:57:59', '2018-05-23 11:30:12'),
(4, 'Luxury Retail Researchers', 'Consumers researching luxury product reviews and gift ideas.', '2016-05-26 14:57:59', '2018-05-23 11:30:12'),
(5, 'Brides & Wedding Planners', 'People researching wedding ideas and vendors.', '2016-05-26 14:57:59', '2018-05-23 11:30:12'),
(6, 'Vacation Planners', 'Consumers reading reviews of vacation destinations and accommodations.', '2016-05-26 14:57:59', '2018-05-23 11:30:13'),
(7, 'Motorcycle Enthusiasts', 'Readers of motorcycle news and reviews.', '2016-05-26 14:57:59', '2018-05-23 11:30:13'),
(8, 'Business News Readers', 'Readers of online business news content.', '2016-05-26 14:57:59', '2018-05-23 11:30:12'),
(12, 'Thrift Store Shoppers', 'Consumers shopping online for clothing at thrift stores and researching locations.', '2016-05-26 14:57:59', '2018-03-16 13:14:00'),
(13, 'Advertising Professionals', 'People who read advertising industry news.', '2016-05-26 14:57:59', '2018-05-23 11:30:12');

-- Update the month_year column to a proper date type
UPDATE fresh_segments.interest_metrics
SET month_year = TO_DATE(month_year, 'MM-YYYY');

SELECT 
    month_year, 
    COUNT(*) AS record_count
FROM 
    fresh_segments.interest_metrics
GROUP BY 
    month_year
ORDER BY 
    month_year ASC NULLS FIRST;

-- Remove rows with null month_year
DELETE FROM fresh_segments.interest_metrics
WHERE month_year IS NULL;

-- Count interest_id in interest_metrics but not in interest_map
SELECT 
    COUNT(DISTINCT interest_id) AS unmatched_in_interest_map
FROM 
    fresh_segments.interest_metrics
WHERE 
    interest_id NOT IN (SELECT id FROM fresh_segments.interest_map);

    -- Count id in interest_map but not in interest_metrics
SELECT 
    COUNT(DISTINCT id) AS unmatched_in_interest_metrics
FROM 
    fresh_segments.interest_map
WHERE 
    id NOT IN (SELECT interest_id FROM fresh_segments.interest_metrics);

    -- Summarize id values in interest_map by total record count:
    SELECT 
    id, 
    COUNT(*) AS record_count
FROM 
    fresh_segments.interest_map
GROUP BY 
    id
ORDER BY 
    record_count DESC;

    -- Determine table join type for analsysis:
