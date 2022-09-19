
select * from empleado;
go

SELECT  nombre, MAX(sueldo)
FROM empleado
group by nombre;
go