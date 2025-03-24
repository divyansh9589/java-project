CREATE DATABASE ecommerce;
USE ecommerce;
CREATE TABLE users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100)
);

CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100)
);

CREATE TABLE ratings (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    product_id INT,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO users (name) VALUES ('Alice'), ('Bob'), ('Charlie');
DESC products;
ALTER TABLE products ADD COLUMN product_name VARCHAR(255) NOT NULL;

INSERT INTO products (product_name) VALUES ('Laptop'), ('Smartphone'), ('Headphones'), ('Smartwatch'), ('Tablet');

INSERT INTO ratings (user_id, product_id, rating) VALUES
(1, 1, 5), (1, 2, 4), (1, 3, 3),
(2, 2, 5), (2, 3, 4), (2, 4, 5),
(3, 1, 3), (3, 4, 5), (3, 5, 4);

CREATE TABLE feedback (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    product_id INT,
    feedback VARCHAR(10) CHECK (feedback IN ('like', 'dislike')),
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES products(product_id) ON DELETE CASCADE
);

