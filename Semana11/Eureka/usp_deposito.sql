
select * from cuenta where chr_cuencodigo = '00100001';
select * from movimiento where chr_cuencodigo = '00100001';
go

drop procedure usp_deposito;
go

create procedure dbo.usp_deposito
(
	@cuenta varchar(20),
	@importe numeric(10,2),
	@codemp  varchar(10),
	@codigo  int out,
	@mensaje varchar(1000) out	
)
as
begin
	declare @saldo numeric(10,2), @contador int;
	BEGIN TRY
		-- Inicio de transacción
		BEGIN TRANSACTION;

		-- Datos de la cuenta
		select @saldo = dec_cuensaldo, @contador = int_cuencontmov 
		from Cuenta 
		where chr_cuencodigo = @cuenta and vch_cuenestado = 'ACTIVO';
		if( @@ROWCOUNT = 0 )
		begin
			throw 51000, 'Cuenta no existe.', 1;
		end;
 
		-- Actualizar la cuenta
		set @saldo = @saldo + @importe;
		set @contador = @contador + 1;
		update cuenta 
		set dec_cuensaldo = @saldo, int_cuencontmov = @contador;

		-- Registrar el movimiento
		insert into Movimiento(chr_cuencodigo, int_movinumero, dtt_movifecha, chr_emplcodigo, chr_tipocodigo, dec_moviimporte)
		values(@cuenta, @contador, GETDATE(), @codemp, '003', @importe);

		-- Fin de transacción
		set @codigo = 1;
		set @mensaje = 'Proceso ejecutado correctamente.';
		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION;
		set @codigo = -1;
		set @mensaje = 'Proceso fue abortado.';
	END CATCH;
end;
go



begin
	declare @codigo int, @mensaje varchar(2000);
	EXEC usp_deposito '00100001', 400.0, '0004', @codigo out, @mensaje out;
	print cast(@codigo as varchar(10)) + ' - ' + @mensaje;
end;
go

select GETDATE();
go

select * from TipoMovimiento;
go


