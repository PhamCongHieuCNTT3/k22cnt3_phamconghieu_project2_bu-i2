DROP DATABASE IF EXISTS k22cnt3_phamconghieu_project2;
CREATE DATABASE k22cnt3_phamconghieu_project2;
USE k22cnt3_phamconghieu_project2;

DROP TABLE IF EXISTS ProductReviews;
DROP TABLE IF EXISTS OrderDetails;
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Products;
DROP TABLE IF EXISTS Customers;

CREATE TABLE Customers (
    CustomerID VARCHAR(10) PRIMARY KEY,
    FullName VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    Address VARCHAR(255)
);

CREATE TABLE Products (
    ProductID VARCHAR(10) PRIMARY KEY,
    ProductName VARCHAR(100),
    Description TEXT,
    Price DECIMAL(10, 2),
    Stock INT
);

CREATE TABLE Orders (
    OrderID VARCHAR(10) PRIMARY KEY,
    CustomerID VARCHAR(10),
    OrderDate DATE,
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID VARCHAR(10),
    ProductID VARCHAR(10),
    Quantity INT,
    Price DECIMAL(10, 2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

CREATE TABLE ProductReviews (
    ReviewID VARCHAR(10) PRIMARY KEY,
    ProductID VARCHAR(10),
    CustomerID VARCHAR(10),
    Rating INT CHECK (Rating BETWEEN 1 AND 5),
    Comment TEXT,
    ReviewDate DATE,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Inserting sample data into the Customers table
INSERT INTO Customers (CustomerID, FullName, Email, Phone, Address) VALUES
('C001', 'Alice Nguyen', 'alice@example.com', '0912345678', '123 Main St, Hanoi'),
('C002', 'Bob Tran', 'bob@example.com', '0912345679', '456 Elm St, Ho Chi Minh City'),
('C003', 'Charlie Pham', 'charlie@example.com', '0912345680', '789 Maple St, Da Nang'),
('C004', 'David Le', 'david@example.com', '0912345681', '321 Pine St, Hue'),
('C005', 'Eva Vo', 'eva@example.com', '0912345682', '654 Cedar St, Can Tho');

-- Inserting sample data into the Products table
INSERT INTO Products (ProductID, ProductName, Description, Price, Stock) VALUES
('P001', 'Laptop', 'High-performance laptop', 1500.00, 10),
('P002', 'Smartphone', 'Latest model smartphone', 800.00, 25),
('P003', 'Headphones', 'Noise-cancelling headphones', 150.00, 50),
('P004', 'Smartwatch', 'Water-resistant smartwatch', 200.00, 30),
('P005', 'Tablet', '10-inch display tablet', 300.00, 20);

-- Inserting sample data into the Orders table
INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount) VALUES
('O001', 'C001', '2024-10-01', 1650.00),
('O002', 'C002', '2024-10-05', 300.00),
('O003', 'C003', '2024-10-10', 950.00),
('O004', 'C004', '2024-10-15', 150.00),
('O005', 'C005', '2024-10-20', 800.00);

-- Inserting sample data into the OrderDetails table
INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Quantity, Price) VALUES
(1, 'O001', 'P001', 1, 1500.00),
(2, 'O001', 'P003', 1, 150.00),
(3, 'O002', 'P005', 1, 300.00),
(4, 'O003', 'P002', 1, 800.00),
(5, 'O003', 'P004', 1, 150.00);

-- Inserting sample data into the ProductReviews table
INSERT INTO ProductReviews (ReviewID, ProductID, CustomerID, Rating, Comment, ReviewDate) VALUES
('R001', 'P001', 'C001', 5, 'Excellent product!', '2024-10-02'),
('R002', 'P002', 'C002', 4, 'Very good, but can improve.', '2024-10-06'),
('R003', 'P003', 'C003', 5, 'Loved it!', '2024-10-11'),
('R004', 'P004', 'C004', 3, 'Average quality.', '2024-10-16'),
('R005', 'P005', 'C005', 4, 'Good value for money.', '2024-10-21');




-- Select all records from the Customers table
SELECT * FROM Customers;

-- Select all records from the Products table
SELECT * FROM Products;

-- Select all records from the Orders table
SELECT * FROM Orders;

-- Select all records from the OrderDetails table
SELECT * FROM OrderDetails;

-- Select all records from the ProductReviews table
SELECT * FROM ProductReviews;
