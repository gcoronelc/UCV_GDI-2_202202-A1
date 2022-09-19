
use EDUCA;
GO

SELECT * FROM ALUMNO;
GO

CREATE TRIGGER tr_alumno_01
ON alumno
FOR INSERT, UPDATE
AS
BEGIN
	PRINT 'MENSAJE DESDE EL TRIGGER';
	PRINT 'Operación ejecutada correctamente';
END;
GO

select * from alumno order by 1 desc;
go

insert into alumno values(1002, 'Juan Perez', 'Lima', '967345856', 'jperez@gmail.com');
go

update alumno 
set alu_nombre = 'GUSTAVO CORONEL'
where alu_id=1002;
go



