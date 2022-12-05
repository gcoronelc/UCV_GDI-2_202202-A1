-- LOGIN SA
-- ============================================================

USE [VENTA]
GO

CREATE APPLICATION ROLE [app_prueba] WITH PASSWORD = N'admin'
GO

GRANT SELECT ON CLIENTE TO [app_prueba];
GO

-- LOGIN PANCHITO
-- Panchito debe tener acceso a la base de datos VENTA
-- ============================================================

USE [VENTA]
GO

select * from cliente;
go

EXEC sys.sp_setapprole 'app_prueba', 'admin';  
GO

select * from cliente;
go

