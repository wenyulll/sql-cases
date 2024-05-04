-- 创建sales表
CREATE TABLE sales (
    customer_id CHAR(1),
    order_date DATE,
    product_id INTEGER
);

-- 创建menu表
CREATE TABLE menu (
    product_id INTEGER,
    product_name VARCHAR(50),
    price DECIMAL
);

-- 创建members表
CREATE TABLE members (
    customer_id CHAR(1),
    join_date DATE
);


-- 向sales表插入数据
INSERT INTO sales (customer_id, order_date, product_id) VALUES
('A', '2021-01-01', 1),
('A', '2021-01-01', 2),
('A', '2021-01-07', 2),
('A', '2021-01-10', 3),
('A', '2021-01-11', 3),
('A', '2021-01-11', 3),
('B', '2021-01-01', 2),
('B', '2021-01-02', 2),
('B', '2021-01-04', 1),
('B', '2021-01-11', 1),
('B', '2021-01-16', 3),
('B', '2021-02-01', 3),
('C', '2021-01-01', 3),
('C', '2021-01-01', 3),
('C', '2021-01-07', 3);

-- 向menu表插入数据
INSERT INTO menu (product_id, product_name, price) VALUES
(1, 'sushi', 10),
(2, 'curry', 15),
(3, 'ramen', 12);

-- 向members表插入数据
INSERT INTO members (customer_id, join_date) VALUES
('A', '2021-01-07'),
('B', '2021-01-09');


-- What is the total amount each customer spent at the restaurant?
SELECT sales.customer_id, SUM(menu.price) AS total_spend
FROM sales
JOIN menu ON sales.product_id = menu.product_id
GROUP BY sales.customer_id;


-- How many days has each customer visited the restaurant?
SELECT customer_id, COUNT(DISTINCT order_date) AS days_visited
FROM sales
GROUP BY customer_id;

-- What was the first item from the menu purchased by each customer?
SELECT sales.customer_id, menu.product_name
FROM sales
JOIN menu ON sales.product_id = menu.product_id
WHERE (sales.customer_id, sales.order_date) IN (
    SELECT sales.customer_id, MAX(sales.order_date) AS last_order_date
    FROM sales
    GROUP BY sales.customer_id
);


-- What is the most purchased item on the menu and how many times was it purchased by all customers?
SELECT menu.product_name, COUNT(*) AS times_purchased
FROM sales
JOIN menu ON sales.product_id = menu.product_id
GROUP BY menu.product_id, menu.product_name
ORDER BY times_purchased DESC
LIMIT 1;

-- Which item was the most popular for each customer? - most purchased item ranking
-- 最受每个客户欢迎的菜品
SELECT customer_id, product_name, MAX(purchases) AS most_purchased
FROM (
    SELECT sales.customer_id, menu.product_name, COUNT(*) AS purchases
    FROM sales
    JOIN menu ON sales.product_id = menu.product_id
    GROUP BY sales.customer_id, menu.product_id, menu.product_name
) AS sub
GROUP BY customer_id
ORDER BY most_purchased DESC;

-- Which item was purchased first by the customer after they became a member? item purchase day after the membership enrollement
-- Which item was purchased just before the customer became a member? 
-- What is the total items and amount spent for each member before they became a member?
-- If each $1 spent equates to 10 points and sushi has a 2x points multiplier - how many points would each customer have?
-- In the first week after a customer joins the program (including their join date) they earn 2x points on all items, not just sushi - how many points do customer A and B have at the end of January?ec