-- First we specify which database we are using
USE salesdb;

-- Question 1 Achieving 1NF (First Normal Form)
-- split the table into two by creating two tables
-- creating orders table
CREATE TABLE orders(
orderID INT PRIMARY KEY,
customerName VARCHAR (100)
);
-- creating products table containing a foreign key which is order id
CREATE TABLE products(
productId INT auto_increment KEY,
orderID INT,
productName VARCHAR(40),
FOREIGN KEY (orderID) REFERENCES orders(orderID)
);
-- inserting into orders table
insert into orders(orderID,customerName)VALUES
(101,'John Doe'),
(102,'Jane Smith'),
(103,'Emily clark');
-- inserting into products table
INSERT INTO products(orderID,productName)VALUES
(101,'Laptop'),
(101, 'Mouse'),
(102,'Tablet'),
(102,'Keybord'),
(102,'mouse'),
(103,'Phone');

--=============================================
--Question 2 Achieving 2NF (Second Normal Form) 🧩
--===========================================
-- to create another orders table in salesdb we must drop it first,
-- and to drop the orders table we have to drop the products table first coz it is referenced by a foreign key constraint
DROP TABLE Products ;
Drop Table Orders;

-- CustomerName row exhibit partial dependancy hence the table must be split in TO fo achieve 2NF
-- 1. Orders table
-- here CustomerName depends only on OrderID.
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

-- 2. OrderDetails table
-- here Quantity depends on the full composite key (OrderID, Product)
CREATE TABLE OrderDetails (
    OrderID INT,
    Product VARCHAR(50),
    Quantity INT,
    PRIMARY KEY (OrderID, Product),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Insert data into Orders
INSERT INTO Orders (OrderID, CustomerName) VALUES
(101, 'John Doe'),
(102, 'Jane Smith'),
(103, 'Emily Clark');

-- Insert data into OrderDetails
INSERT INTO OrderDetails (OrderID, Product, Quantity) VALUES
(101, 'Laptop', 2),
(101, 'Mouse', 1),
(102, 'Tablet', 3),
(102, 'Keyboard', 1),
(102, 'Mouse', 2),
(103, 'Phone', 1);
