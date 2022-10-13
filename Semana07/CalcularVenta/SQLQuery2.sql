/*
Calcular Venta

1. Analizar del requerimiento.
Se trata de calcular una venta de un producto donde el cliente
elige el de su preferencia y la cantidad respectiva.

Analisis de la caja negra.
---------------------------------------
- Datos de entrada
- Datos de salida

Calculos
--------------------------------------
@TOTAL = @precio * @cantidad
@SUBTOTAL = @TOTAL / 1.18
@IMPUESTO = @TOTAL - @SUBTOTAL
*/

/*
2. Diseñar una solución.

CREATE PROCEDURE USP_VENTA
(
	@PRECIO    MONEY,
	@CANTIDAD  INT,
	@SUBATOTAL MONEY OUT,
	@IMPUESTO  MONEY OUT,
	@TOTAL     MONEY OUT
)
AS

*/

/*
3. Implementar la solución.
*/

CREATE PROCEDURE USP_VENTA
(
	@PRECIO    MONEY,
	@CANTIDAD  INT,
	@SUBATOTAL MONEY OUT,
	@IMPUESTO  MONEY OUT,
	@TOTAL     MONEY OUT
)
AS
BEGIN
	SET @TOTAL = @PRECIO * @CANTIDAD;
	SET @SUBATOTAL = @TOTAL / 1.18;
	SET @IMPUESTO = @TOTAL - @SUBATOTAL;
END;
GO

/*
4. Verificar su funcionamiento.
*/

DECLARE @SUBTOTAL MONEY, @IMPUESTO MONEY, @TOTAL MONEY;
EXEC USP_VENTA 50.0, 10, @SUBTOTAL OUT, @IMPUESTO OUT, @TOTAL OUT;
PRINT 'SUBTOTAL: ' + CAST(@SUBTOTAL AS VARCHAR(20));
PRINT 'IMPUESTO: ' + CAST(@IMPUESTO AS VARCHAR(20));
PRINT 'TOTAL: ' + CAST(@TOTAL AS VARCHAR(20));
GO


/*
5. Recoger evidencias.
6. Elaborar informe que incluya conclusiones y recomendaciones.
*/