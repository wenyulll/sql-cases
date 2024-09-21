# 8 Week SQL Challenge: Case Study #6 - Clique Bait

## Introduction

**Clique Bait** is an online seafood store with a unique twist. Its founder and CEO, Danny Ma, has a background in digital data analytics and decided to expand his expertise into the seafood industry. This case study focuses on supporting Danny’s vision by analyzing data from the Clique Bait online store and calculating funnel fallout rates.

## Available Data

For this case study, there are 5 datasets provided, which need to be combined to answer the various questions.

### 1. `users`

This table contains information about customers visiting the Clique Bait website, identified by their `cookie_id`.

| user_id | cookie_id | start_date          |
|---------|-----------|---------------------|
| 397     | 3759ff    | 2020-03-30 00:00:00 |
| 215     | 863329    | 2020-01-26 00:00:00 |
| 191     | eefca9    | 2020-03-15 00:00:00 |
| 89      | 764796    | 2020-01-07 00:00:00 |
| 127     | 17ccc5    | 2020-01-22 00:00:00 |

### 2. `events`

This table logs customer visits at a `cookie_id` level. It captures events like page views, add to cart actions, and purchases.

| visit_id | cookie_id | page_id | event_type | sequence_number | event_time              |
|----------|-----------|---------|------------|-----------------|-------------------------|
| 719fd3   | 3d83d3    | 5       | 1          | 4               | 2020-03-02 00:29:09.975 |
| fb1eb1   | c5ff25    | 5       | 2          | 8               | 2020-01-22 07:59:16.762 |
| 23fe81   | 1e8c2d    | 10      | 1          | 9               | 2020-03-21 13:14:11.746 |
| ad91aa   | 648115    | 6       | 1          | 3               | 2020-04-27 16:28:09.825 |
| 5576d7   | ac418c    | 6       | 1          | 4               | 2020-01-18 04:55:10.149 |
