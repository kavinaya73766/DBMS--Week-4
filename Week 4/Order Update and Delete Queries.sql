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