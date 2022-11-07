
declare @fecha date, @fecha2 date;
SELECT @FECHA=GETDATE();
set @fecha2 = getdate();
select @fecha, @fecha2;
go


declare @rpta decimal(12,2), @num1 int, @num2 int;
set @num1 = 20;
set @num2 = 6;
set @rpta = @num1 / @num2;
print @rpta;
go

select * from cliente;
go

select * from cuenta where chr_cuencodigo='00300002';
select * from movimiento where chr_cuencodigo='00300002';
go

select * from sucursal;
go

select * from asignado where chr_emplcodigo='0005';
go

delete from asignado where chr_emplcodigo='0005';


insert into Asignado values( '000006', '006', '0005', '20080105', '20090415' );
insert into Asignado values( '000012', '004', '0005', '20090416', null );

select right('123456789',5);
SELECT CONCAT('ABC',345);

select * from TipoMovimiento;







