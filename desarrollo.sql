DROP DATABASE IF EXISTS sysmed;
CREATE DATABASE sysmed;

USE sysmed;

DROP TABLE IF EXISTS Persona;
DROP TABLE IF EXISTS Paciente;
DROP TABLE IF EXISTS tipoUsuario;
DROP TABLE IF EXISTS Horario;
DROP TABLE IF EXISTS Medico;
DROP TABLE IF EXISTS Usuario;
DROP TABLE IF EXISTS Especialidad;
DROP TABLE IF EXISTS Historial;
DROP TABLE IF EXISTS Cita;


CREATE TABLE tipoUsuario(
idTipoUsuario INT(4) NOT NULL PRIMARY KEY AUTO_INCREMENT,
Descripcion VARCHAR(20) NOT NULL
);

CREATE TABLE Horario(
idHorario INT(4) NOT NULL PRIMARY KEY AUTO_INCREMENT,
Descripcion VARCHAR(30) NOT NULL
);

CREATE TABLE Especialidad(
idEspecialidad INT(4) NOT NULL PRIMARY KEY AUTO_INCREMENT,
Descripcion VARCHAR(30) NOT NULL
);


CREATE TABLE Persona(
idPersona INT(4) NOT NULL PRIMARY KEY AUTO_INCREMENT,
Nombre VARCHAR(25) NOT NULL,
Apellido VARCHAR(40) NOT NULL,
Direccion VARCHAR(100) NOT NULL,
Telefono VARCHAR(15) NOT NULL,
eMail VARCHAR(100) NOT NULL,
Edad INT(3) NOT NULL,
Sexo CHAR(1) NOT NULL,
FechaRegistro VARCHAR(20) NOT NULL
);


CREATE TABLE Paciente(
idPaciente INT(4) NOT NULL PRIMARY KEY AUTO_INCREMENT,
idPersona INT(4) NOT NULL REFERENCES Persona.idPersona
);


CREATE TABLE Medico(
idMedico INT(4) NOT NULL PRIMARY KEY AUTO_INCREMENT,
idPersona INT(4) NOT NULL REFERENCES Persona.idPersona,
idEspecialidad INT(4) NOT NULL REFERENCES Especialidad.idEspecialidad,
Cedula VARCHAR(20) NOT NULL,
Estado VARCHAR(15) NOT NULL
);


CREATE TABLE Usuario(
idUsuario INT(4) NOT NULL PRIMARY KEY AUTO_INCREMENT,
idPersona INT(4) NOT NULL REFERENCES Persona.idPersona,
idTipoUsuario INT(4) NOT NULL REFERENCES tipoUsuario.idTipoUsuario,
Contrasena VARCHAR(20) NOT NULL,
Estado VARCHAR(15) NOT NULL
);

CREATE TABLE Historial(
idHistorial INT(4) NOT NULL PRIMARY KEY AUTO_INCREMENT,
idMedico INT(4) REFERENCES Medico.idMedico,
idUsuario INT(4) REFERENCES Usuario.idUsuario,
Estado VARCHAR(15),
Motivo VARCHAR(50),
Fecha VARCHAR(20)
);

CREATE TABLE Cita(
idCita INT(4) NOT NULL PRIMARY KEY AUTO_INCREMENT,
idMedico INT(4) NOT NULL REFERENCES Medico.idMedico,
idPaciente INT(4) NOT NULL REFERENCES Paciente.idPaciente,
idHorario INT(4) NOT NULL REFERENCES Horario.idHorario,
idUsuario INT(4) NOT NULL REFERENCES Usuario.idUsuario,
Fecha VARCHAR (20) NOT NULL,
FechaActual VARCHAR(20) NOT NULL,
HoraActual VARCHAR(20) NOT NULL,
Estado VARCHAR(15) NOT NULL
);

INSERT INTO tipoUsuario(idTipoUsuario, Descripcion)VALUES(0001,'Administrador');
INSERT INTO tipoUsuario(Descripcion)VALUES('Usuario');

INSERT INTO Horario(idHorario, Descripcion)VALUES(0001, '8:00 am - 9:00 am');
INSERT INTO Horario(Descripcion)VALUES('9:00 am - 10:00 am');
INSERT INTO Horario(Descripcion)VALUES('10:00 am - 11:00 am');
INSERT INTO Horario(Descripcion)VALUES('11:00 am - 12:00 pm');
INSERT INTO Horario(Descripcion)VALUES('12:00 am - 01:00 pm');
INSERT INTO Horario(Descripcion)VALUES('01:00 pm - 02:00 pm');
INSERT INTO Horario(Descripcion)VALUES('02:00 pm - 03:00 pm');
INSERT INTO Horario(Descripcion)VALUES('03:00 am - 04:00 pm');
INSERT INTO Horario(Descripcion)VALUES('04:00 pm - 05:00 pm');
INSERT INTO Horario(Descripcion)VALUES('05:00 pm - 06:00 pm');

INSERT INTO Especialidad(idEspecialidad, Descripcion)VALUES(0001, 'Medico General');
INSERT INTO Especialidad(Descripcion)VALUES('Medico Cirujano');
INSERT INTO Especialidad(Descripcion)VALUES('Cardiologo');

