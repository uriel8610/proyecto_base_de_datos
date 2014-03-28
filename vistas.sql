USE sysmed;

DROP VIEW IF EXISTS vista_medico;
DROP VIEW IF EXISTS vista_usuario;
DROP VIEW IF EXISTS vista_paciente;

CREATE VIEW sysmed.vista_medico AS
SELECT Persona.Nombre, Persona.Apellido, Especialidad.Descripcion
FROM Persona, Medico, Especialidad
WHERE Persona.idPersona = Medico.idMedico AND Especialidad.idEspecialidad = Medico.idEspecialidad;

CREATE VIEW sysmed.vista_paciente AS
SELECT Persona.Nombre, Persona.Apellido
FROM Persona, Paciente
WHERE Persona.idPersona = Paciente.idPaciente;

CREATE VIEW sysmed.vista_usuario AS
SELECT Persona.Nombre, Persona.Apellido
FROM Persona, Usuario
WHERE Persona.idPersona = Usuario.idUsuario;