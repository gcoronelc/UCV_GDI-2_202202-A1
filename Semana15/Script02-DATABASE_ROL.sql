
USE [EDUCA]
GO

CREATE ROLE [ROL_MATRICULA]
GO

GRANT SELECT, INSERT, UPDATE ON ALUMNO TO ROL_MATRICULA;
GRANT SELECT, UPDATE ON CURSO TO ROL_MATRICULA;
GRANT SELECT, INSERT, UPDATE ON MATRICULA TO ROL_MATRICULA;
GRANT SELECT, INSERT ON PAGO TO ROL_MATRICULA;
GO

ALTER ROLE [ROL_MATRICULA] ADD MEMBER [pepito]
GO

select * from alumno;
go

ALTER ROLE [ROL_MATRICULA] DROP MEMBER [pepito]
GO
