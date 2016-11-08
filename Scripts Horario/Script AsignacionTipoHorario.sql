-- AsignacionTipoHorario
DELETE FROM AsignacionTipoHorario
SET IDENTITY_INSERT AsignacionTipoHorario ON
INSERT INTO AsignacionTipoHorario (Id,Nombre,Parrilla)
VALUES   (1,'Prescolar',1)	
		,(2,'Primaria - Lunes a Jueves',1)
		,(3,'Primaria - Viernes	2',1)
		,(4,'Bachillerato - Lunes a Jueves',1)
		,(5,'Bachillerato - Viernes',1)
SET IDENTITY_INSERT AsignacionTipoHorario OFF