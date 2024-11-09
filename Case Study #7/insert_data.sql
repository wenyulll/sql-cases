CREATE TABLE balanced_tree.product_details (
    product_id VARCHAR(10) PRIMARY KEY,
    price DECIMAL(10, 2),
    product_name VARCHAR(100),
    category_id INT,
    segment_id INT,
    style_id INT,
    category_name VARCHAR(50),
    segment_name VARCHAR(50),
    style_name VARCHAR(50)
);

-- Create `sales` table
CREATE TABLE balanced_tree.sales (
    prod_id VARCHAR(10),
    qty INT,
    price DECIMAL(10, 2),
    discount DECIMAL(5, 2),
    member CHAR(1),
    txn_id VARCHAR(10),
    start_txn_time TIMESTAMP
);

-- Create `product_hierarchy` table
CREATE TABLE balanced_tree.product_hierarchy (
    id INT PRIMARY KEY,
    parent_id INT,
    level_text VARCHAR(50),
    level_name VARCHAR(50)
);

-- Create `product_prices` table
CREATE TABLE balanced_tree.product_prices (
    id INT PRIMARY KEY,
    product_id VARCHAR(10),
    price DECIMAL(10, 2)
);
CREATE TABLE balanced_tree.product_details (
    product_id VARCHAR(10) PRIMARY KEY,
    price DECIMAL(10, 2),
    product_name VARCHAR(100),
    category_id INT,
    segment_id INT,
    style_id INT,
    category_name VARCHAR(50),
    segment_name VARCHAR(50),
    style_name VARCHAR(50)
);

-- Create `sales` table
CREATE TABLE balanced_tree.sales (
    prod_id VARCHAR(10),
    qty INT,
    price DECIMAL(10, 2),
    discount DECIMAL(5, 2),
    member CHAR(1),
    txn_id VARCHAR(10),
    start_txn_time TIMESTAMP
);

-- Create `product_hierarchy` table
CREATE TABLE balanced_tree.product_hierarchy (
    id INT PRIMARY KEY,
    parent_id INT,
    level_text VARCHAR(50),
    level_name VARCHAR(50)
);

-- Create `product_prices` table
CREATE TABLE balanced_tree.product_prices (
    id INT PRIMARY KEY,
    product_id VARCHAR(10),
    price DECIMAL(10, 2)
);
