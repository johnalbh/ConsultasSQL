SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/********************************************************************
NOMBRE:					dbo.PR_SGS_Rpt_RegistroInscripcionGrupoEstudiante.sql
DESCRIPCIÓN:			Muestra los Grupos a los que esta inscrito un estudiante.
						Reportes de Estudiantes Inscritos a Grupos por Día   
						Devuelve un listado de todos los grupos en los que está inscrito un estudiante en una fecha dada.
PARÁMETROS DE ENTRADA:  @dP_Fecha: Fecha de la consulta 
PARÁMETROS DE SALIDA:   No aplica.  
RESULTADO:				Listado con las siguientes columnas: 
						Seccion, Nivel, Curso, Apellidos, Nombres, Grupo, FechaInicio, FechaFin, Profesor,Inactivo 
						(* si el estudiante está inactivo, vacío si está activo).
						La consulta se entrega ordenada alfabéticamente por apellidos y nombres del estudiante y por nombre del grupo	
CREACIÓN 
REQUERIMIENTO:			Reportes de Transporte
AUTOR:					LLamprea
EMPRESA:				Saint George´s School  
FECHA DE CREACIÓN:		2016-08-27
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
