/*
Los triggers tambien se pueden usar para prevenir acciones incorrectas.
*/
SELECT * FROM CURSO;
GO

alter trigger TR_ELIMINAR_CURSO
on CURSO
for delete
as
BEGIN
	declare @filas int;
	select @filas = count (*) from deleted D 
		JOIN matricula M on d.cur_id = M.cur_id;
	if(@filas > 0)
	begin
		rollback transaction;
		print 'Hola soy Gustavo'
		print 'No puedes eliminar un curso con matriculas.';
	end;
END;
go

SELECT * FROM CURSO;
GO

delete from curso where cur_id=1;
go

delete from curso where cur_id=4;
go