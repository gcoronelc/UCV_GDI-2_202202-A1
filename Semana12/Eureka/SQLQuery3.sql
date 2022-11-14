

declare @fecha date, @fecha2 date;
set @fecha = getdate();
select @fecha2 = getdate();
select @fecha, @fecha2;
go


declare @nota int;
set @nota = coalesce(null,20,null,40,50,null);
print @nota;
go

declare @rpta decimal(12,2), @num1 int, @num2 int;
set @num1 = 20;
set @num2 = 6;
set @rpta = @num1 / @num2;
print @rpta;
go



