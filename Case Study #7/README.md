Balanced Tree Clothing SQL Case Study
Overview
Balanced Tree Clothing Company is a fashion brand that specializes in creating a curated range of clothing and lifestyle products for the modern adventurer. The CEO, Danny, has requested a data-driven analysis of the company’s sales performance. This case study focuses on analyzing transaction and product data to provide insights into sales, transactions, and product trends for monthly reporting.

Objectives
The goal of this analysis is to answer key business questions regarding:

High-Level Sales Metrics: Analyze total sales quantity, revenue, and discount impact.
Transaction Metrics: Understand transaction patterns, including unique transaction counts, average products per transaction, and membership-based differences.
Product Insights: Identify top-performing products and segment- and category-level trends.
Automated Reporting: Create a single SQL script that generates a monthly report.
Bonus Challenge: Recreate the product hierarchy using recursive SQL queries to transform multiple tables.
Datasets
Product Details (balanced_tree.product_details)
Contains metadata for all products, including product IDs, categories, segments, and style details.

Sales Data (balanced_tree.sales)
Transaction data including product ID, quantity, price, discount, membership status, and transaction timestamp.

Product Hierarchy (balanced_tree.product_hierarchy)
Defines the category and segment structure for the products.

Product Prices (balanced_tree.product_prices)
Lists individual prices for each product by product ID.

Case Study Questions
This analysis addresses the following questions. Each question should be answered with a single SQL query or a series of queries.

High-Level Sales Analysis
Total Quantity Sold: Calculate the total quantity sold for all products.
Total Revenue Before Discounts: Calculate the total revenue for all products before applying discounts.
Total Discount Amount: Determine the total discount amount for all products.
Transaction Analysis
Unique Transaction Count: Count the unique transactions.
Average Products per Transaction: Calculate the average number of unique products per transaction.
Revenue Percentiles: Determine the 25th, 50th, and 75th percentiles of revenue per transaction.
Average Discount per Transaction: Calculate the average discount value per transaction.
Membership Split: Calculate the percentage split of transactions between members and non-members.
Average Revenue by Membership: Calculate the average revenue for member and non-member transactions.
Product Analysis
Top Products by Revenue: List the top 3 products by total revenue (before discounts).
Segment-Level Metrics: Calculate the total quantity, revenue, and discount for each segment.
Top Product per Segment: Identify the top-selling product for each segment.
Category-Level Metrics: Calculate the total quantity, revenue, and discount for each category.
Top Product per Category: Identify the top-selling product for each category.
Revenue Split by Product and Segment: Calculate the percentage split of revenue by product within each segment.
Revenue Split by Segment and Category: Calculate the percentage split of revenue by segment within each category.
Total Revenue by Category Split: Calculate the percentage split of total revenue by category.
Product Penetration: Determine the transaction penetration rate for each product (i.e., the proportion of transactions that include each product).
Most Common Product Combinations: Identify the most common combination of three different products in single transactions.
Reporting Challenge
Write a single SQL script that combines all of the previous questions into a report to run at the beginning of each month. This report should be adaptable for different months by adjusting date filters.

Bonus Challenge
Use a single SQL query to transform the product_hierarchy and product_prices tables into the product_details format. Use recursive CTEs as needed.