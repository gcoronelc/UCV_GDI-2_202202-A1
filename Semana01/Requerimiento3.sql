/*
Se necesita saber el importe de las ventas de cada producto y que porcentaje representa del total de las ventas.
Base de datos: Northwind
*/

/*
1. Analizar cada requerimiento.

Se debe encontrar el importe de cada venta, para eso se multiplica
el precio de venta por la cantidad, no se considera el descuento.
Luego se debe sumarizar este importe agrupado por producto.
El porcentaje del total se obtiene dividiendo este importe entre
el importe total de las ventas, multiplicado por 100.
*/

/*
2. Identificar los datos que debe tener el reporte.

Columnas del reporte:
  - NOMBRE DEL PRODUCTO 
  - IMPORTE DE VENTAS 
  - PORCENTAJE DEL TOTAL
*/

/*
3. Identificar las tablas de donde obtendrá los datos.

   - Products.ProductName
   - [Order Detils].UnitPrice
   - [Order Detils].Quantity
*/


/*
4. Elaborar la consulta.
*/

with 
t1 as (
	select ProductID, sum(UnitPrice*Quantity) Importe
	from Northwind..[Order Details] d
	group by ProductID ),
t2 as (	select sum(importe) ImporteTotal from t1 )
select p.ProductName, t1.Importe,
	t1.Importe*100.0/t2.ImporteTotal Porcentaje
from Northwind..Products p
join t1 on p.ProductID = t1.ProductID
cross join t2
order by 1;
go



/*
5. Verificar su resultado

Para la verificación te puedes ayudar de sentencias SQL o de un EXCEL.
*/