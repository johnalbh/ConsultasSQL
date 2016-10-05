/********************************************************************
NOMBRE:				dbo.ScriptAsignacionPermisosRol.sql
AUTOR:				RLEGUIZAMO	
REQUERIMIENTO:		SP33 - Seguridad
EMPRESA:			Asesoftware S.A.S
FECHA CREACI�N:		15-06-2016
PAR�METROS ENTRADA:	@iP_IdRol INT
EXCEPCIONES:		No Aplica
---------------------------------------------------------------------
MODIFICACI�N:
AUTOR:
REQUERIMIENTO:
EMPRESA:
FECHA MODIFICACI�N:
********************************************************************/
/********************************************************************
--DECLARACI�N DE VARIABLES GLOBALES
********************************************************************/
DECLARE  @iP_IdRol INT = 24
		,@Id_RolMapeo INT = 1;
/********************************************************************
--DECLARACI�N DE VARIABLE TEMPORAL PARA ALMACENAR TODOS LOS PERMISOS
********************************************************************/
DECLARE @TempPermisos TABLE
(
	 Id_Rol INT NULL
	,Id_Funcionalidad INT
	,Permiso VARCHAR(1) NULL
	,Nivel BIT NULL
	,Usuario_Log NVARCHAR(200) NULL
);
/********************************************************************
--INSERCI�N DE REGISTROS DE PERMISOS SOBRE LA TABLA TEMPORAL
********************************************************************/
INSERT INTO @TempPermisos
(Id_Rol,Id_Funcionalidad,Permiso,Nivel,Usuario_Log)
SELECT 
	 @iP_IdRol AS Id_Rol
	,P.Id_Funcionalidad AS Id_Funcionalidad
	,P.Permiso AS Permiso
	,P.Nivel AS Nivel
	,P.Usuario_Log AS Usuario_Log
FROM dbo.Permiso AS P WITH(NOLOCK)
WHERE P.Id_Rol = @Id_RolMapeo;
/********************************************************************
--DESHABILITAR EL TRIGGER TR_SGS_CreacionPermisos PARA QUE SE PERMITA
--CREAR PERMISOS MASIVOS SOBRE UN ROL ESPECIFICADO
********************************************************************/
ALTER TABLE dbo.Funcionalidad DISABLE TRIGGER TR_SGS_CreacionPermisos;
/********************************************************************
--INSERCI�N DE PERMISOS MASIVOS SEG�N ROL ESPECIFICADO
********************************************************************/
INSERT INTO dbo.Permiso
(Id_Rol,Id_Funcionalidad,Permiso,Nivel,Usuario_Log)
SELECT
	 T.Id_Rol AS Id_Rol
	,T.Id_Funcionalidad AS Id_Funcionalidad
	,T.Permiso AS Permiso
	,T.Nivel AS Nivel
	,T.Usuario_Log AS Usuario_Log
FROM @TempPermisos AS T;
/********************************************************************
--HABILITAR EL TRIGGER TR_SGS_CreacionPermisos CULMINADA LA INSERCI�N
********************************************************************/
ALTER TABLE dbo.Funcionalidad ENABLE TRIGGER TR_SGS_CreacionPermisos;
/********************************************************************
--CONSULTAR LOS PERMISOS OTORGADOS PARA EL ROL ESPECIFICADO
********************************************************************/
SELECT 
	 P.Id_Rol AS Id_Rol
	,P.Id_Funcionalidad AS Id_Funcionalidad
	,P.Permiso AS Permiso
	,P.Nivel AS Nivel
	,P.Usuario_Log AS Usuario_Log
FROM dbo.Permiso AS P WITH(NOLOCK)
WHERE P.Id_Rol = @iP_IdRol;






