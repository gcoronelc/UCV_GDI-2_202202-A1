
select * from Northwind..Customers;
go

select distinct ShipCity
from Northwind..Orders;
go


CREATE FUNCTION dbo.fn_suma 
( @num1 int, @num2 int ) 
RETURNS int 
AS 
BEGIN 
	DECLARE @suma int; 
	SET @suma = @num1 + @num2; 
	RETURN @suma; 
END; 
GO

SELECT dbo.fn_suma(4,5) SUMA;
GO




