
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


/*
Función de tabla en linea
*/

CREATE FUNCTION dbo.fn_empleados ( @p_dpto int ) 
RETURNS TABLE 
AS RETURN 
SELECT idempleado, apellido, nombre 
FROM dbo.empleado 
WHERE iddepartamento = @p_dpto; 
GO

select * from dbo.fn_empleados(102);
go


/*
FUNCION DE TABLA DE MULTIPLES INSTRUCCIONES
*/


CREATE FUNCTION dbo.fn_catalogo ( ) 
RETURNS @tabla TABLE ( 
	codigo int identity(1,1) primary key not null, 
	nombre varchar(50) not null, 
	precio money not null 
) AS 
BEGIN 
	INSERT INTO @tabla(nombre,precio) values('Televisor', 1500.00); 
	INSERT INTO @tabla(nombre,precio) values('Refrigeradora', 1450.00); 
	INSERT INTO @tabla(nombre,precio) values('Lavadora', 1350.00); 
	RETURN; 
END; 
GO

SELECT * FROM dbo.fn_catalogo();
GO

/*
Ejercicio
Se necesita un resumen de ventas por curso.
BD: EDUCA
*/

ALTER FUNCTION dbo.fnResumen ( ) 
RETURNS @tabla TABLE ( 
	id int primary key not null, 
	nombre varchar(100) not null, 
	vacantes int not null,
	matriculados int not null,
	disponibles int not null default 0,
	proyectado decimal(12,2) not null default 0,
	recaudado decimal(12,2) not null default 0
) AS 
BEGIN 
	-- Datos base
	INSERT INTO @tabla(id, nombre, vacantes, matriculados)
	select cur_id, cur_nombre, cur_vacantes, cur_matriculados
	from dbo.CURSO
	-- Vacantes disponible
	update @tabla set disponibles = vacantes - matriculados;
	-- Ingresos proyectados
	update @tabla
	set proyectado = isnull((select sum(mat_precio) from dbo.MATRICULA m
					  where m.cur_id = t.id),0)
	from @tabla t
	-- Ingresos recaudados
	update @tabla
	set recaudado = isnull((select sum(pag_importe) from dbo.PAGO p
					  where p.cur_id = t.id),0)
	from @tabla t
	RETURN; 
END; 
GO

select * from dbo.fnResumen();
go

select * from dbo.PAGO;
go

SELECT * FROM DBO.MATRICULA;
GO

select * from educa..CURSO;
go



