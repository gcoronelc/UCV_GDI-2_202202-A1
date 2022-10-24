
DELETE FROM VENTAS_FACT;
DELETE FROM TIEMPO;
DELETE FROM EMPLEADO;
DELETE FROM CLIENTE;
DELETE FROM PROVEEDOR;
DELETE FROM PRODUCTO;
GO

select CustomerID, CompanyName, Country from Northwind..Customers;
select * from Northwind_DM..CLIENTE;
go


select 
	EmployeeID, 
	concat(FirstName,', ',LastName) name,
	DATEDIFF(year,BirthDate,getdate()) edad
from Northwind..Employees;
select * from Northwind_DM..EMPLEADO;
go


select * from Northwind_DM..VENTAS_FACT;
go

select * from Northwind..[Order Details];
go



