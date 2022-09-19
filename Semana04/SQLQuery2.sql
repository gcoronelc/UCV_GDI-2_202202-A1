
SELECT * FROM CURSO;
GO

create trigger TR_ELIMINAR_CURSO
on CURSO
for delete
as
BEGIN
	if(select count (*) 
		from deleted D 
		JOIN matricula M on d.cur_id = M.cur_id) > 0
	begin
		rollback transaction;
		print 'No puedes eliminar un curso con matriculas.';
	end;
END;
go

delete from curso where cur_id=1;
go