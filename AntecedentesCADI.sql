declare 
		 @TipoIdentificacion VARCHAR(30) = 'NUIP'
		,@NumeroIdentificacion VARCHAR (30) = '1014881130'
SELECT 

*

-- PR.PrimerApellido + ' ' + isnull(PR.SegundoApellido, '') + ' '  + PR.PrimerNombre + ' ' + isnull (PR.SegundoNombre, '') As NombrePaciente
--,PR.FechaNacimiento AS FechaNacimiento
--,[dbo].[F_SGS_CalcularEdadAniosMeses] (PR.FechaNacimiento) AS Edad
--,DTP.Direccion AS Dirección
--,DTP.Celular AS Teléfono


FROM NovedadMedica  AS NVM
INNER JOIN PersonaNovedadMedica AS PNM 
ON NVM.IdNovedadMedica = PNM.IdNovedadMedica

INNER JOIN Persona AS PR
ON PNM.TipoIdentificacionPersona = PR.TipoIdentificacion 
AND PNM.NumeroIdentificacionPersona = PR.NumeroIdentificacion

INNER JOIN VW_DATOSPERSONA AS DTP
ON PNM.TipoIdentificacionPersona = DTP.TipoIdentificacion 
AND PNM.NumeroIdentificacionPersona = DTP.NumeroIdentificacion

--INNER JOIN EstudianteCurso AS ES 
--ON PNM.TipoIdentificacionPersona = ES.TipoIdentificacionEstudiante
--AND PNM.NumeroIdentificacionPersona = ES.NumeroIdentificacionEstudiante
--AND ES.Estado <> 'Retirado'

--INNER JOIN Curso as CR
--ON ES.IdCurso = CR.IdCurso 

--INNER JOIN Nivel as NV
--ON CR.IdNivel = NV.IdNivel

--INNER JOIN Seccion AS SE
--ON NV.IdSeccion = SE.IdSeccion

--INNER JOIN PeriodoLectivo AS PL
--ON CR.AnioAcademico = PL.ID
--AND PL.AnioActivo = '1'

INNER JOIN TipoNovedadMedica AS TNM 
ON NVM.IdTipoNovedad = TNM.IdTipoNovedadMedica

INNER JOIN TipoNovedadMedicaPestania AS TNMP
ON TNM.IdTipoNovedadMedica = TNMP.IdTipoNovedadMedica

--INNER JOIN Usuario AS USR
--ON NvM.UsuarioLog = USR.mail

--LEFT JOIN CALENDARIO AS CAL 
--ON NVM.FECHA1=CAL.FECHA

--LEFT JOIN TipoHorario AS TH
--	ON TH.IdTipoHorario = CASE 
--					WHEN SE.IdSeccion = 1 THEN CAL.TipoHorarioPreescolar 
--					WHEN SE.IdSeccion = 2 THEN CAL.TipoHorarioPrimaria
--					WHEN SE.IdSeccion = 3 THEN CAL.TipoHorarioBachillerato
--				END 
--	AND  CONVERT(VARCHAR(50),TH.NumeroHora)= NVM.CampoTexto4

--LEFT JOIN Horario AS HO
--	ON TH.NumeroHora = HO.Hora 
--	AND HO.IdCurso = CR.IdCurso 
--	AND HO.Dia = cal.NumeroDia

--LEFT JOIN Materia AS MAT
--	ON HO.IdMateria = MAT.Id

--INNER JOIN DOMINIO DOM 
--	ON NVM.ValorDominio = DOM.Valor


WHERE 
	TNM.IdTipoNovedadMedica in(33,34,35,36)
	AND PNM.TipoIdentificacionPersona = @TipoIdentificacion
	AND PNM.NumeroIdentificacionPersona = @NumeroIdentificacion

ORDER BY TNM.IdTipoNovedadMedica asc

