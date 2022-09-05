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



