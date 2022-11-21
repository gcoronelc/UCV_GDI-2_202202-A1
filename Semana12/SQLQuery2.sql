
SELECT * FROM Asignado A WHERE A.chr_emplcodigo='0005';
SELECT * FROM Sucursal s WHERE S.chr_sucucodigo='004';
SELECT * FROM Cuenta C WHERE C.chr_sucucodigo='004';
SELECT * FROM Movimiento M WHERE M.chr_cuencodigo='00400002'; 
GO

SELECT * FROM TipoMovimiento;
GO


DECLARE @CUENTA CHAR(8);
SET @CUENTA = '00100004';
SELECT * FROM Cuenta C WHERE C.chr_cuencodigo=@CUENTA;
SELECT * FROM Movimiento M WHERE M.chr_cuencodigo=@CUENTA; 
GO



