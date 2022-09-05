create database prueba;
go

use prueba
go


CREATE TABLE dbo.cargo (
    idcargo     CHAR(3) NOT NULL,
    nombre      VARCHAR(50) NOT NULL,
    sueldo_min  MONEY NOT NULL,
    sueldo_max  MONEY NOT NULL,
    CONSTRAINT pk_cargo PRIMARY KEY ( idcargo )
);
go

CREATE TABLE dbo.ubicacion (
    idubicacion   CHAR(3) NOT NULL,
    ciudad        VARCHAR(50) NOT NULL,
    direccion     VARCHAR(100) NOT NULL,
    CONSTRAINT pk_ubicacion PRIMARY KEY ( idubicacion )
);
go



CREATE TABLE dbo.departamento (
    iddepartamento  INT NOT NULL,
    nombre          VARCHAR(100) NOT NULL,
    idubicacion     CHAR(3) NOT NULL,
    CONSTRAINT pk_departamento 
		PRIMARY KEY ( iddepartamento ),
    CONSTRAINT fk_departamento_ubicacion 
        FOREIGN KEY ( idubicacion ) 
        REFERENCES dbo.ubicacion ( idubicacion )
        ON DELETE NO ACTION 
        ON UPDATE NO ACTION
);
go


CREATE TABLE dbo.empleado (
    idempleado     CHAR(5)        NOT NULL,
    apellido       VARCHAR(50)    NOT NULL,
    nombre         VARCHAR(50)    NOT NULL,
    fecingreso     smalldatetime  NOT NULL,
    email          VARCHAR(50)    NULL,
    telefono       VARCHAR(20)    NULL,
    idcargo        CHAR(3)        NOT NULL,
    iddepartamento INT            NOT NULL,
    sueldo         MONEY          NOT NULL,
    comision       MONEY     NULL,
    jefe           CHAR(5)        NULL,
    CONSTRAINT pk_empleado 
        PRIMARY KEY ( idempleado )
);
GO



-- ==========================================================
-- Cargar datos a la tabla: cargo
-- ==========================================================

INSERT INTO cargo ( idcargo, nombre, sueldo_min, sueldo_max ) VALUES ( 'C01', 'Gerente General', 15000, 50000 );
INSERT INTO cargo ( idcargo, nombre, sueldo_min, sueldo_max ) VALUES ( 'C02', 'Gerente', 10000, 15000 );
INSERT INTO cargo ( idcargo, nombre, sueldo_min, sueldo_max ) VALUES ( 'C03', 'Empleado', 7000, 10000 );
INSERT INTO cargo ( idcargo, nombre, sueldo_min, sueldo_max ) VALUES ( 'C04', 'Analista', 5000, 7000 );
INSERT INTO cargo ( idcargo, nombre, sueldo_min, sueldo_max ) VALUES ( 'C05', 'Vendedor', 3000, 5000 );
INSERT INTO cargo ( idcargo, nombre, sueldo_min, sueldo_max ) VALUES ( 'C06', 'Oficinista', 1500, 3000 );
INSERT INTO cargo ( idcargo, nombre, sueldo_min, sueldo_max ) VALUES ( 'C07', 'Programador', 2500, 6000 );
INSERT INTO cargo ( idcargo, nombre, sueldo_min, sueldo_max ) VALUES ( 'C08', 'Investigador', 6000, 8000 );
INSERT INTO cargo ( idcargo, nombre, sueldo_min, sueldo_max ) VALUES ( 'C09', 'Digitador', 1000, 1500 );
INSERT INTO cargo ( idcargo, nombre, sueldo_min, sueldo_max ) VALUES ( 'C10', 'Anfitriona', 1300, 1800 );
GO

-- ==========================================================
-- Cargar datos a la tabla: ubicacion
-- ==========================================================

