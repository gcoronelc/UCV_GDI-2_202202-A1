-- PROBLEMA
-- ======================================================
/*
INDICADORES
 - Cantidad de lecturas lógicas
 - El tiempo de respuesta
 - Fragmentación de tanla e indices.

Se debe tomar en cuenta que los datos se guardan en paginas.
El tamaño de una pagina es 8Kb
*/

select * from Products;

select * from Customers;


set statistics io on;
set statistics time on

-- CREATE INDEX ProductsNombre ON PRODUCTS(ProductName);
-- CREATE INDEX ProductsNombre ON PRODUCTS(ProductName) WITH FILLFACTOR=50;
-- DROP INDEX Products.ProductsNombre;

select * 
from Products P
join [Order Details] Od on p.ProductID = Od.ProductID
where p.ProductName='Queso Cabrales';
-- 78 Lecturas
-- 3 ms

select * 
from Products P
join [Order Details] Od on p.ProductID = Od.ProductID
where p.ProductName like 'Ca%';
-- 161 LL
-- 2 ms

select * 
from Products P
join [Order Details] Od on p.ProductID = Od.ProductID
where p.ProductName like '%Ca%';
-- 543 LL
-- 3 ms




