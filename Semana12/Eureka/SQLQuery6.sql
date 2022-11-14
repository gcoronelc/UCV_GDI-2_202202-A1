
--begin tran

select * from movimiento;

delete from movimiento;

select * from movimiento;

select * from cuenta;

delete from cuenta;

select * from cuenta;

rollback tran;

select * from cuenta;
select * from movimiento;


select @@TRANCOUNT;
go

