
--Select count(*) from Customers
--where Region is not NULL;

--Select count(distinct Country) from Customers;

--SELECT Count(*) AS DistinctCountries
--FROM (SELECT DISTINCT Country FROM Customers)


--select * from Customers
--where Country='Mexico'

--select * from Customers
--where CustomerID='ANATR'

--select * from Customers
--select * from Customers
--select *from Customers where CustomerID IN (select CustomerID from Customers where Country='Mexico')



--select * from Customers where ContactTitle IN (Select Distinct ContactTitle from Customers where ContactTitle like 'Sales%')

--INSERT INTO Customers (CustomerID,CompanyName, ContactName, Address, City, PostalCode, Country)
--VALUES ('TMBE','Cardinal','Tom B. Erichsen','Skagen 21','Stavanger','4006','Norway');

--INSERT INTO Customers(CustomerID,CompanyName,ContactName,City,Country)
--Values ('FFAF','TATA','Fraklin Fernandes A','Pune','India')

--select * from Customers


--delete from Customers where CustomerID in ('TMBE','FFAF')

--To find 2nd highest employeeID or salary etc 
--select max(EmployeeID) from Employees where EmployeeID < (select max(distinct EmployeeID) from Employees)
--select Top 1 EmployeeID from Employees where EmployeeID not in(select max(EmployeeID)from Employees) order by EmployeeID DESC


 --USE of Common Table Expressions or CTE (more common use of above expression)
WITH T AS
(
SELECT *,
   DENSE_RANK() OVER (ORDER BY EmployeeID Desc) AS Rnk
FROM Employees
)
SELECT EmployeeID
FROM T
WHERE Rnk=2;

Select *,DENSE_RANK() OVER (ORDER BY EmployeeID Desc) AS Rnk from Employees