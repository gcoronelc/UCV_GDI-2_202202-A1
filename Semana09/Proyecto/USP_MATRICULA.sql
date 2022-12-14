
SELECT * FROM CURSO;
GO

ALTER PROCEDURE USP_MATRICULA
(
	@CUR_ID INT,
	@ALU_ID INT,
	@MAT_PRECIO MONEY,
	@MAT_CUOTAS INT,
	@ESTADO INT OUT
)
AS
BEGIN
	-- VARIABLES
	DECLARE @CONT INT, @CUR_PRECIO MONEY, @DISPONIBLES INT;
	-- PROCESO
	SET @ESTADO = 0;
	BEGIN TRY 
		-- Inicia la Tx
		BEGIN TRANSACTION; 
		-- Validar curso
		SELECT @CONT=COUNT(1) FROM CURSO WHERE cur_id=@CUR_ID;
		IF(@CONT=0)
		BEGIN
			set @ESTADO = 2;
			THROW 51000, 'No existe el curso.', 1;
		END;
		-- Validar alumno
		SELECT @CONT=COUNT(1) FROM ALUMNO WHERE alu_id=@ALU_ID;
		IF(@CONT=0)
		BEGIN
			set @ESTADO = 3;
			THROW 51000, 'No existe el alumno.', 1;
		END;
		-- Validar cuotas
		IF(@MAT_CUOTAS<=0 OR @MAT_CUOTAS>3)
		BEGIN
			set @ESTADO = 4;
			THROW 51000, 'Cuotas fuera de rango.', 1;
		END;
		-- Verificar si ya existe la matricula
		SELECT @CONT=COUNT(1) FROM MATRICULA WHERE alu_id=@ALU_ID AND cur_id=@CUR_ID;
		IF(@CONT=1)
		BEGIN
			set @ESTADO = 5;
			THROW 51000, 'Matricula ya existe.', 1;
		END;
		-- Datos del curso
		SELECT 
			@CUR_PRECIO = cur_precio,
			@DISPONIBLES = cur_vacantes - cur_matriculados
		FROM CURSO
		WHERE cur_id = @CUR_ID;
		-- Validar vacates disponibles
		IF(@DISPONIBLES<=0)
		BEGIN
			set @ESTADO = 6;
			THROW 51000, 'No hay vacantes.', 1;
		END;
		-- Validar precio
		IF(@MAT_PRECIO<(@CUR_PRECIO/2) OR @MAT_PRECIO>@CUR_PRECIO)
		BEGIN
			set @ESTADO = 7;
			THROW 51000, 'El precio no es correcto.', 1;
		END;
		-- Registrar Tx
		INSERT INTO MATRICULA(cur_id,alu_id,mat_fecha,mat_precio,mat_cuotas)
		VALUES(@CUR_ID,@ALU_ID,GETDATE(),@MAT_PRECIO,@MAT_CUOTAS);
		UPDATE CURSO
		SET cur_matriculados = cur_matriculados + 1
		WHERE cur_id = @CUR_ID;
		-- Confirma la Tx
		COMMIT TRANSACTION; 
	END TRY 
	BEGIN CATCH 
		-- Cancela la Tx
		PRINT(ERROR_MESSAGE());
		ROLLBACK TRANSACTION;
		if(@ESTADO=0) set @ESTADO = 1;
	END CATCH;
END;
GO

SELECT * FROM MATRICULA WHERE cur_id=1;
GO

-- Datos correctos
DECLARE @ESTADO INT;
EXEC USP_MATRICULA 1,9,800, 2, @ESTADO OUT;
PRINT 'ESTADO: ' + CAST(@ESTADO AS VARCHAR(100));
GO

-- Validar precio
DECLARE @ESTADO INT;
EXEC USP_MATRICULA 13, 3,100000, 1, @ESTADO OUT;
PRINT 'ESTADO: ' + CAST(@ESTADO AS VARCHAR(100));
GO

-- No hay vacantes
DECLARE @ESTADO INT;
EXEC USP_MATRICULA 14, 3,100, 1, @ESTADO OUT;
PRINT 'ESTADO: ' + CAST(@ESTADO AS VARCHAR(100));
GO

-- Matricula ya existe
DECLARE @ESTADO INT;
EXEC USP_MATRICULA 1, 3,10000, 1, @ESTADO OUT;
PRINT 'ESTADO: ' + CAST(@ESTADO AS VARCHAR(100));
GO

-- Cuotas fuera de rango
DECLARE @ESTADO INT;
EXEC USP_MATRICULA 1, 7,10000, 10, @ESTADO OUT;
PRINT 'ESTADO: ' + CAST(@ESTADO AS VARCHAR(100));
GO

-- Alumno no existe
DECLARE @ESTADO INT;
EXEC USP_MATRICULA 1, 11111,10000, 10, @ESTADO OUT;
PRINT 'ESTADO: ' + CAST(@ESTADO AS VARCHAR(100));
GO

-- Curso no existe
DECLARE @ESTADO INT;
EXEC USP_MATRICULA 9999, 1,10000, 10, @ESTADO OUT;
PRINT 'ESTADO: ' + CAST(@ESTADO AS VARCHAR(100));
GO