INSERT INTO ubicacion ( idubicacion, ciudad, direccion ) VALUES ( 'U01', 'Lima', 'Av. Benavides 534 - Miraflores' );
INSERT INTO ubicacion ( idubicacion, ciudad, direccion ) VALUES ( 'U02', 'Trujillo', 'Calle Primavera 1235 - Cercado' );
INSERT INTO ubicacion ( idubicacion, ciudad, direccion ) VALUES ( 'U03', 'Arequipa', 'Av. Central 2517 - Cercado' );
INSERT INTO ubicacion ( idubicacion, ciudad, direccion ) VALUES ( 'U04', 'Lima', 'Av. La Marina 3456 - San Miguel' );
GO

-- ==========================================================
-- Cargar datos a la tabla: departamento
-- ==========================================================

INSERT INTO departamento ( iddepartamento, nombre, idubicacion ) VALUES ( 100, 'Gerencia', 'U01' );
INSERT INTO departamento ( iddepartamento, nombre, idubicacion ) VALUES ( 101, 'Contabilidad', 'U01' );
INSERT INTO departamento ( iddepartamento, nombre, idubicacion ) VALUES ( 102, 'Investigacion', 'U03' );
INSERT INTO departamento ( iddepartamento, nombre, idubicacion ) VALUES ( 103, 'Ventas', 'U01' );
INSERT INTO departamento ( iddepartamento, nombre, idubicacion ) VALUES ( 104, 'Operaciones', 'U01' );
INSERT INTO departamento ( iddepartamento, nombre, idubicacion ) VALUES ( 105, 'Sistemas', 'U04' );
INSERT INTO departamento ( iddepartamento, nombre, idubicacion ) VALUES ( 106, 'Recursos Humanos', 'U04' );
INSERT INTO departamento ( iddepartamento, nombre, idubicacion ) VALUES ( 107, 'Finanzas', 'U01' );
GO

-- ==========================================================
-- Cargar datos a la tabla: empleado
-- ==========================================================

INSERT INTO empleado ( idempleado, apellido, nombre, fecingreso, email, telefono, idcargo, iddepartamento, sueldo, comision, jefe )
VALUES ( 'E0001', 'Coronel', 'Gustavo', '20000401', 'gcoronelc@gmail.com', '996674457', 'C01', 100, 25000, NULL, NULL );

INSERT INTO empleado ( idempleado, apellido, nombre, fecingreso, email, telefono, idcargo, iddepartamento, sueldo, comision, jefe )
VALUES ( 'E0002', 'Fernandez', 'Claudia', '20000501', 'cfernandez@desarrollasoftware.com', '934528365', 'C03', 100, 8000, NULL, 'E0001' );

INSERT INTO empleado ( idempleado, apellido, nombre, fecingreso, email, telefono, idcargo, iddepartamento, sueldo, comision, jefe )
VALUES ( 'E0003', 'Matsukawa', 'Sergio', '20000401', 'smatsukawa@desarrollasoftware.com', '977248369', 'C02', 102, 15000, NULL, 'E0001' );

INSERT INTO empleado ( idempleado, apellido, nombre, fecingreso, email, telefono, idcargo, iddepartamento, sueldo, comision, jefe )
VALUES ( 'E0004', 'Diaz', 'Mariela', '20000410', 'mdiaz@desarrollasoftware.com', '865466734', 'C06', 102, 1800, NULL, 'E0003' );

INSERT INTO empleado ( idempleado, apellido, nombre, fecingreso, email, telefono, idcargo, iddepartamento, sueldo, comision, jefe )
VALUES ( 'E0005', 'Martinez', 'Roberto', '20000405', 'rmartinez@desarrollasoftware.com', NULL, 'C08', 102, 9000, 500, 'E0003' );

INSERT INTO empleado ( idempleado, apellido, nombre, fecingreso, email, telefono, idcargo, iddepartamento, sueldo, comision, jefe )
VALUES ( 'E0006', 'Espinoza', 'Miguel', '20000406', 'mespinoza@desarrollasoftware.com', '', 'C08', 102, 7500, 500, 'E0003' );

INSERT INTO empleado ( idempleado, apellido, nombre, fecingreso, email, telefono, idcargo, iddepartamento, sueldo, comision, jefe )
VALUES ( 'E0007', 'Ramos', 'Vanessa', '20020406', 'vramos@desarrollasoftware.com', '945663456', 'C08', 102, 7000, 500, 'E0003' );

