
select @@VERSION;
go


select * from rh..empleado;
select * from rh..departamento;
go

select * 
from rh..empleado e
join rh..departamento d on e.iddepartamento=d.iddepartamento;
go

select d.iddepartamento, d.nombre, e.idempleado, e.nombre, e.apellido
from rh..empleado e
join rh..departamento d on e.iddepartamento=d.iddepartamento;
go


select d.iddepartamento, d.nombre, avg(e.sueldo) "Sueldo Promedio"
from rh..empleado e
join rh..departamento d on e.iddepartamento=d.iddepartamento
group by d.iddepartamento, d.nombre;
go