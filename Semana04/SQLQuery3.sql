/*
Los triggers de base de datos te permiten prevenir 
acciones incorrectas sobre los objetos, y mucho mas.

En este ejemplo no podras eliminar tablasy tampoco modificarlas.
*/

CREATE TRIGGER tr_seguridad 
ON DATABASE 
FOR DROP_TABLE, ALTER_TABLE 
AS 
BEGIN 
	RAISERROR('No se permite eliminar ni modificar tablas.',16,1); 
	ROLLBACK; 
END; 
GO

drop table pago;
go


