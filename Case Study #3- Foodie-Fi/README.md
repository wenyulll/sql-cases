# Foodie-Fi Case Study

## Introduction

Subscription-based businesses are increasingly popular, and Danny realized a significant gap in the market. He wanted to create a new streaming service focusing solely on food-related content, like Netflix but with only cooking shows!

In 2020, Danny and a few smart friends launched Foodie-Fi, offering monthly and annual subscriptions that give customers unlimited on-demand access to exclusive food videos from around the world.

Danny created Foodie-Fi with a data-driven mindset, ensuring all future investment decisions and new features were decided using data. This case study focuses on using subscription-style digital data to answer important business questions.

## Available Data

Danny has shared the data design for Foodie-Fi and descriptions of each database table. The case study focuses on two tables, with a challenge to create a new table for the Foodie-Fi team.

All datasets exist within the `foodie_fi` database schema. Be sure to include this reference within your SQL scripts as you start exploring the data and answering the case study questions.

### Entity Relationship Diagram

**Plans Table:**

| plan_id | plan_name      | price |
|---------|----------------|-------|
| 0       | trial          | 0     |
| 1       | basic monthly  | 9.90  |
| 2       | pro monthly    | 19.90 |
| 3       | pro annual     | 199   |
| 4       | churn          | NULL  |

**Subscriptions Table:**

| customer_id | plan_id | start_date |
|-------------|---------|------------|
| 1           | 0       | 2020-08-01 |
| 1           | 1       | 2020-08-08 |
| 2           | 0       | 2020-09-20 |
| 2           | 3       | 2020-09-27 |
| 11          | 0       | 2020-11-19 |
| 11          | 4       | 2020-11-26 |
| 13          | 0       | 2020-12-15 |
| 13          | 1       | 2020-12-22 |
| 13          | 2       | 2021-03-29 |
| 15          | 0       | 2020-03-17 |
| 15          | 2       | 2020-03-24 |
| 15          | 4       | 2020-04-29 |
| 16          | 0       | 2020-05-31 |
| 16          | 1       | 2020-06-07 |
| 16          | 3       | 2020-10-21 |
| 18          | 0       | 2020-07-06 |
| 18          | 2       | 2020-07-13 |
| 19          | 0       | 2020-06-22 |
| 19          | 2       | 2020-06-29 |
| 19          | 3       | 2020-08-29 |

## Case Study Questions

### A. Customer Journey
Based on the sample customers provided in the subscriptions table, write a brief description about each customer’s onboarding journey.

### B. Data Analysis Questions
1. How many customers has Foodie-Fi ever had?
2. What is the monthly distribution of trial plan start_date values for our dataset? Use the start of the month as the group by value.
3. What plan start_date values occur after the year 2020 for our dataset? Show the breakdown by count of events for each plan_name.
4. What is the customer count and percentage of customers who have churned, rounded to 1 decimal place?
5. How many customers have churned straight after their initial free trial? What percentage is this, rounded to the nearest whole number?
6. What is the number and percentage of customer plans after their initial free trial?
7. What is the customer count and percentage breakdown of all 5 plan_name values as of 2020-12-31?
8. How many customers have upgraded to an annual plan in 2020?
9. How many days on average does it take for a customer to upgrade to an annual plan from the day they join Foodie-Fi?
10. Can you further break down this average value into 30-day periods (i.e., 0-30 days, 31-60 days, etc.)?
11. How many customers downgraded from a pro monthly to a basic monthly plan in 2020?

### C. Challenge Payment Question
Create a new payments table for the year 2020 that includes amounts paid by each customer in the subscriptions table with the following requirements:
- Monthly payments occur on the same day of the month as the original start_date of any monthly paid plan.
- Upgrades from basic to monthly or pro plans are reduced by the current paid amount in that month and start immediately.
- Upgrades from pro monthly to pro annual are paid at the end of the current billing period and start at the end of the month period.
- Once a customer churns, they will no longer make payments.

Example outputs for this table might look like:

| customer_id | plan_id | plan_name      | payment_date | amount | payment_order |
|-------------|---------|----------------|--------------|--------|---------------|
| 1           | 1       | basic monthly  | 2020-08-08   | 9.90   | 1             |
| 1           | 1       | basic monthly  | 2020-09-08   | 9.90   | 2             |
| 2           | 3       | pro annual     | 2020-09-27   | 199.00 | 1             |
| 13          | 1       | basic monthly  | 2020-12-22   | 9.90   | 1             |
| 15          | 2       | pro monthly    | 2020-03-24   | 19.90  | 1             |
| 16          | 1       | basic monthly  | 2020-06-07   | 9.90   | 1             |
| 18          | 2       | pro monthly    | 2020-07-13   | 19.90  | 1             |
| 19          | 2       | pro monthly    | 2020-06-29   | 19.90  | 1             |

### D. Outside The Box Questions
1. How would you calculate the rate of growth for Foodie-Fi?
2. What key metrics would you recommend Foodie-Fi management to track over time to assess the performance of their overall business?
3. What are some key customer journeys or experiences that you would analyze further to improve customer retention?
4. If the Foodie-Fi team were to create an exit survey shown to customers who wish to cancel their subscription, what questions would you include in the survey?
5. What business levers could the Foodie-Fi team use to reduce the customer churn rate? How would you validate the effectiveness of your ideas?

## Interactive SQL Instance

You can use the embedded DB Fiddle below to access these example datasets. This interactive session has everything you need to start solving these questions using SQL.

Click on the "Edit on DB Fiddle" link on the top right-hand corner of the embedded session to access a fully functional SQL editor.

## Final Thoughts

This case study reflects realistic questions typically focused on product-related analytics in various industries, especially in the digital space. If you are ready for the next 8 Week SQL challenge case study, click on the banner below to get started with case study #4!

## Contact

For any questions or issues, please reach out to support@datawithdanny.com.

