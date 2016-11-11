
SELECT 

CONVERT (VARCHAR(10),NVM.Fecha1,110) AS FechaSesion
,PR.PrimerApellido + ' ' + isNull(PR.SegundoApellido,'') + ' ' + PR.PrimerNombre + ' ' + isNull(PR.SegundoNombre,'')  AS NombrePaciente
,NVM.NombreNovedad
,NVM.ValorDominio
,TNM.Nombre

FROM NovedadMedica  AS NVM
INNER JOIN PersonaNovedadMedica AS PNM 
ON NVM.IdNovedadMedica = PNM.IdNovedadMedica

INNER JOIN Persona AS PR
ON PNM.TipoIdentificacionPersona = PR.TipoIdentificacion 
AND PNM.NumeroIdentificacionPersona = PR.NumeroIdentificacion

INNER JOIN TipoNovedadMedica AS TNM 
ON NVM.IdTipoNovedad = TNM.IdTipoNovedadMedica

INNER JOIN TipoNovedadMedicaPestania AS TNMP
ON TNM.IdTipoNovedadMedica = TNMP.IdTipoNovedadMedica

INNER JOIN Usuario AS USR
ON NvM.UsuarioLog = USR.mail

WHERE 
TNMP.IdPestaniaDashboard =  9

 