USE ecommerce_db;
DROP TABLE Inventory;
CREATE TABLE Inventory (
    Inventory_ID INT PRIMARY KEY AUTO_INCREMENT,
    Product_ID INT NOT NULL,
    Stock_Quantity INT NOT NULL CHECK (Stock_Quantity >= 0),
    FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID)
);

SHOW TABLES;
CREATE TABLE Customer (
    Customer_Id INT PRIMARY KEY AUTO_INCREMENT,
    Customer_Name VARCHAR(100) NOT NULL
);
INSERT INTO Customer (Customer_Name)
VALUES
('Rahul'),
('Priya'),
('Anu');
SHOW TABLES;
CREATE TABLE Orders (
    Order_Id INT PRIMARY KEY AUTO_INCREMENT,
    Customer_Id INT NOT NULL,
    Order_Date DATE NOT NULL,
    Total_Amount DECIMAL(10,2) NOT NULL DEFAULT 0,
    Order_Status VARCHAR(20) NOT NULL DEFAULT 'PENDING',

    CONSTRAINT fk_orders_customer
        FOREIGN KEY (Customer_Id)
        REFERENCES Customer(Customer_Id),

    CHECK (Total_Amount >= 0),
    CHECK (Order_Status IN
        ('PENDING', 'SHIPPED', 'DELIVERED', 'CANCELLED'))
);

CREATE TABLE Order_Details (
    Order_Detail_Id INT PRIMARY KEY AUTO_INCREMENT,
    Order_Id INT NOT NULL,
    Product_Id INT NOT NULL,
    Quantity INT NOT NULL CHECK (Quantity > 0),
    Price DECIMAL(10,2) NOT NULL CHECK (Price >= 0),

    CONSTRAINT fk_order_details_order
        FOREIGN KEY (Order_Id)
        REFERENCES Orders(Order_Id),

    CONSTRAINT fk_order_details_product
        FOREIGN KEY (Product_Id)
        REFERENCES Product(Product_Id)
);

INSERT INTO Orders
(Customer_Id, Order_Date, Total_Amount, Order_Status)
VALUES
(1, CURRENT_DATE, 0, 'PENDING');

INSERT INTO Order_Details
(Order_Id, Product_Id, Quantity, Price)
VALUES
(1, 1, 1, 50000.00),
(1, 2, 2, 500.00);

UPDATE Orders
SET Total_Amount = (
    SELECT SUM(Quantity * Price)
    FROM Order_Details
    WHERE Order_Id = 1
)
WHERE Order_Id = 1;

UPDATE Orders
SET Order_Status = 'DELIVERED'
WHERE Order_Id = 1;

UPDATE Order_Details
SET Quantity = 3
WHERE Order_Detail_Id = 2;

UPDATE Orders
SET Total_Amount = (
    SELECT SUM(Quantity * Price)
    FROM Order_Details
    WHERE Order_Id = 1
)
WHERE Order_Id = 1;

DELETE FROM Order_Details
WHERE Order_Id = 1;

DELETE FROM Orders
WHERE Order_Id = 1
AND Order_Status = 'CANCELLED';

SELECT
    C.Customer_Name,
    O.Order_Id,
    O.Order_Date,
    O.Total_Amount,
    O.Order_Status
FROM Customer C
JOIN Orders O
ON C.Customer_Id = O.Customer_Id
ORDER BY O.Order_Date DESC;

SELECT
    P.Product_Id,
    P.Product_Name,
    COUNT(DISTINCT OD.Order_Id) AS Number_Of_Orders,
    SUM(OD.Quantity) AS Total_Quantity_Sold
FROM Product P
LEFT JOIN Order_Details OD
ON P.Product_Id = OD.Product_Id
GROUP BY
    P.Product_Id,
    P.Product_Name
ORDER BY Total_Quantity_Sold DESC;

SELECT
    C.Customer_Id,
    C.Customer_Name,
    COUNT(O.Order_Id) AS Number_Of_Orders
FROM Customer C
LEFT JOIN Orders O
ON C.Customer_Id = O.Customer_Id
GROUP BY
    C.Customer_Id,
    C.Customer_Name
ORDER BY Number_Of_Orders DESC;

SELECT
    C.Customer_Id,
    C.Customer_Name,
    SUM(O.Total_Amount) AS Total_Spending
FROM Customer C
LEFT JOIN Orders O
ON C.Customer_Id = O.Customer_Id
GROUP BY
    C.Customer_Id,
    C.Customer_Name
ORDER BY Total_Spending DESC;

SELECT
    AVG(Total_Amount) AS Average_Order_Value
FROM Orders;

SELECT
    SUM(Total_Amount) AS Total_Sales
FROM Orders;

SELECT
    C.Customer_Name,
    O.Order_Id,
    O.Order_Date,
    P.Product_Name,
    OD.Quantity,
    OD.Price,
    (OD.Quantity * OD.Price) AS Subtotal,
    O.Total_Amount,
    O.Order_Status
FROM Customer C
JOIN Orders O
ON C.Customer_Id = O.Customer_Id
JOIN Order_Details OD
ON O.Order_Id = OD.Order_Id
JOIN Product P
ON OD.Product_Id = P.Product_Id
ORDER BY O.Order_Date DESC;

DELETE FROM Order_Details
WHERE Order_Id = 1;

DELETE FROM Orders
WHERE Order_Id = 1
AND Order_Status = 'CANCELLED';


SELECT * FROM Orders;

SELECT * FROM Order_Details;