create proc usp_saludo
as
print 'Hola todos';
go

exec usp_saludo
go

execute usp_saludo
go


alter proc usp_doble
(@numero int, @doble int out)
as
set @doble = @numero * 2;
go

alter proc usp_doble
(@numero int, @doble int out)
as
select @doble = @numero * 2;
go

declare @v_doble int;
exec usp_doble 7, @v_doble out;
print concat('Doble: ', cast(@v_doble as varchar(50)));
go


