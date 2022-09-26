-- Problema 1

SELECT * FROM RH..empleado;
GO

SELECT 
	D.nombre "NOMBRE DEPARTAMENTO",
	COUNT(1) "CANTIDAD EMPLEADOS",
	SUM(E.sueldo) "IMPORTE PLANILLA",
	SUM(ISNULL(E.comision,0)) "COMISION",
	SUM(SUELDO + ISNULL(E.comision,0)) "TOTAL"
FROM RH..empleado E
JOIN RH..departamento D ON E.iddepartamento = D.iddepartamento
GROUP BY D.nombre;
GO

-- Problema 6

SELECT *
FROM Northwind..[Order Details] OD
JOIN Northwind..Orders O ON OD.OrderID = O.OrderID
GO

WITH
V1 AS (
	SELECT 
		O.ShipCountry "PAIS",
		COUNT(DISTINCT O.OrderID) "CANTIDAD PEDIDOS",
		SUM(OD.Quantity) "CANTIDAD PRODUCTOS",
		SUM(OD.Quantity*OD.UnitPrice) "IMPORTE"
	FROM Northwind..[Order Details] OD
	JOIN Northwind..Orders O ON OD.OrderID = O.OrderID
	GROUP BY O.ShipCountry),
V2 AS (SELECT SUM(IMPORTE) "TOTAL" FROM V1)
SELECT 
	V1.*,
	V1.IMPORTE*100.0/V2.TOTAL "PORCENTAJE"
FROM V1 CROSS JOIN V2;
GO

SELECT COUNT(1) FROM Northwind..Orders;
GO


-- Problema 7

SELECT 
	O.CustomerID, OD.ProductID,
	COUNT(DISTINCT O.OrderID) "PEDIDOS",
	SUM(OD.Quantity) "PRODUCTOS"
FROM Northwind..[Order Details] OD
JOIN Northwind..Orders O ON OD.OrderID = O.OrderID
WHERE O.CustomerID='BERGS'
GROUP BY O.CustomerID, OD.ProductID
ORDER BY 4 DESC
GO

WITH
V1 AS (
	SELECT 
		O.CustomerID, OD.ProductID,
		COUNT(DISTINCT O.OrderID) "PEDIDOS",
		SUM(OD.Quantity) "PRODUCTOS"
	FROM Northwind..[Order Details] OD
	JOIN Northwind..Orders O ON OD.OrderID = O.OrderID
	GROUP BY O.CustomerID, OD.ProductID),
V2 AS (
	SELECT CustomerID, MAX(PRODUCTOS) "PRODUCTOS MAX"
	FROM V1
	GROUP BY CustomerID)
SELECT 
	C.CompanyName, P.ProductName,
	V1.PEDIDOS, V1.PRODUCTOS
FROM V1 JOIN V2 
ON V1.CustomerID=V2.CustomerID AND V1.PRODUCTOS=V2.[PRODUCTOS MAX]
JOIN Northwind..Customers C ON V1.CustomerID=C.CustomerID 
JOIN Northwind..Products P ON V1.ProductID=P.ProductID
ORDER BY 1, 2
GO


-- Problema 10

withv1 as (select p.ProductName 'NOMBRE DEL PRODUCTO', sum(od.UnitPrice*od.Quantity) 'IMPORTE DE VENTAS'from Northwind..Products p	join Northwind..[Order Details] od on od.ProductID = p.ProductIDgroup by ProductName),v2 as (select sum(v1.[IMPORTE DE VENTAS]) TOTAL from v1)select v1.*, v1.[IMPORTE DE VENTAS]*100.0/v2.TOTAL 'PORCENTAJE DEL TOTAL'from v1 cross join v2order by 1go


