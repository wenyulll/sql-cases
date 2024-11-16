
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
