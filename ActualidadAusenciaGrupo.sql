SELECT 
*
	--TG.Nombre as TipoGrupo
	--,GR.Nombre AS NombreGrupo
	--,SES.Fecha as FechaSesion
	--,PR.PrimerApellido + ' ' + isNull(PR.SegundoApellido,'') + ' ' + PR.PrimerNombre + ' ' + isNull(PR.SegundoNombre,'')  AS NombreEstudiante
	--,GES.Asistencia as Asistencia
	--,ST.IdSolicitudTransporte AS NoSolicitud
	--,ST.Observaciones AS MotivoSolicitud
	--,ST.EstadoSolicitud AS EstadoSolicitud
	--,ST.FechaSolicitud AS FechaSolicitud

FROM TIPOGRUPO AS TG

INNER JOIN  GRUPO AS GR 
ON TG.Id = GR.IdTipoGrupo

INNER  JOIN Sesion AS SES 
ON GR.Id = SES.IdGrupo 

INNER JOIN GrupoEstudianteSesion AS GES
ON GES.IdSesion = SES.Id

INNER JOIN GrupoEstudiante AS GE 
ON GES.IdGrupoEstudiante = GE.Id

INNER JOIN EstudianteCurso AS ES 
ON GE.TipoIdentificacionEstudiante = ES.TipoIdentificacionEstudiante
AND GE.NumeroIdentificacionEstudiante = ES.NumeroIdentificacionEstudiante
AND ES.Estado <> 'Retirado'

INNER JOIN Curso as CR
ON ES.IdCurso = CR.IdCurso 

INNER JOIN PeriodoLectivo AS PL
ON CR.AnioAcademico = PL.ID
AND PL.AnioActivo = '1'

INNER JOIN PERSONA AS PR
ON  ES.TipoIdentificacionEstudiante = PR.TipoIdentificacion
AND ES.NumeroIdentificacionEstudiante = PR.NumeroIdentificacion


WHERE 

TG.ID = 13 
AND GR.ID = 335


----