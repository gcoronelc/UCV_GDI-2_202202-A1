-- Tabla: TIPO

INSERT INTO dbo.TIPO(IDTIPO,NOMBRE) 
VALUES
(1,'Administrativo'),
(2,'Salud');
GO

-- Tabla: 

INSERT INTO dbo.PROFESION(IDPROFESION,NOMBRE) 
VALUES
(1,'Administrador'),
(2,'Contador'),
(3,'Asistente'),
(4,'Medico General'),
(5,'Oculista'),
(6,'Médicina Interna'),
(7,'Pediatría'),
(8,'Enfermeria'),
(9,'Gastroenterología');



-- Tabla: EMPLEADO

SET IDENTITY_INSERT dbo.EMPLEADO ON;  
GO  

INSERT INTO dbo.EMPLEADO(IDEMPLEADO,IDTIPO,IDPROFESION,APELLIDOS,NOMBRES,CORREO)
VALUES
(1,1,1,'RAMIREZ','CLAUDIA','claudia@clinica.com'),
(2,1,1,'ROJAS','EDUARDO','eduardo@clinica.com'),
(3,1,1,'QUISPE','ALEXIA','alexia@clinica.com'),
(4,1,2,'BEJARANO','CARLOS','carlos@clinica.com'),
(5,2,5,'RODRIGUEZ','JOSE','jose@clinica.com'),
(6,2,6,'MILLA','CESAR','cesar@clinica.com'),
(7,2,7,'SOSA','ALEJANDRA','alejandra@clinica.com'),
(8,2,8,'CHAVEZ','FRANCISCO','francisco@clinica.com'),
(9,2,9,'GUTIERREZ','MARIEL','mariel@clinica.com'),
(10,2,7,'CASTILLO','SERGIO','sergio@clinica.com');
GO

SET IDENTITY_INSERT dbo.EMPLEADO OFF;  
GO  

-- Tabla: ROL

INSERT INTO dbo.ROL(IDROL,NOMBRE)
VALUES
(1,'Administrativo'),
(2,'Salud');
GO

-- Tabla: USUARIO

INSERT INTO dbo.USUARIO(IDEMPLEADO,USUARIO,CLAVE,ACTIVO,IDROL)
VALUES
(1,'claudia','secreto',1,1),
(2,'eduardo','secreto',1,1),
(3,'alexia','secreto',1,1),
(4,'carlos','secreto',1,1),
(5,'jose','secreto',1,1),
(6,'cesar','secreto',1,2),
(7,'alejandra','secreto',1,2),
(8,'francisco','secreto',1,2),
(9,'mariel','secreto',1,2),
(10,'sergio','secreto',1,2);
GO

-- Tabla: HABITACION

SET IDENTITY_INSERT dbo.HABITACION ON;  
GO

INSERT INTO dbo.HABITACION(IDHABITACION,PISO,NUMERO,DISPONIBLE)
VALUES
(1,1,101,1),
(2,1,102,1),
(3,1,103,1),
(4,1,104,1),
(5,1,105,1),
(6,2,201,1),
(7,2,202,1),
(8,2,203,1),
(9,2,204,1),
(10,2,205,1),
(11,3,301,1),
(12,3,302,1),
(13,3,303,1),
(14,3,304,1),
(15,3,305,1);
GO

SET IDENTITY_INSERT dbo.HABITACION OFF;  
GO

-- Tabla: PACIENTE

SET IDENTITY_INSERT dbo.PACIENTE ON;  
GO

INSERT INTO dbo.PACIENTE(IDPACIENTE,APELLIDOS,NOMBRES,CORREO)
VALUES
(1,'CORREA','JUAN','juan@gmail.com'),
(2,'RAMOS','MIGUEL','miguel@gmail.com'),
(3,'PIZARRO','SERGIO','sergio@gmail.com'),
(4,'MONTES','KARINA','karina@gmail.com'),
(5,'ALVARADO','PAULA','paula@gmail.com'),
(6,'SANCHEZ','VICENTE','vicente@gmail.com'),
(7,'CORREA','MARIA','maria@gmail.com'),
(8,'CORREA','ROCIO','rocio@gmail.com'),
(9,'CORREA','LUCY','lucy@gmail.com'),
(10,'CORREA','SANTIAGO','santiago@gmail.com');
GO

SET IDENTITY_INSERT dbo.PACIENTE OFF;  
GO






