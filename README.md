# Week 4: E-Commerce Order Management System

## Project Overview
This project focuses on managing customer orders in an E-Commerce database using SQL. It connects Customer and Product modules to handle orders, purchased products, quantities, prices, and total order amounts.

## Objectives
- Create Orders and Order_Details tables.
- Establish relationships using Primary Keys and Foreign Keys.
- Manage customer orders containing multiple products.
- Calculate total order amounts.
- Update order status and product quantities.
- Delete cancelled orders.
- Generate customer order history and purchase reports.

## Database Tables

### 1. Orders
Stores overall customer order information.

- Order_ID – Primary Key
- Customer_ID – Foreign Key
- Order_Date
- Total_Amount
- Order_Status

### 2. Order_Details
Stores individual products included in each order.

- Order_Detail_ID – Primary Key
- Order_ID – Foreign Key
- Product_ID – Foreign Key
- Quantity
- Price

## Relationships
- Customer (1) → (Many) Orders
- Orders (1) → (Many) Order_Details
- Product (1) → (Many) Order_Details

The Order_Details table connects Orders and Product to implement a Many-to-Many relationship.

## SQL Operations
- CREATE TABLE – Create order-related tables.
- INSERT – Add customer orders and purchased products.
- UPDATE – Modify order status and product quantity.
- DELETE – Remove cancelled orders.
- SELECT – Display complete order information.
- JOIN – Combine Customer, Orders, Product, and Order_Details.
- GROUP BY – Generate product-wise and customer-wise reports.
- SUM() and AVG() – Calculate total sales and average order value.

## Reports Generated
1. Customer Order History
2. Product-wise Order Report
3. Customers with Maximum Orders
4. Total Spending by Each Customer
5. Average Order Value
6. Total Sales Report

## Technologies Used
- MySQL
- SQL
- Relational Database Management System (RDBMS)

## Learning Outcomes
- Understanding one-to-many and many-to-many relationships.
- Implementing Primary Key and Foreign Key constraints.
- Managing customer orders using SQL.
- Performing CRUD operations.
- Generating reports using aggregate functions and JOIN queries.

## Conclusion
The Order Management System demonstrates how SQL can be used to manage customer orders, purchased products, order details, and sales reports efficiently in an E-Commerce database.
```
