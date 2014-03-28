USE sysmed;

DROP VIEW IF EXISTS vista_medico;
DROP VIEW IF EXISTS vista_usuario;
DROP VIEW IF EXISTS vista_paciente;

CREATE VIEW sysmed.vista_medico AS
SELECT Persona.Nombre, Persona.Apellido, Especialidad.Descripcion, Persona.idPersona, Medico.idMedico
FROM Persona, Medico, Especialidad
WHERE Persona.idPersona = Medico.idMedico AND Especialidad.idEspecialidad = Medico.idEspecialidad;

CREATE VIEW sysmed.vista_paciente AS
SELECT Persona.Nombre, Persona.Apellido, Persona.idPersona, Paciente.idPaciente
FROM Persona, Paciente
WHERE Persona.idPersona = Paciente.idPaciente;

CREATE VIEW sysmed.vista_usuario AS
SELECT Persona.Nombre, Persona.Apellido, Persona.idPersona, Usuario.idUsuario
FROM Persona, Usuario
WHERE Persona.idPersona = Usuario.idUsuario;