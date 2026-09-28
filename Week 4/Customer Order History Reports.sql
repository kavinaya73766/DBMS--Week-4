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