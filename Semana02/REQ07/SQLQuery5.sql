/*
Calcular los ingresos por mes de un determinado año, por curso.
Base de datos: EDUTEC 

NOMBRE CURSO ENERO FEBRERO MARZO ..... TOTAL 
----------------------------------------------------------------
*/


SELECT * FROM dbo.CursoProgramado;
go


select 
	IdCurso,
	SUM(IIF(RIGHT(IDCICLO,2)='01',Matriculados*PreCursoProg,0)) ENERO,
	SUM(IIF(RIGHT(IDCICLO,2)='02',Matriculados*PreCursoProg,0)) FEBRERO,
	SUM(IIF(RIGHT(IDCICLO,2)='03',Matriculados*PreCursoProg,0)) MARZO,
	SUM(IIF(RIGHT(IDCICLO,2)='04',Matriculados*PreCursoProg,0)) ABRIL,
	SUM(IIF(RIGHT(IDCICLO,2)='05',Matriculados*PreCursoProg,0)) MAYO,
	SUM(IIF(RIGHT(IDCICLO,2)='06',Matriculados*PreCursoProg,0)) JUNIO,
	SUM(IIF(RIGHT(IDCICLO,2)='07',Matriculados*PreCursoProg,0)) JULIO,
	SUM(IIF(RIGHT(IDCICLO,2)='08',Matriculados*PreCursoProg,0)) AGOSTO,
	SUM(IIF(RIGHT(IDCICLO,2)='09',Matriculados*PreCursoProg,0)) SETIEMBRE,
	SUM(IIF(RIGHT(IDCICLO,2)='10',Matriculados*PreCursoProg,0)) OCTUBRE,
	SUM(IIF(RIGHT(IDCICLO,2)='11',Matriculados*PreCursoProg,0)) NOVIEMBRE,
	SUM(IIF(RIGHT(IDCICLO,2)='12',Matriculados*PreCursoProg,0)) DICIEMBRE,
	sum(Matriculados*PreCursoProg) "TOTAL"
from dbo.CursoProgramado
where IdCiclo like '2021%'
GROUP BY IdCurso;
GO

SELECT RIGHT('GUSTAVO',2);
GO

