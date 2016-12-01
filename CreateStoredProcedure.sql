SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/********************************************************************
NOMBRE:					dbo.PR_SGS_Rpt_RegistroInscripcionGrupoEstudiante.sql
DESCRIPCI�N:			Muestra los Grupos a los que esta inscrito un estudiante.
						Reportes de Estudiantes Inscritos a Grupos por D�a   
						Devuelve un listado de todos los grupos en los que est� inscrito un estudiante en una fecha dada.
PAR�METROS DE ENTRADA:  @dP_Fecha: Fecha de la consulta 
PAR�METROS DE SALIDA:   No aplica.  
RESULTADO:				Listado con las siguientes columnas: 
						Seccion, Nivel, Curso, Apellidos, Nombres, Grupo, FechaInicio, FechaFin, Profesor,Inactivo 
						(* si el estudiante est� inactivo, vac�o si est� activo).
						La consulta se entrega ordenada alfab�ticamente por apellidos y nombres del estudiante y por nombre del grupo	
CREACI�N 
REQUERIMIENTO:			Reportes de Transporte
AUTOR:					LLamprea
EMPRESA:				Saint George�s School  
FECHA DE CREACI�N:		2016-08-27
----------------------------------------------------------------------------
****************************************************************************/
ALTER PROCEDURE 
	 [dbo].[PR_SGS_Rpt_RegistroInscripcionGrupoEstudiante] 

		 @dp_Fecha DATE		
		,@Seccion INT
		,@Nivel VARCHAR(60)
		,@Curso VARCHAR (60)

AS
BEGIN



END
GO
