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