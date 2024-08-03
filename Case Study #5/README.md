README
Overview
This project aims to support Danny’s vision for Clique Bait, an online seafood store, by analyzing the dataset and calculating funnel fallout rates. The analysis includes user interactions, campaign effectiveness, and product performance on the Clique Bait website.

Available Data
The following five datasets are used in this analysis:

Users: Information about customers who visit the website.
Events: Logs of customer visits and interactions.
Event Identifier: Types of events captured.
Campaign Identifier: Information about campaigns run on the website.
Page Hierarchy: Details about pages on the website.
Tables and Schemas
Users Table

Column	Type	Description
user_id	INTEGER	Unique identifier for each user
cookie_id	VARCHAR	Unique identifier for each cookie
start_date	TIMESTAMP	Start date of the user
Events Table

Column	Type	Description
visit_id	VARCHAR	Unique identifier for each visit
cookie_id	VARCHAR	Unique identifier for each cookie
page_id	INTEGER	Identifier for the page
event_type	INTEGER	Type of event
sequence_number	INTEGER	Sequence number to order events within a visit
event_time	TIMESTAMP	Timestamp of the event
Event Identifier Table

Column	Type	Description
event_type	INTEGER	Type of event
event_name	VARCHAR	Name of the event
Campaign Identifier Table

Column	Type	Description
campaign_id	INTEGER	Unique identifier for each campaign
products	VARCHAR	Products associated with the campaign
campaign_name	VARCHAR	Name of the campaign
start_date	TIMESTAMP	Start date of the campaign
end_date	TIMESTAMP	End date of the campaign
Page Hierarchy Table

Column	Type	Description
page_id	INTEGER	Unique identifier for each page
page_name	VARCHAR	Name of the page
product_category	VARCHAR	Category of the product
product_id	INTEGER	Unique identifier for each product
Analysis Questions
Enterprise Relationship Diagram (ERD)

Create an ERD to visualize relationships between tables.
Digital Analysis

Number of users
Average cookies per user
Unique visits per month
Events count by event type
Percentage of visits with a purchase event
Percentage of visits viewing the checkout page but not purchasing
Top 3 pages by views
Views and cart adds per product category
Top 3 products by purchases
Product Funnel Analysis

Views, cart adds, abandoned cart, and purchases for each product
Aggregated data for each product category
Insights based on the funnel data
Campaigns Analysis

Detailed analysis of visits, events, and campaigns
Generate insights for campaign README
Overview
This project aims to support Danny’s vision for Clique Bait, an online seafood store, by analyzing the dataset and calculating funnel fallout rates. The analysis includes user interactions, campaign effectiveness, and product performance on the Clique Bait website.

Available Data
The following five datasets are used in this analysis:

Users: Information about customers who visit the website.
Events: Logs of customer visits and interactions.
Event Identifier: Types of events captured.
Campaign Identifier: Information about campaigns run on the website.
Page Hierarchy: Details about pages on the website.
Tables and Schemas
Users Table

Column	Type	Description
user_id	INTEGER	Unique identifier for each user
cookie_id	VARCHAR	Unique identifier for each cookie
start_date	TIMESTAMP	Start date of the user
Events Table

Column	Type	Description
visit_id	VARCHAR	Unique identifier for each visit
cookie_id	VARCHAR	Unique identifier for each cookie
page_id	INTEGER	Identifier for the page
event_type	INTEGER	Type of event
sequence_number	INTEGER	Sequence number to order events within a visit
event_time	TIMESTAMP	Timestamp of the event
Event Identifier Table

Column	Type	Description
event_type	INTEGER	Type of event
event_name	VARCHAR	Name of the event
Campaign Identifier Table

Column	Type	Description
campaign_id	INTEGER	Unique identifier for each campaign
products	VARCHAR	Products associated with the campaign
campaign_name	VARCHAR	Name of the campaign
start_date	TIMESTAMP	Start date of the campaign
end_date	TIMESTAMP	End date of the campaign
Page Hierarchy Table

Column	Type	Description
page_id	INTEGER	Unique identifier for each page
page_name	VARCHAR	Name of the page
product_category	VARCHAR	Category of the product
product_id	INTEGER	Unique identifier for each product
Analysis Questions
Enterprise Relationship Diagram (ERD)

Create an ERD to visualize relationships between tables.
Digital Analysis

Number of users
Average cookies per user
Unique visits per month
Events count by event type
Percentage of visits with a purchase event
Percentage of visits viewing the checkout page but not purchasing
Views and cart adds per product categoryViews
Top 3 products by purchases
Product Funnel Analysis

Views, cart adds, abandoned cart, and purchases for each product
Aggregated data for each product category
Insights based on the funnel data
Campaigns Analysis

Detailed analysis of visits, events, and campaigns
Generate insights for campaign effectiveness