/*
Requerimiento 2
Cada empleado recibe 3% de comisión de cada venta. 
Se necesita una consulta que permita obtener la comisión que se le debe pagar a cada empleado por todas sus ventas.
Base de datos: Northwind
*/

with
t1 as (
	select o.EmployeeID, count(distinct o.OrderID) ventas,  sum(d.UnitPrice*d.Quantity) ImporteVentas 
	from Northwind..Orders o
	join Northwind..[Order Details] d on o.OrderID=d.OrderID
	group by o.EmployeeID
)
select 
	concat(e.FirstName,', ',e.LastName) nombre,
	t1.ventas, t1.ImporteVentas, 
	cast(t1.ImporteVentas*0.03 as numeric(10,2)) Comision
from Northwind..Employees e
join t1 on e.EmployeeID=t1.EmployeeID



