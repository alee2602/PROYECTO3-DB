CREATE TABLE categories (
    CategoryID INT,
    CategoryName VARCHAR2(50),
    Description VARCHAR2(120),
    PRIMARY KEY (CategoryID)
);

SELECT * FROM categories;

CREATE TABLE customers (
    CustomerID VARCHAR2(10) PRIMARY KEY,
    CompanyName VARCHAR2(100),
    ContactName VARCHAR2(100),
    ContactTitle VARCHAR2(100),
    City VARCHAR2(100),
    Country VARCHAR2(100)
);

SELECT * FROM customers;

CREATE TABLE employees (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR2(100),
    Title VARCHAR2(100),
    City VARCHAR2(100),
    Country VARCHAR2(100),
    ReportsTo INT
);

SELECT * FROM employees;

CREATE TABLE products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    QuantityPerUnit VARCHAR(100),
    UnitPrice NUMBER(10, 2),
    Discontinued INT,
    CategoryID INT,
    FOREIGN KEY (CategoryID) REFERENCES categories(CategoryID)
);

SELECT * FROM products;

CREATE TABLE shippers (
    ShipperID INT PRIMARY KEY,
    CompanyName VARCHAR2(255)
);

SELECT * FROM shippers;

CREATE TABLE orders (
    OrderID INT PRIMARY KEY,
    CustomerID VARCHAR2(10),
    EmployeeID INT,
    OrderDate DATE,
    RequiredDate DATE,
    ShippedDate DATE,
    ShipperID INT,
    Freight NUMBER(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES customers(CustomerID),
    FOREIGN KEY (EmployeeID) REFERENCES employees(EmployeeID),
    FOREIGN KEY (ShipperID) REFERENCES shippers(ShipperID)
);

SELECT * FROM orders;

CREATE TABLE order_details (
    OrderID INT,
    ProductID INT,
    UnitPrice NUMBER(10, 2),
    Quantity INT,
    Discount NUMBER(5, 2),
    PRIMARY KEY (OrderID, ProductID),
    FOREIGN KEY (OrderID) REFERENCES orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES products(ProductID)
);

SELECT * FROM order_details;
