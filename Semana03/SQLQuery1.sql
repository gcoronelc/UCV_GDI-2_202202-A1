
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

/*
FUNCION QUE RETORNE EL FACTORIAL DE UN NUMERO.
*/

CREATE FUNCTION DBO.fnFACTORIAL(@num INT)
RETURNS INT
AS
BEGIN
	DECLARE @FACT INT, @I INT;
	SET @FACT = 1;
	SET @I = 1;
	WHILE(@I<=@NUM)
	BEGIN
		SET @FACT = @FACT * @I;
		SET @I = @I + 1;
	END;
	RETURN @FACT;
END;
GO

SELECT DBO.fnFACTORIAL(5) FACTORIAL;
GO

/*
RETO: Hacer la versión recursiva de factorial.
*/

CREATE FUNCTION dbo.fnFACTORIALR(@num INT)RETURNS INTASBEGIN	declare @fact int;	if(@num=1 OR @num=0)		set @fact = 1;	else		set @fact =  dbo.fnFACTORIALR(@num -1)*@num;	return @fact;END;GO

select dbo.fnFACTORIALR(6) fact;
go

CREATE FUNCTION dbo.FACTORIALR(@numero INT)RETURNS INTBEGIN  Declare @Fact INT  IF @numero = 0 OR @numero = 1    SELECT @Fact = 1  ELSE    SELECT @Fact = dbo.FACTORIALR(@numero - 1) * @numero  RETURN @FactEND;
GO

select dbo.FACTORIALR(5) factorial;
go

/*
Ejercicio:
Desarrollar una función para calcular el promedio 
de 4 notas, solo se promedian las 3 mejores.
*/


