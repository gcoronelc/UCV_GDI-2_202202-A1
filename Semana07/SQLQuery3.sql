/*
Ejercicio
Calcular una venta
*/

/*
1. Analizar del requerimiento.
- Analisis de la caja negra.
- Formulas
  @TOTAL = @IMPORTE + @IMPUESTO
  @TOTAL = @PRECIO * @CANTIDAD
  @IMPORTE = 
  @IMPUESTO = 
*/

/*
2. Diseñar una solución.

CREATE PROCEDURE SP_VENTA
(
    @PRECIO DECIMAL(12,2),
	@CANTIDAD INT,
	@IMPORTE DECIMAL(12,2) OUT,
	@IMPUESTO DECIMAL(12,2) OUT,
	@TOTAL DECIMAL(12,2) OUT
)
AS


*/
/*
3. Implementar la solución.
*/

CREATE PROCEDURE SP_VENTA
(
    @PRECIO DECIMAL(12,2),
	@CANTIDAD INT,
	@IMPORTE DECIMAL(12,2) OUT,
	@IMPUESTO DECIMAL(12,2) OUT,
	@TOTAL DECIMAL(12,2) OUT
)
AS
BEGIN
  SET @TOTAL = @PRECIO * @CANTIDAD;
  SET @IMPORTE = @TOTAL / 1.18;
  SET @IMPUESTO = @TOTAL - @IMPORTE;
END;
GO

/*
4. Verificar su funcionamiento.
*/

DECLARE
	@PRECIO DECIMAL(12,2),     @CANTIDAD INT,
	@IMPORTE DECIMAL(12,2),      @IMPUESTO DECIMAL(12,2),     @TOTAL DECIMAL(12,2)
BEGIN
    SET @PRECIO = 100.00;
	SET @CANTIDAD = 5;
	EXEC SP_VENTA @PRECIO, @CANTIDAD, @IMPORTE OUT, @IMPUESTO OUT, @TOTAL OUT;
	PRINT 'Importe: ' + CAST(@IMPORTE AS VARCHAR(20));
	PRINT 'Impuesto: ' + CAST(@IMPUESTO AS VARCHAR(20));
	PRINT 'Total: ' + CAST(@TOTAL AS VARCHAR(20));
END;
GO

/*
Rspuesta:
Importe: 423.73
Impuesto: 76.27
Total: 500.00

Verificar:
500.0 = 423.73 + 76.27
500.0 = 500.00

76.27 = 423.73 * 0.18
76.27 = 76.275

*/

/*
5. Recoger evidencias.
6. Elaborar informe que incluya conclusiones y recomendaciones.
*/