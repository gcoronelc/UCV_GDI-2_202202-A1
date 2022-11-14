
use EUREKABANK
go


/*
** Estado: 
**   +1: Datos correctos 
**   -1: Datos incorrectos
**   -2: Error en el proceso
*/
create procedure dbo.usp_logon
( 	@p_usuario varchar(15), @p_clave varchar(15) )
as
begin
	SET NOCOUNT ON;
	-- Variables
	declare @contador int, @estado int, @mensaje varchar(1000);
	-- Proceso
	set @estado = 1;
	set @mensaje = 'Datos correctos.';
	BEGIN TRY
		select @contador=count(1) from Empleado
		where vch_emplusuario=@p_usuario and vch_emplclave=@p_clave;
		if(@contador<>1)
		begin
			set @estado = -1;
			set @mensaje = 'Datos incorrectos.';
		end
	END TRY
	BEGIN CATCH
		set @estado = -2;
		set @mensaje = ERROR_MESSAGE();
	END CATCH;
	if(@estado=1)
	begin
		select @estado estado, @mensaje mensaje,
			chr_emplcodigo,vch_emplpaterno,vch_emplmaterno,vch_emplnombre
		from dbo.empleado 
		where vch_emplusuario=@p_usuario and vch_emplclave=@p_clave;
	end
	else 
	begin
		select @estado estado, @mensaje mensaje;
	end;
end;
go

select * from empleado;
go

-- Prueba 1: Datos incorrectos
exec dbo.usp_logon 'alfa', 'beta'
go

-- Prueba 2: Datos incorrectos
exec dbo.usp_logon 'aramos', 'china'
go

