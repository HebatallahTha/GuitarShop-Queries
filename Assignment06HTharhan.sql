--Query 1--
Use Cis111_GuitarShop
SELECT COUNT(*) AS NumberOfOrders, SUM(TaxAmount) AS taxAmt
FROM     dbo.Orders
--Query 2--
SELECT TOP (100) PERCENT dbo.Categories.CategoryName, COUNT(*) AS numProducts, Max(dbo.Products.ListPrice) as [Most Expensive]
FROM     dbo.Categories INNER JOIN
                  dbo.Products ON dbo.Categories.CategoryID = dbo.Products.CategoryID
GROUP BY dbo.Categories.CategoryName
ORDER BY numProducts DESC

--Query 3--
SELECT dbo.Customers.EmailAddress, SUM(dbo.OrderItems.ItemPrice * dbo.OrderItems.Quantity) AS itemSum, SUM(dbo.OrderItems.DiscountAmount * dbo.OrderItems.Quantity) AS itemDisc, SUM((dbo.OrderItems.ItemPrice - dbo.OrderItems.DiscountAmount) * dbo.OrderItems.Quantity) AS totalPrice
FROM     
	dbo.Customers 
		INNER JOIN
                  dbo.Orders ON dbo.Customers.CustomerID = dbo.Orders.CustomerID 
					INNER JOIN
						dbo.OrderItems ON dbo.Orders.OrderID = dbo.OrderItems.OrderID
GROUP BY dbo.Customers.EmailAddress
ORDER BY totalPrice DESC;

--Query 4--
SELECT dbo.Customers.EmailAddress, COUNT(dbo.OrderItems.OrderID) as [Amount of orders] ,SUM((dbo.OrderItems.ItemPrice - dbo.OrderItems.DiscountAmount) * dbo.OrderItems.Quantity) AS totalPrice
FROM     
	dbo.Customers 
		INNER JOIN
                  dbo.Orders ON dbo.Customers.CustomerID = dbo.Orders.CustomerID 
					INNER JOIN
						dbo.OrderItems ON dbo.Orders.OrderID = dbo.OrderItems.OrderID
GROUP BY dbo.Customers.EmailAddress
HAVING COUNT(dbo.OrderItems.OrderID) > 1
ORDER BY totalPrice DESC;
--Query 5--
SELECT dbo.Customers.EmailAddress, COUNT(dbo.OrderItems.OrderID) as [Amount of orders] ,SUM((dbo.OrderItems.ItemPrice - dbo.OrderItems.DiscountAmount) * dbo.OrderItems.Quantity) AS totalPrice
FROM     
	dbo.Customers 
		INNER JOIN
                  dbo.Orders ON dbo.Customers.CustomerID = dbo.Orders.CustomerID 
					INNER JOIN
						dbo.OrderItems ON dbo.Orders.OrderID = dbo.OrderItems.OrderID
WHERE dbo.OrderItems.ItemPrice > 400

GROUP BY dbo.Customers.EmailAddress
HAVING COUNT(dbo.OrderItems.OrderID) > 1
ORDER BY totalPrice DESC;

--Query 6--
Select dbo.Products.ProductName as ProductName, SUM((dbo.OrderItems.ItemPrice - dbo.OrderItems.DiscountAmount) * dbo.OrderItems.Quantity) as productTotal

From 
	dbo.Products 
	inner join
		dbo.OrderItems ON dbo.Products.ProductID=dbo.OrderItems.ProductID
Group by dbo.Products.ProductName with ROLLUP;

--Query 7-- 
Select dbo.Customers.EmailAddress, COUNT(DISTINCT dbo.Products.ProductID) as CustomerOrders
from dbo.Customers	
	inner join 
		Orders on dbo.Customers.CustomerID = dbo.Orders.CustomerID
		inner Join
			OrderItems on dbo.Orders.OrderID = dbo.OrderItems.OrderID
				inner Join
					Products on dbo.OrderItems.ProductID = dbo.Products.ProductID
Group by dbo.Customers.EmailAddress
Having  COUNT(DISTINCT dbo.Products.ProductID) >1;



