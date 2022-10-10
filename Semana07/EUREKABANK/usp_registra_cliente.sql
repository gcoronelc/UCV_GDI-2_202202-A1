
sp_help cliente;
go

select * from cliente;
select * from contador;
go


create procedure usp_registra_cliente
(
	@p_paterno   varchar   (25), 
	@p_materno   varchar   (25), 
	@p_nombre    varchar   (30), 
	@p_dni       char      (8 ), 
	@p_ciudad    varchar   (30), 
	@p_direccion varchar   (50), 
	@p_telefono  varchar   (20), 
	@p_email     varchar   (50), 
	@p_codigo    char      (5) OUT, 
	@p_estado    int       OUT
)
AS
BEGIN
	-- Variables
	DECLARE @contador int, @tamanio int;
	-- Validaciones
	if(@p_paterno is null OR @p_materno is null OR @p_nombre is null)
	begin
		set @p_estado = -3;
		return;
	end;

	-- Proceso
	SET @p_estado = 1;
	BEGIN TRY 
		-- Inicia la Tx
		BEGIN TRANSACTION; 
		-- Generar el nuevo codigo
		UPDATE CONTADOR 
		SET int_contitem = int_contitem + 1
		WHERE vch_conttabla='Cliente';
		if(@@ROWCOUNT<>1)
		begin
			set @p_estado = -2;
			THROW 51000, 'Error en la generacion del codigo.', 1;
		end;
		select @contador = int_contitem, @tamanio = int_contlongitud
		from contador 
		WHERE vch_conttabla='Cliente';
		set @p_codigo = RIGHT(concat('00000',cast(@contador as varchar(5))),@tamanio);
		-- Inserta el nuevo cliente
		INSERT INTO CLIENTE(chr_cliecodigo,vch_cliepaterno,vch_cliematerno,vch_clienombre,
		chr_cliedni,vch_clieciudad,vch_cliedireccion,vch_clietelefono,vch_clieemail)
		VALUES(@p_codigo,@p_paterno,@p_materno,@p_nombre,   
		@p_dni,@p_ciudad,@p_direccion,@p_telefono,@p_email); 
		-- Confirma la Tx
		COMMIT TRANSACTION; 
	END TRY 
	BEGIN CATCH 
		-- Cancela la Tx
		ROLLBACK TRANSACTION;
		if(@p_estado=1) set @p_estado = -1;
	END CATCH;
END;
GO

-- Prueba
declare @codigo char(5), @estado int;
exec usp_registra_cliente 'Espino', 'Baltazar', 'Josue', '12345678', 'Lima', 
'Lima', '555555555', 'josue@gmail.com', @codigo out, @estado out;
print concat('Estado: ', @estado);
print concat('Codigo: ', @codigo);
go



-- Prueba
declare @codigo char(5), @estado int;
exec usp_registra_cliente 'Espino', 'Baltazar', NULL, '12345678', 'Lima', 
'Lima', '555555555', 'josue@gmail.com', @codigo out, @estado out;
print concat('Estado: ', @estado);
print concat('Codigo: ', @codigo);
go