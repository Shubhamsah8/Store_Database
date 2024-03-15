CREATE DATABASE OnlineStore;
USE OnlineStore;

-- Create a table for storing information about customers
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Phone VARCHAR(20),
    Address VARCHAR(255)
);

-- Create a table for storing information about orders
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Create a table for storing information about products
CREATE TABLE Products (
    ProductID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Price DECIMAL(10, 2),
    StockQuantity INT
);

-- Create a table for storing information about order items
CREATE TABLE OrderItems (
    OrderItemID INT PRIMARY KEY AUTO_INCREMENT,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    Price DECIMAL(10, 2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Inserting values inside the customer tables
INSERT INTO Customers (Name, Email, Phone, Address) 
VALUES 
    ('Shubham Sah', 'shubhamsah086@gmail.com', '8779817254', 'Malad Mumbai'),
    ('Johan Liebert', 'johanliebert798@gmail.com', '9968956987', 'Red Rose Mansion New York'),
    ('Funny Valentine', 'valentineKira986@gmail.com', '8796589687', 'White House'),
    ('Diego Brando', 'diegobrando823@gmail.com', '9866598658', 'Mansion');
    
-- Inserting the values inside the Products Table
INSERT INTO Products (Name, Price, StockQuantity) 
VALUES 
    ('Laptop', 75978.19, 10),
    ('Smartphone', 19599.99, 20),
    ('Tablet', 65798.99, 15);
    
-- Inserting the values inside the Orders table
INSERT INTO Orders (CustomerID, OrderDate, TotalAmount) 
VALUES 
    (1, '2024-03-14', 19899.98),
    (2, '2024-03-14', 12999.98),
    (3, '2024-03-13', 98299.99);

-- Inserting the values inside the Order Items table
INSERT INTO OrderItems (OrderID, ProductID, Quantity, Price) 
VALUES 
    (1, 1, 1, 99989.99),
    (1, 2, 2, 1146599.98),
    (2, 3, 1, 298799.99),
    (3, 1, 1, 963299.99),
    (3, 3, 1, 125299.99);

