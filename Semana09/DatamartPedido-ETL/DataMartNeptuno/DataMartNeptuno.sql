--crear dataBase
create database DataMartNeptuno
GO

--instanciar database
use DataMartNeptuno
GO

create table DimensionProducto
(KeyProducto int primary key identity(1,1),
CodigoProducto int null,
NombreProducto varchar(100) null,
NombreCategoria  varchar(100) null,
PrecioUnidad  smallmoney)
GO

create table DimensionEmpleado  
(KeyEmpleado int primary key identity(1,1),
CodigoEmpleado int null,
NombreEmpleado varchar(100)null)
GO

create table DimensionCliente
(KeyCliente int primary key identity(1,1),
CodigoCliente char(5)null,
NombreCliente varchar(100)null, 
Ciudad varchar(50)null,
Pais varchar(20)null)
GO

create table DimensionTransporte
(KeyTransporte int primary key identity(1,1),
CodigoTransporte int null,
CampañiaTransporte varchar(100))
GO

create table DimensionTiempo
(KeyTiempo int primary key identity(1,1),
Fecha Smalldatetime,
mes int,
trimestre int,
año int)
GO

create table HechoPedido
(KeyTiempo int,
KeyCliente int,
KeyEmpleado int,
KeyTransporte int,
KeyProducto int,
NumeroPedido int ,
MontoVenta smallmoney,
CantidadUnidades int,
MontoFlete smallmoney,
primary key(KeyTiempo,KeyCliente,KeyEmpleado,KeyTransporte,KeyProducto,NumeroPedido),
FOREIGN KEY (KeyTiempo) REFERENCES DimensionTiempo(KeyTiempo),
FOREIGN KEY (KeyCliente) REFERENCES DimensionCliente(KeyCliente),
FOREIGN KEY (KeyEmpleado) REFERENCES DimensionEmpleado(KeyEmpleado),
FOREIGN KEY (KeyTransporte) REFERENCES DimensionTransporte(KeyTransporte),
FOREIGN KEY (KeyProducto) REFERENCES DimensionProducto(KeyProducto))
GO
