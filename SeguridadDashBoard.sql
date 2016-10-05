/********************************************************************
NOMBRE:				Actualización Permisos Dashboard SeguridadDashBoard.sql
AUTOR:				JOHN ALBERTO LÓPEZ HERNÁNDEZ	
REQUERIMIENTO:		SP33 - Seguridad
EMPRESA:			Colegio San Jorge de Inglaterra S.A.S
FECHA CREACIÓN:		05-07-2016
PARÁMETROS ENTRADA:	@id_Rol, @Id_Funcionalidad
EXCEPCIONES:		No Aplica
---------------------------------------------------------------------
MODIFICACIÓN:
AUTOR:
REQUERIMIENTO:
EMPRESA:
FECHA MODIFICACIÓN:
********************************************************************/
/******************************************************************/
--BUSQUEDA ID FUNCIONALIDAD Y PERMISO
SELECT 
	 FUN.Id
	,FUN.Nombre
	,Tipo
	,Padre
	,HtmlId
	,Id_Rol
	,ROL.Nombre
	,Permiso
	,Nivel
	,Usuario_Log 
FROM FUNCIONALIDAD AS FUN
JOIN PERMISO AS PER ON
	FUN.ID = PER.ID_FUNCIONALIDAD
JOIN ROL AS ROL ON  
	ROL.ID = PER.ID_ROL 
WHERE FUN.Nombre like('Editar Estudiante%') AND ROL.Nombre like ('Administrador%')
		
/********************************************************************
--APROBAR PERMISOS PARA UN ROL
********************************************************************/
DECLARE  @Id_Rol INT = 1
		,@Id_Funcionalidad INT = 1182
		,@Approve_Permiso VARCHAR(2) = 'D'
UPDATE PERMISO SET Permiso = @Approve_Permiso WHERE ID_ROL = @Id_Rol AND ID_Funcionalidad = @Id_Funcionalidad;

/********************************************************************
--DENEGAR PERMISOS PARA UN ROL
********************************************************************/
DECLARE  @Id_Rol INT = 1
		,@Id_Funcionalidad INT = 1182
		,@Denied_Permiso VARCHAR(2) = 'N';

UPDATE PERMISO SET Permiso = @Denied_Permiso WHERE ID_ROL = @Id_Rol and ID_Funcionalidad = @Id_Funcionalidad;


