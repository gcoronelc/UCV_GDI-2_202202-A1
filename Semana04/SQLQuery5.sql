use RH;
go


create table SueldoLog(
	id int not null identity,
	fecha date not null,
	HostName VARCHAR(64), 
	IPAddress VARCHAR(32), 
	ProgramName NVARCHAR(255), 
	LoginName NVARCHAR(255), 
	sueldo_old money null,
	sueldo_new money null
);



create trigger tr_SueldoLog
on empleado for insert, update
as
begin
	SET NOCOUNT ON; 
	declare @ip VARCHAR(32), @sueldo_old money, @sueldo_new money;
	set @ip = ( SELECT client_net_address FROM sys.dm_exec_connections 
									WHERE session_id = @@SPID ); 
	insert into SueldoLog(fecha,HostName,IPAddress,ProgramName,LoginName,sueldo_old,sueldo_new)
	select 
		GETDATE(),HOST_NAME(), @ip, PROGRAM_NAME(), 
		SUSER_SNAME(), d.sueldo, i.sueldo
	from inserted i left join deleted d on i.idempleado = d.idempleado
end;
go

select * from SueldoLog;
go

select * from empleado;
go

update empleado 
set sueldo = 40000
where idempleado='E0001';
go


insert into empleado 
values ('E8888','AAAAAA', 'BBBBBB', '20050120', 'algo@gmail.com',
	'99999999', 'C03', 103, 18500, null, 'E0001' );


-- EL ERROR (RETO)

select * from SueldoLog;
go

update empleado 
set nombre = 'Carlos', apellido = 'Alcantara'
where idempleado='E8888';
go


