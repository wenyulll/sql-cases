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

