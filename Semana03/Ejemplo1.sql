
select * from northwind..Employees;
GO

select 
	o.EmployeeID, month(o.OrderDate) mes,
	count(distinct o.OrderID) CantVentas,
	sum(od.UnitPrice*od.Quantity) ImporteVentas
from northwind..[Order Details] od
join Northwind..Orders o
on od.OrderID = o.OrderID
where year(o.OrderDate) = 1997
group by o.EmployeeID, month(o.OrderDate)
order by 1,2;

select count(1) CantVentas
from Northwind..Orders
where year(OrderDate) = 1997;
go

select 
	sum(od.UnitPrice*od.Quantity) ImporteVentas
from northwind..[Order Details] od
join Northwind..Orders o
on od.OrderID = o.OrderID
where year(o.OrderDate) = 1997;


select count(1) CantVentas
from Northwind..Orders
where year(OrderDate) = 1997;
go

select 
	count(distinct o.OrderID) CantVentas
from northwind..[Order Details] od
join Northwind..Orders o
on od.OrderID = o.OrderID
where year(o.OrderDate) = 1997;