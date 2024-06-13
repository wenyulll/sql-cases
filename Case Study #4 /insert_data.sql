 CREATE TABLE regions (
    region_id INT PRIMARY KEY,
    region_name VARCHAR(50)
);

 CREATE TABLE customer_nodes (
    customer_id INT,
    region_id INT,
    node_id INT,
    start_date DATE,
    end_date DATE,
    PRIMARY KEY (customer_id, start_date)
);

 CREATE TABLE customer_transactions (
    customer_id INT,
    txn_date DATE,
    txn_type VARCHAR(50),
    txn_amount INT
);
