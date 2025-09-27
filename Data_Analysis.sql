CREATE DATABASE IF NOT EXISTS EcommerceDB;
USE EcommerceDB;

CREATE TABLE Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    country VARCHAR(50),
    signup_date DATE
);

INSERT INTO Customers (name, country, signup_date) VALUES
('Alice Johnson', 'USA', '2023-02-15'),
('Bob Smith', 'Canada', '2023-03-10'),
('Charlie Brown', 'USA', '2022-12-05'),
('Diana Prince', 'UK', '2023-01-20'),
('Ethan Hunt', 'USA', '2023-05-01');

CREATE TABLE Products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2)
);

INSERT INTO Products (product_name, category, price) VALUES
('Laptop', 'Electronics', 1200.00),
('Smartphone', 'Electronics', 800.00),
('Headphones', 'Accessories', 150.00),
('Desk Chair', 'Furniture', 250.00),
('Coffee Mug', 'Kitchen', 15.00);

CREATE TABLE Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

INSERT INTO Orders (customer_id, order_date, total_amount) VALUES
(1, '2023-03-01', 1350.00),
(2, '2023-03-15', 800.00),
(3, '2023-01-10', 250.00),
(1, '2023-04-05', 1215.00),
(4, '2023-04-12', 15.00),
(5, '2023-06-20', 2000.00);

CREATE TABLE OrderDetails (
    orderdetail_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    subtotal DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

INSERT INTO OrderDetails (order_id, product_id, quantity, subtotal) VALUES
(1, 1, 1, 1200.00), -- Laptop
(1, 3, 1, 150.00),  -- Headphones
(2, 2, 1, 800.00),  -- Smartphone
(3, 4, 1, 250.00),  -- Desk Chair
(4, 1, 1, 1200.00), -- Laptop
(4, 5, 1, 15.00),   -- Coffee Mug
(5, 1, 1, 1200.00), -- Laptop
(5, 2, 1, 800.00);  -- Smartphone