/********************************************************************
NOMBRE:				dbo.ScriptCreacionUsuario.sql
AUTOR:				JOHN ALBERTO L�PEZ 	
EMPRESA:			Colegio San Jorge de Inglaterra
FECHA CREACI�N:		09 de Agosto de 2016
PAR�METROS ENTRADA:	@Nombre VARCHAR, @CorreoElectronico, @City VARCHAR
EXCEPCIONES:		No Aplica
---------------------------------------------------------------------
MODIFICACI�N:
AUTOR:
REQUERIMIENTO:
EMPRESA:
FECHA MODIFICACI�N:
********************************************************************/
USE [SGS]
GO

DECLARE 
		@Nombre VARCHAR (100) = 'Anyi L�pez',
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
