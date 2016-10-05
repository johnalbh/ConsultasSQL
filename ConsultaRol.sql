SELECT * FROM PERSONA WHERE NUMEROIDENTIFICACION = '51985056' PrimerApellido = 'GALLO' and PrimerNombre = 'IVAN' AND 
UPDATE PERSONA SET USERNAME = 'directorgrupo1@sgs.edu.co' WHERE TIPOIDENTIFICACION = 'CC' AND NUMEROIDENTIFICACION = '51985056'
/* AÑADIR UN USUARIO A LA TABLA USUARIOS */
INSERT INTO [dbo].[Usuario]
           ([objectId]
           ,[displayName]
           ,[mail]
           ,[city]
           ,[streetAddress]
           ,[telephoneNumber]
           ,[mobile]
           ,[accountEnabled]
           ,[userPrincipalName]
           ,[mailNickname]
           ,[UsuarioLog])
     VALUES
           ('directorgrupo1@sgs.edu.co'
           ,'directorgrupo1@sgs.edu.co'
           ,'directorgrupo1@sgs.edu.co'
           ,'Bogotá D.C.'
           ,NULL
           ,NULL
           ,NULL
           ,1
           ,'directorgrupo1@sgs.edu.co'
           ,'directorgrupo1@sgs.edu.co'
           ,'directorgrupo1@sgs.edu.co')
GO
INSERT INTO ROL
	(Nombre
	,TipoRol)

	VALUES 
		('Director Grupo'
		 ,'DIR')
SELECT * FROM ROL
SELECT * FROM PERMISO WHERE ID_Funcionalidad = '1066' aND ID_ROL = '30'
SELECT * FROM USUARIO
	UPDATE PERMISO SET PERMISO = 'D', NIVEL = '1' WHERE ID_ROL = '31' AND ID_FUNCIONALIDAD = '1110'
	UPDATE ROL SET TipoRol = 'DIR' WHERE ID = 31
/* ABREVIATURAS TIPOROL 
		COO	Coordinador
		VIP	VIP
		EST	Estudiante
		PAD	Padres
		DOC	Docentes
		NAN	NoAplica
		DIR	Director
*/
INSERT INTO [dbo].[AsignacionRolUsuario]
           ([IdUsuario]
           ,[IdRol]
           ,[UsuarioLog])
     VALUES
           (314
           ,30
		   ,'Manual')
GO
/*  
   VERIFICIACIÓN DE ESTUDIANTE ASIGNADOS A UN DOCENTE
*/

SELECT DISTINCT 
	 TipoIdentificacionEstudiante
	,NumeroIdentificacionEstudiante
	,PR.PrimerApellido + '' + PR.SegundoApellido + ' ' + PR.PrimerNombre + ' ' + PR.SegundoNombre AS NombreEstudiante  
	,C.Nombre AS Curso
	,C.IdCurso AS id

 FROM MATERIACURSO AS MC
	INNER JOIN ESTUDIANTECURSO AS EC ON
		EC.IDCURSO = MC.IDCURSO 
	INNER JOIN PERSONA AS PR ON 
		PR.TIPOIDENTIFICACION = EC.TIPOIDENTIFICACIONESTUDIANTE AND
		PR.NumeroIdentificacion = EC.NUMEROIDENTIFICACIONESTUDIANTE
	INNER JOIN CURSO AS C ON
		C.IDCURSO = EC.IDCURSO 
WHERE 
	TIPODOCUMENTOPROFESOR = 'CC' AND NUMERODOCUMENTOPROFESOR = '10268255' AND
	ANIOACADEMICO = 2

ORDER BY C.IDCURSO ASC
/*
	VERIFICACIÓN DE ESTUDIANTES AGREGADOS AL DIRECTOR DE GRUPO

*/  
SELECT 
	 TipoIdentificacionEstudiante
	,NumeroIdentificacionEstudiante
	,PR.PrimerApellido + '' + PR.SegundoApellido + ' ' + PR.PrimerNombre + ' ' + PR.SegundoNombre AS NombreEstudiante  
	,CR.Nombre AS Curso
	,CR.IdCurso AS id
FROM  PERSONA AS PR
	INNER JOIN CURSO AS CR ON 
		CR.TIPODOCUMENTODIRECTOR = PR.TIPOIDENTIFICACION AND
		CR.NUMERODOCUMENTODIRECTOR = PR.NUMEROIDENTIFICACION
	INNER JOIN ESTUDIANTECURSO AS EC ON 
		CR.IDCURSO = EC.IDCURSO 
WHERE 
	CR.TIPODOCUMENTODIRECTOR = 'CC' AND CR.NUMERODOCUMENTODIRECTOR = '51985056' AND
	ANIOACADEMICO = 2
/*
	VERIFICACIÓN DE ESTUDAINTES AGREGADOS AL COORDINADOR

*/
SELECT 
	 TipoIdentificacionEstudiante
	,NumeroIdentificacionEstudiante
	,PR.PrimerApellido + '' + PR.SegundoApellido + ' ' + PR.PrimerNombre + ' ' + PR.SegundoNombre AS NombreEstudiante  
	,CR.Nombre AS Curso
	,CR.IdCurso AS id
FROM PERSONA AS PR 
	INNER JOIN EMPLEADOSECCION AS ES ON
	ES.TIPOIDENTIFICACIONEMPLEADO = PR.TIPOIDENTIFICACION AND
	ES.NUMEROIDENTIFICACIONEMPLEADO = PR.NUMEROIDENTIFICACION 
	
	INNER JOIN NIVEL AS NV ON
	NV.IDSECCION = ES.IDSECCION 

	INNER JOIN CURSO AS CR ON
	CR.IDNIVEL = NV.IDNIVEL 

	INNER JOIN ESTUDIANTECURSO AS EC ON
	EC.IDCURSO = CR.IDCURSO

WHERE 
	ES.TipoIdentificacionEmpleado = 'CC' AND
	ES.NumeroIdentificacionEmpleado = '39683779' AND
	CR.ANIOACADEMICO = 2

	SELECT * FROM EMPLEADOSEECUI


	RESTRICCION SELECT * FROM TRANSPORTE

	SELECT * FROM INSTO TRNAPOETRE 


	Hola. Este ere mi query para completar permisos faltantes
insert into permiso select r.id, f.id, 'N', null, 'migracion' from rol r, funcionalidad f where cast (r.id as varchar)+' '+cast (f.id as varchar)
	not in (select cast (p.id_rol as varchar)+' '+cast (p.id_funcionalidad as varchar) from permiso p) 


	SELECT * FRO INSERT PERMISOS  IDFUNMCDIOAN