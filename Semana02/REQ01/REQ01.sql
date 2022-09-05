/*
Desarrolle una VISTA para encontrar los departamentos que tienen más de 5 trabajadores.
Base de datos RH.
*/


/*
1. Analizar cada requerimiento.

Cada departamento tiene una cantidad de trabajadores, se debe contar la cantidad
de trabajadores de cada departamento aplicando GROUP BY y COUNT, luego se debe filtrar
los departamento que tienen mas de 5 trabajadores aplicando HAVING.
*/

/*
2. Identificar los datos que debe tener el reporte.

- NOMBRE DEPARTAMENTO
- CANTIDAD DE EMPLEADOS

*/

/*
3. Identificar las tablas de donde obtendrá los datos.

- Nombre del departamento: DEPARTAMENTO.NOMBRE
- Cantidad de empleado: COUNT(EMPLEADO.IDEMPLEADO)
*/

/*
4. Crear la vista en la base de datos.
*/

create view v_req01(departamento,empleado)
as
SELECT 
	d.nombre "NOMBRE DEPARTAMENTO",
	COUNT(1) "CANTIDAD DE EMPLEADOS"
FROM departamento d
join empleado e on d.iddepartamento=e.iddepartamento
group by d.nombre
having COUNT(1)>5;
go

select * from v_req01;
go


/*
5. Verificar su resultado.
*/

select iddepartamento, count('x') empleados
from empleado
group by iddepartamento;
go

/*
6. Consultar la vista desde Microsoft Excel
*/


-- Extra
select e.*, e.sueldo + isnull(e.comision,0) total
from empleado e;
go

