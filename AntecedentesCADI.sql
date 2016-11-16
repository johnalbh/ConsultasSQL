declare 
		 @TipoIdentificacion VARCHAR(30) = 'NUIP'
		,@NumeroIdentificacion VARCHAR (30) = '1014881130'
SELECT 

--*

 PR.PrimerApellido + ' ' + isnull(PR.SegundoApellido, '') + ' '  + PR.PrimerNombre + ' ' + isnull (PR.SegundoNombre, '') As NombrePaciente
,PR.FechaNacimiento AS FechaNacimiento
,[dbo].[F_SGS_CalcularEdadAniosMeses] (PR.FechaNacimiento) AS Edad
,DTP.Direccion AS Dirección
,PR.Celular AS Teléfono
,CR.Nombre AS Curso
,MADRE.PrimerApellido + ' ' + isnull(MADRE.SegundoApellido, '') + ' '  + MADRE.PrimerNombre + ' ' + isnull (MADRE.SegundoNombre, '') As NombreMadre
,MADRE.FechaNacimiento AS FechaNacimientoMadre
,MADRE.Celular AS TeléfonoMadre
,PDRMA.Ocupacion AS OcupacionMama
,PADRE.PrimerApellido + ' ' + isnull(PADRE.SegundoApellido, '') + ' '  + PADRE.PrimerNombre + ' ' + isnull (PADRE.SegundoNombre, '') As NombrePadre
,PADRE.FechaNacimiento AS FechaNacimientoPadre
,PADRE.Celular AS TeléfonoPadre
,PDRPA.Ocupacion AS OcupacionPapa
,
FROM NovedadMedica  AS NVM
INNER JOIN PersonaNovedadMedica AS PNM 
ON NVM.IdNovedadMedica = PNM.IdNovedadMedica

INNER JOIN Persona AS PR
ON PNM.TipoIdentificacionPersona = PR.TipoIdentificacion 
AND PNM.NumeroIdentificacionPersona = PR.NumeroIdentificacion

INNER JOIN EstudianteCurso AS ES 
ON PNM.TipoIdentificacionPersona = ES.TipoIdentificacionEstudiante
AND PNM.NumeroIdentificacionPersona = ES.NumeroIdentificacionEstudiante
AND ES.Estado <> 'Retirado'

INNER JOIN Curso as CR
ON ES.IdCurso = CR.IdCurso 

--INNER JOIN Nivel as NV
--ON CR.IdNivel = NV.IdNivel

--INNER JOIN Seccion AS SE
--ON NV.IdSeccion = SE.IdSeccion

INNER JOIN PeriodoLectivo AS PL
ON CR.AnioAcademico = PL.ID
AND PL.AnioActivo = '1'

INNER JOIN GRUPOFAMILIAR AS GF 
ON GF.TipoIdentificacionMiembro = PNM.TipoIdentificacionPersona
AND GF.NumeroIdentificacionMiembro = PNM.NumeroIdentificacionPersona

INNER JOIN FAMILIA AS F
ON F.IdFamilia = GF.IdFamilia 

INNER JOIN DIRECCION AS DTP
ON F.IdFamilia = DTP.IdGrupoFamiliar 
AND DTP.DireccionPrincipal = 1 

INNER JOIN PERSONA AS MADRE 
ON F.TipoDocumentoMadre = MADRE.TipoIdentificacion 
AND F.NumeroDocumentoMadre = MADRE.NumeroIdentificacion 

INNER JOIN PERSONA AS PADRE
ON F.TipoDocumentoPadre = PADRE.TipoIdentificacion 
AND F.NumeroDocumentoPadre = PADRE.NumeroIdentificacion

INNER JOIN PADRE AS PDRMA
ON MADRE.TipoIdentificacion = PDRMA.TIPOIDENTIFICACION
AND MADRE.NumeroIdentificacion = PDRMA.NumeroIdentificacion

INNER JOIN PADRE AS PDRPA
ON PADRE.TipoIdentificacion = PDRPA.TIPOIDENTIFICACION
AND PADRE.NumeroIdentificacion = PDRPA.NumeroIdentificacion

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



--SELECT        (ISNULL(p.PrimerNombre, '') + ' ' + ISNULL(p.SegundoNombre, '') + ' ' + ISNULL(p.PrimerApellido, '') + ' ' + ISNULL(p.SegundoApellido, '')) AS Nombre, c.nombre AS Curso, c.idcurso, c.anioAcademico, 
--                         n.nombre AS Nivel, n.IdNivel, p.celular, p.Numeroidentificacion, p.TipoIdentificacion, d .Direccion, d .TelefonoDireccion, madre.celular AS CelularMadre, padre.celular AS CelularPadre, d .Sector
--FROM            persona p INNER JOIN
--                         grupofamiliar gf ON gf.TipoIdentificacionMiembro = p.TipoIdentificacion AND gf.NumeroIdentificacionMiembro = p.NumeroIdentificacion INNER JOIN
--                         familia f ON f.IdFamilia = gf.IdFamilia INNER JOIN
--                         direccion d ON f.IdFamilia = d .IdGrupoFamiliar AND d .DireccionPrincipal = 1 INNER JOIN
--                         persona madre ON f.TipoDocumentoMadre = madre.TipoIdentificacion AND f.NumeroDocumentoMadre = madre.NumeroIdentificacion INNER JOIN
--                         persona padre ON f.TipoDocumentoPadre = padre.TipoIdentificacion AND f.NumeroDocumentoPadre = padre.NumeroIdentificacion INNER JOIN
--                         EstudianteCurso ec ON ec.TipoIdentificacionEstudiante = p.TipoIdentificacion AND ec.NumeroIdentificacionEstudiante = p.NumeroIdentificacion AND ec.Estado <> 'Retirado' INNER JOIN
--                         curso c ON c.IdCurso = ec.IdCurso INNER JOIN
--                         nivel n ON n.IdNivel = c.IdNivel INNER JOIN
--                         PeriodoLectivo pl ON c.AnioAcademico = pl.id AND pl.AnioActivo = 1
--/*FROM            Estudiante e)*/ 
--UNION
--SELECT        (ISNULL(p.PrimerNombre, '') + ' ' + ISNULL(p.SegundoNombre, '') + ' ' + ISNULL(p.PrimerApellido, '') + ' ' + ISNULL(p.SegundoApellido, '')) AS Nombre, '' AS Curso, NULL AS idCurso, NULL AS AnioAcademico, 
--                         '' AS Nivel, NULL AS IdNivel, p.celular, p.Numeroidentificacion, p.TipoIdentificacion, d .Direccion, d .TelefonoDireccion, '' AS CelularMadre, '' AS CelularPadre, d .Sector
--FROM            persona p INNER JOIN
--                         familia f ON (p.TipoIdentificacion = f.TipoDocumentoPadre AND p.NumeroIdentificacion = f.NumeroDocumentoPadre) OR
--                         (p.TipoIdentificacion = f.TipoDocumentoMadre AND p.NumeroIdentificacion = f.NumeroDocumentoMadre) INNER JOIN
--                         direccion d ON f.IdFamilia = d .IdGrupoFamiliar AND d .DireccionPrincipal = 1
--WHERE        concat(p.TipoIdentificacion, p.NumeroIdentificacion) IN
--                             (SELECT        concat(e.TipoIdentificacion, e.NumeroIdentificacion)
--                               FROM            Empleado e)



SELECT * FROM DOMINIO

INSERT INTO DOMINIO (Dominio, Valor, Descripcion, Criterio, Activo)  VALUES ('TipoReporte', 'CADI', 'CADI', 1,1) 



