
sp_help cliente;
go

select * from cliente order by 1 desc;
select * from contador;
go

/*
 * Estado:
 *    1: Proceso ok
 *   -1: Error en el proceso
 *   -2: Error al crear el codigo del cliente.
*/
alter procedure usp_registra_cliente
(
	@p_paterno    varchar (25),
	@p_materno    varchar (25),
	@p_nombre     varchar (30),
	@p_dni        char    (8 ),
	@p_ciudad     varchar (30),
	@p_direccion  varchar (50),
	@p_telefono   varchar (20),
	@p_email      varchar (50),
	@p_codigo     char    (5)   out,
	@p_estado     int           out
)
as
begin
	-- Declaracion de variables
	declare @contador int, @tamanio int;
	-- Validacion
	if(@p_paterno is null or @p_materno is null or @p_nombre is null)
	begin
		set @p_estado = -3;
		return; -- Fin del programa
	end;
	-- Proceso
	set @p_estado = 1;
	BEGIN TRY 
		-- Inicio de la TX
		BEGIN TRANSACTION; 
		-- Incrementar el contador
		update contador set int_contitem = int_contitem + 1
		where vch_conttabla = 'Cliente';
		if(@@ROWCOUNT <> 1)
		begin
			set @p_estado = -2;
			throw 51000, 'No se puede crear el codigo del cliente.', 1; 
		end;
		select @contador=int_contitem, @tamanio=int_contlongitud
		from Contador
		where vch_conttabla = 'Cliente';
		set @p_codigo = RIGHT(concat('00000',@contador),@tamanio);
		-- Insertar el registro
		INSERT INTO CLIENTE(chr_cliecodigo,vch_cliepaterno,vch_cliematerno,vch_clienombre,
		chr_cliedni,vch_clieciudad,vch_cliedireccion,vch_clietelefono,vch_clieemail)
		VALUES(@p_codigo,@p_paterno,@p_materno,@p_nombre,@p_dni,@p_ciudad,
		@p_direccion,@p_telefono,@p_email);
		-- Confirmar la TX
		COMMIT TRANSACTION; 
	END TRY 
	BEGIN CATCH 
		-- Cancelar la TX
		ROLLBACK TRANSACTION; 
		if(@p_estado = 1) set @p_estado = -1;
	END CATCH;
end;
go

-- Prueba 1
declare @codigo char(5), @estado int;
exec usp_registra_cliente 'GARCIA','ROJAS','ADRIANA','76345698','Lima',
'Los Olivos','963476892','carlos@gmail.com', @codigo out, @estado out;
print concat('Estado: ', @estado);
print concat('Codigo: ', @codigo);
go


-- Prueba 2
declare @codigo char(5), @estado int;
exec usp_registra_cliente 'VASQUEZ','VALVERDE',NULL,'12345678','Lima',
'Los Olivos','963476892','carlos@gmail.com', @codigo out, @estado out;
print concat('Estado: ', @estado);
print concat('Codigo: ', @codigo);
go


