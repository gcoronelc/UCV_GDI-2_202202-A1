
ALTER PROCEDURE USP_UCV_GPO_A_CREAR_CUENTA(
	@CLIENTE CHAR(5),
	@MONEDA CHAR(2),
	@IMPORTE MONEY,
	@CLAVE CHAR(6),
	@EMPLEADO CHAR(4),
	@CODIGO CHAR(8) OUT,
	@ESTADO INT OUT, 
	@MENSAJE VARCHAR(1000) OUT
) AS
BEGIN
	DECLARE @cont int, @sucursal char(3);
	SET @ESTADO = 1;
	SET @MENSAJE = 'Todo ok.';
	BEGIN TRY 
		-- Inicia Tx
		BEGIN TRANSACTION; 
		-- Validar el empleado
		SELECT @cont=count(1) FROM Asignado
		WHERE chr_emplcodigo=@EMPLEADO AND dtt_asigfechabaja IS NULL;
		IF(@cont=0)
		BEGIN
			SET @ESTADO = -1;
			THROW 51000, 'Codigo de empleado incorrecto.', 1; 
		END;
		-- Validar moneda
		SELECT @cont=count(1) FROM Moneda WHERE chr_monecodigo=@MONEDA;
		IF(@cont=0)
		BEGIN
			SET @ESTADO = -1;
			THROW 51000, 'Codigo de moneda incorrecto.', 1; 
		END;
		-- Validar cliente
		SELECT @cont=count(1) FROM Cliente WHERE chr_cliecodigo=@CLIENTE;
		IF(@cont=0)
		BEGIN
			SET @ESTADO = -1;
			THROW 51000, 'Codigo de cliente incorrecto.', 1; 
		END;
		-- Validar importe de apertura de cuenta
		IF(@IMPORTE<0)
		BEGIN
			SET @ESTADO = -1;
			THROW 51000, 'El importe de apertura debe ser un valor positivo.', 1; 
		END;
		-- Generar codigo de la cuenta
		SELECT @sucursal=chr_sucucodigo FROM Asignado
		WHERE chr_emplcodigo=@EMPLEADO AND dtt_asigfechabaja IS NULL;
		UPDATE Sucursal SET int_sucucontcuenta = int_sucucontcuenta + 1 
		WHERE chr_sucucodigo=@sucursal;
		SELECT @cont=int_sucucontcuenta FROM SUCURSAL WHERE chr_sucucodigo=@sucursal;
		SET @CODIGO = @sucursal + RIGHT(CONCAT('00000',@cont),5);
		PRINT 'CODIGO: ' + @CODIGO
		--Proceso
		INSERT INTO CUENTA(chr_cuencodigo,chr_monecodigo,chr_sucucodigo,
			chr_emplcreacuenta,chr_cliecodigo,dec_cuensaldo,dtt_cuenfechacreacion,
			vch_cuenestado,int_cuencontmov,chr_cuenclave)
		VALUES(@CODIGO,@MONEDA,@sucursal,@EMPLEADO,@CLIENTE,@IMPORTE,GETDATE(),'ACTIVO',1,@CLAVE);
		INSERT INTO MOVIMIENTO(chr_cuencodigo,int_movinumero,dtt_movifecha,chr_emplcodigo,
			chr_tipocodigo,dec_moviimporte)
		VALUES(@CODIGO,1,getdate(),@EMPLEADO,'001',@IMPORTE);
		-- Confirma Tx
		COMMIT TRANSACTION; 
	END TRY 
	BEGIN CATCH 
		IF(@ESTADO=1)
		BEGIN
			SET @ESTADO = -1;
			SET @MENSAJE = 'Error en el proceso, intentelo nuevamente.';
		END
		ELSE
		BEGIN
			SET @MENSAJE = ERROR_MESSAGE();
		END;
		print ERROR_MESSAGE();
		ROLLBACK TRANSACTION; 
	END CATCH;
END;
GO

-- importe negativo
DECLARE @CODIGO CHAR(8), @ESTADO INT,@MENSAJE VARCHAR(1000);
EXEC USP_UCV_GPO_A_CREAR_CUENTA '00008','01',-10000.0,'123456','0005',
	@CODIGO OUT, @ESTADO OUT, @MENSAJE OUT;
PRINT 'CODIGO: ' + @CODIGO;
PRINT CONCAT('ESTADO: ',@ESTADO);
PRINT CONCAT('MENSAJE: ', @MENSAJE);
GO


-- Codigo de empleado incorrecto
DECLARE @CODIGO CHAR(8), @ESTADO INT,@MENSAJE VARCHAR(1000);
EXEC USP_UCV_GPO_A_CREAR_CUENTA '00008','01',10000.0,'123456','0003',
	@CODIGO OUT, @ESTADO OUT, @MENSAJE OUT;
PRINT 'CODIGO: ' + @CODIGO;
PRINT CONCAT('ESTADO: ',@ESTADO);
PRINT CONCAT('MENSAJE: ', @MENSAJE);
GO







