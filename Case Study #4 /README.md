# Data Bank Case Study

## Introduction
Data Bank is a pioneering financial innovation integrating neo-banking, cryptocurrency, and data storage. It operates as a digital-only bank, offering both banking services and a secure distributed data storage platform. Customers' cloud data storage limits are directly linked to their account balances.

## Available Data
The Data Bank team has provided a data model and sample datasets for analysis. The data includes:

- **Regions**: Information about different regions where nodes are located.
- **Customer Nodes**: Details about customers' node assignments.
- **Customer Transactions**: Records of customer deposits, withdrawals, and purchases.

## Case Study Questions

### A. Customer Nodes Exploration
1. **Unique Nodes**: Determine the number of unique nodes in the Data Bank system.
2. **Nodes per Region**: Calculate the number of nodes in each region.
3. **Customers per Region**: Find out how many customers are allocated to each region.
4. **Reallocation Days**: Compute the average number of days customers are reallocated to a different node.
5. **Reallocation Days Percentiles**: Calculate the median, 80th, and 95th percentiles for reallocation days for each region.

### B. Customer Transactions
1. **Transaction Count and Amount**: Find the unique count and total amount for each transaction type.
2. **Average Historical Deposits**: Determine the average total historical deposit counts and amounts for all customers.
3. **Monthly Activity**: For each month, count how many Data Bank customers make more than one deposit and either one purchase or one withdrawal in a single month.
4. **Closing Balance**: Calculate the closing balance for each customer at the end of the month.
5. **Balance Increase Percentage**: Find the percentage of customers who increase their closing balance by more than 5%.

### C. Data Allocation Challenge
To test various hypotheses, Data Bank wants to allocate data using three different options:
1. **Option 1**: Data allocation based on the amount of money at the end of the previous month.
2. **Option 2**: Data allocation based on the average amount of money kept in the account in the previous 30 days.
3. **Option 3**: Data updated in real-time.

Generate the following data elements to help estimate data provisioning for each option:
- Running customer balance including the impact of each transaction.
- Customer balance at the end of each month.
- Minimum, average, and maximum values of the running balance for each customer.

Using the available data, calculate how much data would have been required for each option on a monthly basis.

### D. Extra Challenge
Data Bank wants to calculate data growth using an interest calculation. With an annual interest rate of 6%, the interest is calculated daily at the end of each day. Determine how much data would be required for this option on a monthly basis, initially without compounding interest. Optionally, perform this calculation with daily compounding interest.

## Extension Request
Using the outputs from the above sections:
1. Generate headline insights to market Data Bank's security features to potential investors and customers.
2. Prepare a 1-page presentation slide summarizing the various options for data provisioning, aiding the Data Bank management team in decision-making.

## Conclusion
This case study simulates traditional banking transactions data with a twist, providing insights into customer banking scenarios.

## Official Solutions
For the official solutions and explanations, consider joining the Serious SQL course by Danny Ma, priced at $49 USD ($29 for students). The course includes access to all written content, community events, live and recorded SQL training videos, and more.

For student discounts, send an email to support@datawithdanny.com from your educational email or include your enrolment details for a speedy response.

## Community Solutions
This section will be updated with community member solutions and links to their GitHub repositories in the future.

## Final Thoughts
The 8 Week SQL Challenge is proudly brought to you by Danny Ma and the Data With Danny virtual data apprenticeship program. Students or those undertaking further studies can avail of a $20 USD student discount. For more details, visit the official DWD Discord server for live events, training, workshops, and more.


