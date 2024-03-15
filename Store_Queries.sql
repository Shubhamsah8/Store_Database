USE OnlineStore;

-- Retrieve the names and email addresses of all customers.
SELECT c.`name`, c.`email`
FROM customers c;

-- Find the total number of orders placed.
SELECT COUNT(orders.OrderID) AS Number_of_Orders_Placed
FROM orders;

-- List the products along with their prices and available stock quantities.
SELECT p.`name`, p.price, p.StockQuantity
FROM products p;

-- Show the order date and total amount for each order placed by a specific customer.
SELECT o.orderID, o.OrderDate, o.TotalAmount
FROM orders o;

-- Display the total number of items ordered in each order.(Group By)
SELECT oi.OrderID, COUNT(oi.OrderItemID) AS No_Of_Items
FROM orderitems oi
GROUP BY oi.OrderID;

-- Find the customer who has placed the most orders.
SELECT c.Name, COUNT(o.OrderID) AS TotalOrders
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY o.CustomerID
ORDER BY TotalOrders DESC
LIMIT 1;

-- Show the total revenue generated from all orders.
SELECT SUM(o.TotalAmount) AS Total_Revenue
FROM orders o;

-- List the products along with the total quantity ordered for each product.
SELECT p.`name`, SUM(oi.Quantity) AS Total_Quantity
FROM products p
INNER JOIN orderitems oi
ON p.ProductID = oi.ProductID
GROUP BY oi.ProductID;

-- Identify the customers who have not placed any orders.
SELECT c.`name`
FROM customers c
LEFT JOIN orders o
ON c.CustomerID = o.CustomerID
WHERE o.OrderID IS NULL;

-- Show the order date and total amount for orders placed on a specific date.
SELECT o.OrderDate, SUM(o.TotalAmount) AS Total_Amount_On_Order_Date
FROM orders o
GROUP BY o.OrderDate;

-- List the customers along with the total number of orders they have placed.
SELECT c.`name`, COUNT(o.OrderID) AS Total_No_Of_Orders
FROM customers c
LEFT JOIN orders o
ON c.CustomerID = o.CustomerID
GROUP BY c.`name`;

-- Find the average total amount spent on orders by customers who have placed more than 2 orders.
SELECT c.`name`, AVG(Total_Amount) AS Average_Total_Amount
FROM customers c
INNER JOIN (
    SELECT o.CustomerID, SUM(o.TotalAmount) AS Total_Amount
    FROM orders o
    GROUP BY o.CustomerID
    HAVING COUNT(o.OrderID) > 2
) AS SubQuery ON c.CustomerID = SubQuery.CustomerID
GROUP BY c.`name`;

-- Show the names of customers who have ordered both laptops and smartphones.
SELECT c.`name`
FROM customers c
INNER JOIN orders o ON o.CustomerID = c.CustomerID
INNER JOIN orderitems oi ON oi.OrderID = o.OrderID
INNER JOIN products p ON p.ProductID = oi.ProductID
WHERE p.`name` IN ('Laptop', 'Smartphone')
GROUP BY c.`name`
HAVING COUNT(DISTINCT p.`name`) = 2;

        