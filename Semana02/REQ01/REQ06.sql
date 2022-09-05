/*
Desarrolle una VISTA PARA encontrar el empleado que tiene el menor salario por departamento.
Base de datos RH
*/


/*
1. Analizar cada requerimiento.

Todo empleado tiene un salario o sueldo, en todo departamento existe uno o mas 
empleados que tienen el menor salario, la idea es identificar a esos empleados.
*/

/*
2. Identificar los datos que debe tener el reporte.

- nombre del departamento
- nombre del empleado
- salario o sueldo
*/

/*
3. Identificar las tablas de donde obtendrá los datos.

- nombre del departamento: DEPARTAMENTO
- nombre del empleado: EMPLEADO
- salario o sueldo: EMPLEADO
*/


/*
4. Crear la vista en la base de datos.
*/

CREATE VIEW V_REQ06
AS
WITH 
V1 AS (
	SELECT iddepartamento, MIN(SUELDO) SUELDO_MINIMO
	FROM EMPLEADO
	GROUP BY iddepartamento )
SELECT 
	D.nombre DEPARTAMENTO,
	E.nombre EMPLEADO,
	E.SUELDO SUELDO
FROM departamento D
JOIN empleado E ON D.iddepartamento = E.iddepartamento
JOIN V1 ON E.iddepartamento=V1.iddepartamento AND E.sueldo=V1.SUELDO_MINIMO;
GO

SELECT * FROM V_REQ06;
GO





/*
5. Verificar su resultado.
6. Consultar la vista desde Microsoft Excel

*/