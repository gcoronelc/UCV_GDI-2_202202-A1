-- CT: common table expression

-- Ejercicio
-- ---------------------------------------------

/*
REQUERIMIENTO 1
Cuál es el producto mas caro de cada categoría.
BD: NorthWind
*/


/*
1.- Análisis
Quiere decir que por cada categoría debe revisar 
el precio de cada producto, identificar el mas caro
y obtener el nombre de ese producto.
*/


/*
2.- Identificar los datos que debe tener el reporte.

Columnas del reporte:
------------------------------
- Código de la categoría
- Nombre de la Categoría
- Código del producto
- Nombre del producto
- Precio del producto
*/


/*
3.- Identificar las tablas de donde obtendrá los datos.

Tablas de datos
-------------------------------------
- Categories: Código de la categoría, Nombre de la Categoría
- PRoducts: Código del producto, Nombre del producto, Precio del producto
*/


/*
4.- Elaborar la consulta.

Pasos
------------------------------------------------------------------
1.- Identificar el precio mas caro por categoria.
2.- Identificar el producto.
3.- Completar los datos
*/

-- Paso 1: Identificar el precio mas caro por categoria

select CategoryID, max(UnitPrice) PrecioCaro
from Northwind..Products
group by CategoryID;


-- PAso 2: Identificar el producto

with 
v1 as (
	select CategoryID, max(UnitPrice) PrecioCaro
	from Northwind..Products
	group by CategoryID)
select * 
from Northwind..Products P
join v1 on p.CategoryID=v1.CategoryID and p.UnitPrice=v1.PrecioCaro;


-- Paso 3: Completar los datos

with 
v1 as (
	select CategoryID, max(UnitPrice) PrecioCaro
	from Northwind..Products
	group by CategoryID)
select C.CategoryID, C.CategoryName, P.ProductID, P.ProductName, P.UnitPrice
from Northwind..Products P
join v1 on p.CategoryID=v1.CategoryID and p.UnitPrice=v1.PrecioCaro
join Northwind..Categories C on P.CategoryID = C.CategoryID
order by 1;
go



-- Otra opción

with 
v1 as (
	select CategoryID, max(UnitPrice) PrecioCaro
	from Northwind..Products
	group by CategoryID),
v2 as (
	select P.*
	from Northwind..Products P
	join v1 on P.CategoryID=v1.CategoryID and P.UnitPrice=v1.PrecioCaro)
select C.CategoryID, C.CategoryName, v2.ProductID, v2.ProductName, v2.UnitPrice
from Northwind..Categories C
join v2 on C.CategoryID = v2.CategoryID
order by 1;
go


select * from Northwind..Products
where CategoryID = 1
order by UnitPrice desc;
go




















