

CREATE VIEW V_01 AS
SELECT * FROM EMPLEADO;
GO

SELECT * FROM DBO.V_01;
GO

CREATE VIEW V_02 
(DEPARTAMENTO, EMPLEADOS,PLANILLA)
AS
SELECT iddepartamento, COUNT(1) EMPLEADOS, SUM(SUELDO) PLANILLA
FROM EMPLEADO 
GROUP BY iddepartamento;
GO

SELECT * FROM V_02;
GO









