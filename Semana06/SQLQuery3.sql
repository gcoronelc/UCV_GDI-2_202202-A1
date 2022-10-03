
CREATE TABLE PRODUCTOS (
	"ProductID" "int" NOT NULL ,
	"ProductName" nvarchar (40) NOT NULL ,
	"SupplierID" "int" NULL ,
	"CategoryID" "int" NULL ,
	"QuantityPerUnit" nvarchar (20) NULL ,
	"UnitPrice" "money" NULL ,
	"UnitsInStock" "smallint" NULL ,
	"UnitsOnOrder" "smallint" NULL,
	"ReorderLevel" "smallint" NULL,
	"Discontinued" "bit" NOT NULL 

)
GO

SELECT * 
INTO PRODUCTOS
FROM Products;

SELECT * FROM PRODUCTOS;

INSERT INTO PRODUCTOS
SELECT * FROM Products;


set statistics io on;
set statistics time on;

-- CREATE INDEX ProductosNombre ON PRODUCTOS(ProductName);
-- DROP INDEX PRODUCTS.ProductosNombre


select * from PRODUCTOS P
where p.ProductName='Queso Cabrales';
-- 1ms
-- 42 Lecturas

select * 
from PRODUCTOS P
where p.ProductName LIKE 'Ca%';
-- 1ms
-- 42 LL

select * 
from PRODUCTOS P
where p.ProductName LIKE '%Ca%';
-- 1ms
-- 42 Lect