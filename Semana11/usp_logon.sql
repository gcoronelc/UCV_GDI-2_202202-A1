
/*
 * Estado: +1: Datos correctos, -1: Datos incorrectos
*/
create procedure dbo.usp_logon
(@p_usuario varchar(15), @p_clave varchar(15), @p_estado int out)
as
begin
	declare @cont int;
	select @cont=count(1) from Empleado
	where vch_emplusuario=@p_usuario and vch_emplclave=@p_clave;
	set @p_estado = IIF(@cont=1,1,-1);
end;
go

select * from empleado;
go

declare @estado int;
exec dbo.usp_logon 'cromero', 'chicho', @estado out;
print concat('estado: ', @estado);
go



