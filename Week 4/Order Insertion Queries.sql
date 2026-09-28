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