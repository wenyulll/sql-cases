
# Fresh Segments Case Study

## Case Study #8 - Fresh Segments
**Author**: Danny Ma  
**Date**: July 9, 2021

---

## Overview
Fresh Segments is a digital marketing agency that specializes in analyzing online ad click behavior to understand customer interests. The company aggregates customer data and generates metrics that reveal interest rankings and compositions.

In this case study, we are tasked with analyzing aggregated metrics for a major client and extracting insights to help refine Fresh Segments' offerings.

---

## Objectives
1. **Data Exploration and Cleansing**:
   - Modify data types for usability.
   - Handle null values appropriately.
   - Summarize and validate data relationships.

2. **Interest Analysis**:
   - Identify interests consistently present across months.
   - Calculate cumulative percentages of records.
   - Evaluate the impact of filtering data by specific criteria.

3. **Segment Analysis**:
   - Analyze top and bottom-performing interests.
   - Identify interests with high variability in rankings.

4. **Index Analysis**:
   - Reverse-engineer average composition metrics.
   - Perform rolling average calculations for key metrics.

---
## Data Description
### Interest Metrics Table
| Column            | Description                                                                 |
|-------------------|-----------------------------------------------------------------------------|
| `_month`          | Month of the record.                                                       |
| `_year`           | Year of the record.                                                        |
| `month_year`      | Combination of month and year.                                             |
| `interest_id`     | Unique identifier for an interest segment.                                 |
| `composition`     | Percentage of the client’s customer list interacting with the interest.     |
| `index_value`     | Multiple of the average composition across all clients for this interest. |
| `ranking`         | Ranking of the interest by index_value.                                    |
| `percentile_ranking` | Percentile ranking of the index_value.                                 |

### Interest Map Table
| Column            | Description                                                                 |
|-------------------|-----------------------------------------------------------------------------|
| `id`              | Unique identifier for an interest.                                         |
| `interest_name`   | Descriptive name of the interest.                                          |
| `interest_summary` | Summary of the interest segment.                                         |
| `created_at`      | Timestamp when the interest was created.                                   |
| `last_modified`   | Timestamp of the last modification to the interest record.                |

## Case Study Questions
### Data Exploration and Cleansing
1. Modify `month_year` in `interest_metrics` to a date type with the start of the month.
2. Count records by `month_year` (sorted chronologically, with nulls first).
3. Address handling of null values in `interest_metrics`.
4. Identify `interest_id` values missing in either dataset.
5. Summarize record counts by `id` in `interest_map`.
6. Determine the appropriate join type and validate by examining `interest_id = 21246`.
7. Check if `month_year` values precede `created_at` in the joined table and validate these records.

### Interest Analysis
1. Identify interests present across all `month_year` dates.
2. Calculate the cumulative percentage of records starting at 14 months and determine the threshold for 90%.
3. Determine how many records would be removed based on the threshold in question 2.
4. Evaluate the business implications of removing these records.
5. Count unique interests per month after filtering.

### Segment Analysis
1. Find the top 10 and bottom 10 interests with the highest composition values, including their corresponding `month_year`.
2. Identify the 5 interests with the lowest average ranking.
3. Find the 5 interests with the largest standard deviation in `percentile_ranking`.
4. Analyze the variability in `percentile_ranking` for these interests.
5. Provide a customer segmentation overview and recommend products/services to target.

### Index Analysis
1. Calculate average composition values and identify the top 10 interests by month.
2. Determine which interests appear most frequently in the top 10.
3. Compute the average of the top 10 compositions per month.
4. Perform a 3-month rolling average of the maximum average composition from September 2018 to August 2019.
5. Analyze potential causes for fluctuations in maximum average composition.

---