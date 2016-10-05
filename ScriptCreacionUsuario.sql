/********************************************************************
NOMBRE:				dbo.ScriptCreacionUsuario.sql
AUTOR:				JOHN ALBERTO LÓPEZ 	
EMPRESA:			Colegio San Jorge de Inglaterra
FECHA CREACIÓN:		09 de Agosto de 2016
PARÁMETROS ENTRADA:	@Nombre VARCHAR, @CorreoElectronico, @City VARCHAR
EXCEPCIONES:		No Aplica
---------------------------------------------------------------------
MODIFICACIÓN:
AUTOR:
REQUERIMIENTO:
EMPRESA:
FECHA MODIFICACIÓN:
********************************************************************/
USE [SGS]
GO

DECLARE 
		@Nombre VARCHAR (100) = 'Anyi López',
		@CorreoElectronico VARCHAR(100) = 'anyi.lopez@sgs.edu.co',
		@City VARCHAR (100) = 'Bogota';

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
           ( 
		    @CorreoElectronico
           ,@CorreoElectronico
           ,@CorreoElectronico
           ,@City
           ,NULL
           ,NULL
           ,NULL
           ,1
           ,@CorreoElectronico
           ,@CorreoElectronico
           ,@CorreoElectronico
		   )
GO

SELECT * FROM USUARIO
