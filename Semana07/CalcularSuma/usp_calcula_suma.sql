

create procedure usp_calcula_suma
(@p_num1 int, @p_num2 int, @p_suma int out)
as
begin
	set @p_suma = @p_num1 + @p_num2;
end;
go


declare @suma int;
exec usp_calcula_suma 80, 57, @suma out;
print concat('Suma : ', @suma);
go