INSERT INTO Persona(idPersona,Nombre,Apellido,Direccion,Telefono,eMail,Edad,Sexo,FechaRegistro)
VALUES(0001,'Manuel','Aguilar','Juarez #3','123456789','manuel@',25,'M','01/01/2013');
INSERT INTO Persona(Nombre,Apellido,Direccion,Telefono,eMail,Edad,Sexo,FechaRegistro)
VALUES('Jose','Perez','Juarez #4','123456789','jose@',25,'M','10/04/2013');
INSERT INTO Persona(Nombre,Apellido,Direccion,Telefono,eMail,Edad,Sexo,FechaRegistro)
VALUES('Amanda','Martinez','Juarez #5','123456789','amanda@',26,'F','01/01/2014');
INSERT INTO Persona(Nombre,Apellido,Direccion,Telefono,eMail,Edad,Sexo,FechaRegistro)
VALUES('Ana','Vazquez','Juarez #6','123456789','ana@',27,'F','05/10/2012');
INSERT INTO Persona(Nombre,Apellido,Direccion,Telefono,eMail,Edad,Sexo,FechaRegistro)
VALUES('Fernando','Serrato','Juarez #7','123456789','fer@',28,'M','09/05/2010');
INSERT INTO Persona(Nombre,Apellido,Direccion,Telefono,eMail,Edad,Sexo,FechaRegistro)
VALUES('Guadalupe','Rodriguez','Juarez #8','123456789','guada@',25,'M','01/01/2013');
INSERT INTO Persona(Nombre,Apellido,Direccion,Telefono,eMail,Edad,Sexo,FechaRegistro)
VALUES('Yadira','Morales','Juarez #9','123456789','jady@',27,'F','15/08/2010');
INSERT INTO Persona(Nombre,Apellido,Direccion,Telefono,eMail,Edad,Sexo,FechaRegistro)
VALUES('Juan Ramon','Calvillo','Juarez #10','123456789','juanR@',20,'M','01/06/2012');

INSERT INTO Persona(Nombre,Apellido,Direccion,Telefono,eMail,Edad,Sexo,FechaRegistro)
VALUES('Edna Yuritzi','Sanches','Main #13','987654321','edn@',22,'F','01/07/2012');
INSERT INTO Persona(Nombre,Apellido,Direccion,Telefono,eMail,Edad,Sexo,FechaRegistro)
VALUES('Monserrat','Martinez','Juriquilas #15','98748192','monse@',25,'F','08/07/2013');
INSERT INTO Persona(Nombre,Apellido,Direccion,Telefono,eMail,Edad,Sexo,FechaRegistro)
VALUES('Alexandre','Zavala','Hidalgo #18','74189536','alex@',27,'M','01/08/2013');
INSERT INTO Persona(Nombre,Apellido,Direccion,Telefono,eMail,Edad,Sexo,FechaRegistro)
VALUES('Pablo Jesus','Suarez','Pavon #10','21479584','pablo@',29,'M','01/05/2013');

INSERT INTO Medico(idMedico,idPersona,idEspecialidad,Cedula,Estado)VALUES(0001,0001,0001,'MANU0002','Alta');
INSERT INTO Medico(idPersona,idEspecialidad,Cedula,Estado)VALUES(0003,0002,'AMAU0002','Alta');
INSERT INTO Medico(idPersona,idEspecialidad,Cedula,Estado) VALUES (0005,0003,'FERU0002','Alta');
INSERT INTO Medico(idPersona,idEspecialidad,Cedula,Estado) VALUES (0007,0001,'YADU0002','Baja');

INSERT INTO Usuario(idUsuario,idPersona,idTipoUsuario,Contrasena,Estado)
VALUES (0001,0002,0001,'jose','Alta');
INSERT INTO Usuario(idPersona,idTipoUsuario,Contrasena,Estado)
VALUES (0004,0002,'ana','Alta');
INSERT INTO Usuario(idPersona,idTipoUsuario,Contrasena,Estado)
VALUES (0010,0002,'monse','Alta');

INSERT INTO Paciente(idPaciente,idPersona) VALUES (0001,0006);
INSERT INTO Paciente(idPersona) VALUES (0008);
INSERT INTO Paciente(idPersona) VALUES (0009);
INSERT INTO Paciente(idPersona) VALUES (0011);
INSERT INTO Paciente(idPersona) VALUES (0012);

INSERT INTO Cita(idCita, idMedico, idPaciente, idHorario, idUsuario, Fecha, FechaActual, HoraActual, Estado)
VALUES(0001, 0001, 0001, 0001, 0001, '17/03/2014','15/03/2014', '10:00', 'realizada');
INSERT INTO Cita(idMedico, idPaciente, idHorario, idUsuario, Fecha, FechaActual, HoraActual, Estado)
VALUES(0004, 0003, 0003, 0001, '20/03/2014','18/03/2014', '13:00', 'pendiente');
INSERT INTO Cita(idMedico, idPaciente, idHorario, idUsuario, Fecha, FechaActual, HoraActual, Estado)
VALUES(0003, 004, 0004, 0002, '20/03/2014','18/03/2014', '12:00', 'pendiente');
INSERT INTO Cita(idMedico, idPaciente, idHorario, idUsuario, Fecha, FechaActual, HoraActual, Estado)
VALUES(0002, 005, 0007, 0002, '16/01/2014','15/03/2014', '15:00', 'realizada');
INSERT INTO Cita(idMedico, idPaciente, idHorario, idUsuario, Fecha, FechaActual, HoraActual, Estado)
VALUES(0001, 0002, 0006, 0003, '15/01/2014','14/03/2014', '06:00', 'cancelada');