INSERT INTO empleado ( idempleado, apellido, nombre, fecingreso, email, telefono, idcargo, iddepartamento, sueldo, comision, jefe )
VALUES ( 'E0008', 'Flores', 'Julio', '20000401', 'jflores@desarrollasoftware.com', NULL, 'C07', 102, 3500, 1000, 'E0003' );

INSERT INTO empleado ( idempleado, apellido, nombre, fecingreso, email, telefono, idcargo, iddepartamento, sueldo, comision, jefe )
VALUES ( 'E0009', 'Marcelo', 'Ricardo', '20000401', 'rmarcelo@desarrollasoftware.com', '993672966', 'C02', 101, 15000, NULL, 'E0001' );

INSERT INTO empleado ( idempleado, apellido, nombre, fecingreso, email, telefono, idcargo, iddepartamento, sueldo, comision, jefe )
VALUES ( 'E0010', 'Barrios', 'Guisella', '20010115', 'gbarrios@desarrollasoftware.com', '902324512', 'C03', 101, 8000, NULL, 'E0009' );

INSERT INTO empleado ( idempleado, apellido, nombre, fecingreso, email, telefono, idcargo, iddepartamento, sueldo, comision, jefe )
VALUES ( 'E0011', 'Cuellar', 'Lucy', '20030218', 'lcuellar@desarrollasoftware.com', NULL, 'C06', 101, 2000, NULL, 'E0009' );

INSERT INTO empleado ( idempleado, apellido, nombre, fecingreso, email, telefono, idcargo, iddepartamento, sueldo, comision, jefe )
VALUES ( 'E0012', 'Valencia', 'Hugo', '20000501', 'hvalencia@desarrollasoftware.com', '973285601', 'C02', 105, 18000, NULL, 'E0001' );

INSERT INTO empleado ( idempleado, apellido, nombre, fecingreso, email, telefono, idcargo, iddepartamento, sueldo, comision, jefe )
VALUES ( 'E0013', 'Veliz', 'Fortunato', '20000505', 'fveliz@desarrollasoftware.com', '982677603', 'C04', 105, 6000, NULL, 'E0012' );

INSERT INTO empleado ( idempleado, apellido, nombre, fecingreso, email, telefono, idcargo, iddepartamento, sueldo, comision, jefe )
VALUES ( 'E0014', 'Aguero', 'Octavio', '20000515', 'oaguero@desarrollasoftware.com', NULL, 'C07', 105, 3000, 300, 'E0012' );

INSERT INTO empleado ( idempleado, apellido, nombre, fecingreso, email, telefono, idcargo, iddepartamento, sueldo, comision, jefe )
VALUES ( 'E0015', 'Rosales', 'Cesar', '20030315', 'crosales@desarrollasoftware.com', NULL, 'C07', 105, 2500, 300, 'E0012' );

INSERT INTO empleado ( idempleado, apellido, nombre, fecingreso, email, telefono, idcargo, iddepartamento, sueldo, comision, jefe )
VALUES ( 'E0016', 'Villarreal', 'Nora', '20000501', 'nvillarreal@soporte.pe', '937183641', 'C02', 103, 15000, NULL, 'E0001' );

INSERT INTO empleado ( idempleado, apellido, nombre, fecingreso, email, telefono, idcargo, iddepartamento, sueldo, comision, jefe )
VALUES ( 'E0017', 'Romero', 'Alejandra', '20000503', 'aromero@desarrollasoftware.com', '834519526', 'C03', 103, 7500, NULL, 'E0016' );

INSERT INTO empleado ( idempleado, apellido, nombre, fecingreso, email, telefono, idcargo, iddepartamento, sueldo, comision, jefe )
VALUES ( 'E0018', 'Valdiviezo', 'Jennifer', '20000612', 'jvaldiviezo@desarrollasoftware.com', '926375172', 'C06', 103, 2000, NULL, 'E0016' );

