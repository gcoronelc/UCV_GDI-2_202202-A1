
select * from cuenta where chr_cuencodigo='00100001';
select * from Movimiento where chr_cuencodigo='00100001';
go


create procedure usp_registra_deposito
(
	@p_cuenta char(8),
	@p_importe decimal(12,2),
	@p_empleado char(4),
	@estado int out
)
as
begin


end;
go
