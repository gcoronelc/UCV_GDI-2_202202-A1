

SELECT * FROM USUARIO WHERE USUARIO='pcastro' AND CLAVE='cazador';
GO

SELECT * FROM USUARIO WHERE USUARIO='pcastro' AND CLAVE='' OR '1'='1';
GO


select * from cliente;
go

select * from EMPLEADO;
go

select * from cargo;
go

EXEC sys.sp_setapprole 'ROL_ALFA', 'admin';  
GO

select * from cargo;
go

select SUSER_NAME(), USER_NAME();
go


select * from empleado;
GO

USE BOOKSTORE;
GO


