Introduction

This exercise requires you to know the following aspects of SQL:

CREATE TABLE	Concatenation
SQL Data Types	Formatting dates and numbers
INSERT INTO	Column aliases
SELECT 	Simple JOIN statements
WHERE clause	Complex JOIN statements
LIKE and wildcards	Subquery


Exercise 1 – Northwind Queries (40 marks: 5 for each question)

1.1	Write a query that lists all Customers in either Paris or London. Include Customer ID, Company Name and all address fields.

-	Doesn’t actually mention to select city

```SQL
SELECT c.CustomerID, c.CompanyName, c.Address, c.City
FROM Customers c
WHERE c.City='London' OR c.City='Paris'
```
1.2	List all products stored in bottles.
-	Doesn’t mention to select ID or name

```SQL
SELECT p.ProductID, p.ProductName, p.QuantityPerUnit
FROM Products p
WHERE p.QuantityPerUnit LIKE '%bottle%'
```
1.3	Repeat question above, but add in the Supplier Name and Country.
-	Supplier name = Company name or contact name

```SQL
SELECT p.ProductID, p.QuantityPerUnit, p.SupplierID, s.CompanyName AS 'Supplier Name', s.Country
FROM Products p
INNER JOIN Suppliers s ON p.SupplierID=s.SupplierID
WHERE p.QuantityPerUnit LIKE '%bottle%'
```

1.4	Write an SQL Statement that shows how many products there are in each category. Include Category Name in result set and list the highest number first.

```SQL

SELECT COUNT(p.ProductID) AS "Products in Categories", c.CategoryName
FROM Products p
INNER JOIN Categories c ON p.CategoryID=c.CategoryID
GROUP BY c.CategoryName
```

1.5	List all UK employees using concatenation to join their title of courtesy, first name and last name together. Also include their city of residence.

```SQL
SELECT e.TitleOfCourtesy+e.FirstName+' '+e.LastName AS "Name",
e.City
FROM Employees e
WHERE e.Country='UK'

```

1.6	List Sales Totals for all Sales Regions (via the Territories table using 4 joins) with a Sales Total greater than 1,000,000. Use rounding or FORMAT to present the numbers.

Orders employee territories territories region
Sum regions – will sum up the rest

1.7	Count how many Orders have a Freight amount greater than 100.00 and either USA or UK as Ship Country.
```SQL
SELECT COUNT (o.Freight) AS "TOTAL ORDERS WITH FREIGHT ABOVE 100.00 IN UK OR USA"
FROM Orders o
WHERE o.ShipCountry='USA' OR o.ShipCountry='UK'
AND o.Freight >100.00

RESULT= 131
```
1.8	Write an SQL Statement to identify the Order Number of the Order with the highest amount of discount applied to that order.
```SQL

- SELECT TOP 1 o.OrderID, SUM(o.UnitPrice * o.Quantity * (1- o.Discount)) AS "Highest Discount Applied"
```

Exercise 2 – Create Spartans Table (20 marks – 10 each)

2.1 Write the correct SQL statement to create the following table:
Spartans Table – include details about all the Spartans on this course. Separate Title, First Name and Last Name into separate columns, and include University attended, course taken and mark achieved. Add any other columns you feel would be appropriate.
IMPORTANT NOTE: For data protection reasons do NOT include date of birth in this exercise.

```SQL
CREATE TABLE Spartans_table
(
    Seperate_title VARCHAR(5),
    First_name VARCHAR(10),
    Last_name VARCHAR(20),
    University_attended VARCHAR(30),
    Course_taken VARCHAR(15),
    Mark_achieved DECIMAL(2,1)
)

```
2.2 Write SQL statements to add the details of the Spartans in your course to the table you have created.

```SQL
INSERT INTO Spartans_table

VALUES
('Mr.','Josh','Smith','University of Bristol','Business', 2.1),
('Mrs.','Julie','Brown','University of Bath','Maths', 1.0),
('Ms.','Peter','Parker','Sheffield University','Engineering',2.2)

SELECT * FROM Spartans_table
```

Exercise 3 – Northwind Data Analysis linked to Excel (30 marks)
Write SQL statements to extract the data required for the following charts (create these in Excel):

3.1 List all Employees from the Employees table and who they report to. No Excel required. (5 Marks)

```SQL
SELECT e.EmployeeID, e.FirstName, e.LastName, e.ReportsTo
FROM Employees e
```

3.2 List all Suppliers with total sales over $10,000 in the Order Details table. Include the Company Name from the Suppliers Table and present as a bar chart as below: (5 Marks)

No matching records between suppliers and orders

 

3.3 List the Top 10 Customers YTD for the latest year in the Orders file. Based on total value of orders shipped. No Excel required. (10 Marks)
3.4 Plot the Average Ship Time by month for all data in the Orders Table using a line chart as below. (10 Marks)


Standards (10 marks)
Remember to apply all the following standards:
•	Use consistent capitalisation and indentation of SQL Statements
•	Use concise and consistent table alias names
•	Use column aliases to ensure tidy column headings (spaces and consistent capitalisation)
•	Concatenate any closely related columns e.g. First Name and Last Name or Address and City etc
•	Put comments throughout