INSERT INTO empleado ( idempleado, apellido, nombre, fecingreso, email, telefono, idcargo, iddepartamento, sueldo, comision, jefe )
VALUES ( 'E0019', 'Muchotrigo', 'Omar', '20000512', 'omuchotrigo@desarrollasoftware.com', '996325542', 'C05', 103, 3500, 500, 'E0016' );

INSERT INTO empleado ( idempleado, apellido, nombre, fecingreso, email, telefono, idcargo, iddepartamento, sueldo, comision, jefe )
VALUES ( 'E0020', 'Baltazar', 'Victor', '20000518', 'vbaltazar@desarrollasoftware.com', '989394433', 'C05', 103, 3000, 800, 'E0016' );

INSERT INTO empleado ( idempleado, apellido, nombre, fecingreso, email, telefono, idcargo, iddepartamento, sueldo, comision, jefe )
VALUES ( 'E0021', 'Castillo', 'Ronald', '20010518', 'rcastillo@desarrollasoftware.com', '923433487', 'C05', 103, 3000, 800, 'E0016' );

INSERT INTO empleado ( idempleado, apellido, nombre, fecingreso, email, telefono, idcargo, iddepartamento, sueldo, comision, jefe )
VALUES ( 'E0022', 'Espilco', 'Luis', '20020417', 'lespilco@desarrollasoftware.com', '955413456', 'C05', 103, 3000, 300, 'E0016' );

INSERT INTO empleado ( idempleado, apellido, nombre, fecingreso, email, telefono, idcargo, iddepartamento, sueldo, comision, jefe )
VALUES ( 'E0023', 'Alvarez', 'Valeria', '20020520', 'valvarez@desarrollasoftware.com', '965458236', 'C07', 105, 4500, 0, 'E0012' );

INSERT INTO empleado ( idempleado, apellido, nombre, fecingreso, email, telefono, idcargo, iddepartamento, sueldo, comision, jefe )
VALUES ( 'E0024', 'Cordova', 'Andrea', '20020610', 'acordova@desarrollasoftware.com', '993612854', 'C06', 101, 2500, 0, 'E0009' );

INSERT INTO empleado ( idempleado, apellido, nombre, fecingreso, email, telefono, idcargo, iddepartamento, sueldo, comision, jefe )
VALUES ( 'E0025', 'Ramirez', 'Diego', '20020503', 'dramirez@desarrollasoftware.com', '968321756', 'C08', 102, 7000, 0, 'E0003' );

GO



-- DEMOSTRACION
/*
Complete la sentencia para agregar FK iddepartamento a la tabla usuarios: 
ALTER TABLE usuarios ___ usuarios_fk ___ REFERENCES departamentos(id)

ALTER TABLE usuarios ADD CONSTRAINT usuarios_fk FOREIGN KEY (IDDEPARTAMENTO) REFERENCES departamentos(id)
*/

ALTER TABLE EMPLEADO 
ADD CONSTRAINT usuarios_fk
FOREIGN KEY (IDDEPARTAMENTO) 
REFERENCES departamento(idDEPARTAMENTO)


/*
Complete la senencia para listar la cantidad de perror que hay en la tabla:

select ___ ___ friends_of_pickles where species ___

*/


/*

Complete la senencia para listar la cantidad de GERENTES que hay en la tabla EMPLEADO:

select ___ ___ EMPLEADO where IDCARGO ___

*/

SELECT * FROM CARGO;
GO

select COUNT(1) CANTIDAD_EMPLEADOS FROM EMPLEADO where IDCARGO = 'C02'
GO

select COUNT(1) CANTIDAD_EMPLEADOS FROM EMPLEADO where IDCARGO = 'C01' OR IDCARGO = 'C02'
GO

select COUNT(1) CANTIDAD_EMPLEADOS FROM EMPLEADO where IDCARGO IN ( 'C02', 'C01' );
GO

select COUNT(1) CANTIDAD_EMPLEADOS FROM EMPLEADO where IDCARGO LIKE 'C0[12]';
GO


/*
Sentencia para listar nombre del departamento y nombre del empleado
*/

select d.nombre, concat(e.apellido,' ',e.nombre) "NOMBRE DEL EMPLEADO"
from departamento d
join empleado e on d.iddepartamento = e.iddepartamento




