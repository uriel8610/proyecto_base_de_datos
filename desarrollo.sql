DROP DATABASE IF EXISTS `desarrollo`;
CREATE DATABASE `desarrollo`;
USE `desarrollo`;





DROP TABLE IF EXISTS `Cita`;
CREATE TABLE `Cita`(
`idCita` INT(4) NOT NULL PRIMARY KEY AUTO_INCREMENT,
`idMedico` INT(4) NOT NULL REFERENCES Medico.idMedico,
`idPaciente` INT(4) NOT NULL REFERENCES Paciente.idPaciente,
`idHorario` INT(4) NOT NULL REFERENCES Horario.idHorario,
`FechaActual` VARCHAR(45) NOT NULL,
`HoraActual` VARCHAR(45) NOT NULL,
`estado` BOOL NOT NULL
);



DROP TABLE IF EXISTS `tipoUsuario`;
CREATE TABLE `tipoUsuario`(
`idtipoUsuario` INT(4) NOT NULL PRIMARY KEY AUTO_INCREMENT,
`Descripcion` VARCHAR(45) NOT NULL
);



DROP TABLE IF EXISTS `Horario`;
CREATE TABLE `Horario`(
`idHorario` INT(4) NOT NULL PRIMARY KEY AUTO_INCREMENT,
`Descripcion` VARCHAR(45) NOT NULL

);


DROP TABLE IF EXISTS `Especialidad`;
CREATE TABLE `Especialidad`(
`idEspecialidad` INT(4) NOT NULL PRIMARY KEY AUTO_INCREMENT,
`Descripcion` VARCHAR(45) NOT NULL

);


DROP TABLE IF EXISTS `Persona`;
CREATE TABLE `Persona`(
`idPersona` INT(4) NOT NULL PRIMARY KEY AUTO_INCREMENT,
`Nombre` VARCHAR(50) NOT NULL,
`Apellido` VARCHAR(100) NOT NULL,
`Direccion` VARCHAR(100) NOT NULL,
`Telefono` VARCHAR(15) NOT NULL,
`Email` VARCHAR(100) NOT NULL,
`Edad` INT(3) NOT NULL,
`Sexo` BOOL NOT NULL,
`FechaRegistro` BOOL NOT NULL

);



DROP TABLE IF EXISTS `Paciente`;
CREATE TABLE `Paciente`(
`idPaciente` INT(4) NOT NULL PRIMARY KEY AUTO_INCREMENT,
`idPersona` INT(4) NOT NULL REFERENCES Persona.idPersona

);


DROP TABLE IF EXISTS `Medico`;
CREATE TABLE `Medico`(
`idMedico` INT(4) NOT NULL PRIMARY KEY AUTO_INCREMENT,
`idPersona` INT(4) NOT NULL REFERENCES Persona.idPersona,
`Cedula` VARCHAR(45) NOT NULL,
`idEspecialidad` INT(4) NOT NULL REFERENCES Especialidad.idEspecialidad,
`estado` BOOL NOT NULL

);

INSERT INTO Medico(idMedico,idPersona, Cedula, idEspecialidad, estado) VALUES (1, 5,  'swew', 1, '1' );
INSERT INTO Medico(idMedico,idPersona, Cedula, idEspecialidad, estado) VALUES (2, 4,  'rasaswew', 2,'2' );
INSERT INTO Medico(idMedico,idPersona, Cedula, idEspecialidad, estado) VALUES (3, 3,  'rrw32', 4,'1' );
INSERT INTO Medico(idMedico,idPersona, Cedula, idEspecialidad, estado) VALUES (4, 2,  'rrw32', 5,'2' );
INSERT INTO Medico(idMedico,idPersona, Cedula, idEspecialidad, estado) VALUES (5, 1,  'rrw32', 3,'1' );

DROP TABLE IF EXISTS `Usuario`;
CREATE TABLE `Usuario`(
`idUsuario` INT(4) NOT NULL PRIMARY KEY AUTO_INCREMENT,
`idPersona` INT(4) NOT NULL REFERENCES Persona.idPersona,
`Contraseña` VARCHAR(45) NOT NULL,
`idtipoUsuario` INT(4) NOT NULL REFERENCES tipoUsuario.idTipoUsuario
);


DROP TABLE IF EXISTS `Historial`;
CREATE TABLE `Historial`
(
`idHistorial` INT(4) NOT NULL PRIMARY KEY AUTO_INCREMENT,
`idMedico` INT(4) REFERENCES Medico.idMedico,
`idUsuario` INT(4) REFERENCES Usuario.idUsuario,
`estado` BOOL NOT NULL,
`Motivo` VARCHAR(50),
`Fecha` VARCHAR(20)
);






#INSERT INTO tipoUsuario(idTipoUsuario, Descripcion)VALUES(0001,'Administrador');
#INSERT INTO tipoUsuario(idTipoUsuario, Descripcion)VALUES(0002,'Usuario');


#INSERT INTO Horario(idHorario, Descripcion)VALUES(0001, '8:00 am - 9:00 am');


#INSERT INTO Especialidad(idEspecialidad, Descripcion)VALUES(0001, 'Medico General');



