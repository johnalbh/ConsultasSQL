DECLARE @Id_Programacion INT 
, @SolicitudAdmision VARCHAR(200)
, @AnioAdmision INT
, @Profesional VARCHAR(5)
, @Fonoaudiologia VARCHAR(5)
, @Psicologia VARCHAR(5)
, @TOcupacional VARCHAR(5)
, @Economica VARCHAR(5)
, @COM VARCHAR(5)
, @COP VARCHAR(5)
, @Rector VARCHAR(5)
, @Consejeria VARCHAR(5)
, @Vicerrector VARCHAR(5)
, @JefeConsejeria VARCHAR(5)
, @IndiceG VARCHAR(5)
, @Cognicion VARCHAR(5)
, @MotricidadF VARCHAR(5)
, @LenguajeR VARCHAR(5)
, @Memoria VARCHAR(5)
, @VelocidadP VARCHAR(5)
, @CoordinacionVM VARCHAR(5)
, @MotricidadG VARCHAR(5)
, @LenguajeEE VARCHAR(5)
, @ContadoEval INT

SELECT @SolicitudAdmision = prl.Descripcion , @AnioAdmision = prl.Id FROM dbo.PeriodoLectivo prl WHERE prl.AnioAdmision = 1

SET @Profesional = 'PRO'
SET @Fonoaudiologia = 'FO'
SET @Psicologia = 'PSI'
SET @TOcupacional = 'TO'
SET @Economica = 'EE'
SET @COM = 'COM'
SET @COP = 'COP'
SET @Rector = 'REC'
SET @Consejeria = 'CNJ'
SET @Vicerrector = 'VRC'
SET @JefeConsejeria = 'JFC'
SET @IndiceG = 'IG'
SET @Cognicion = 'C'
SET @MotricidadF = 'MF'
SET @LenguajeR = 'LR'
SET @Memoria = 'M'
SET @VelocidadP = 'V'
SET @CoordinacionVM = 'VM'
SET @MotricidadG = 'MG'
SET @LenguajeEE = 'LE-E'

SET @ContadoEval = 0

DECLARE @ResultadosEvaluaciones TABLE (
		Evaluacion_Id SMALLINT
		,ResultadoEvaluacionPRO DECIMAL(2, 1)
		,ResultadoEvaluacionTO DECIMAL(2, 1)
		,ResultadoEvaluacionFO DECIMAL(2, 1)
		,ResultadoEvaluacionPSI DECIMAL(2, 1)
		,ObservacionPRO VARCHAR(MAX)
		,EvaluadorPRO VARCHAR(200)
		,ObservacionTO VARCHAR(MAX)
		,EvaluadorTO VARCHAR(200)
		,ObservacionFO VARCHAR(MAX)
		,EvaluadorFO VARCHAR(200)
		,ObservacionPSI VARCHAR(MAX)
		,EvaluadorPSI VARCHAR(200)
		)

	INSERT INTO @ResultadosEvaluaciones (Evaluacion_Id)
	SELECT MAX(ASP.Id)
	FROM Evaluacion AS ASP
	WHERE EXISTS (SELECT 1 FROM Admision D WHERE D.FechaDecision = 1776 AND ASP.CODIGO = D.CODIGO)
	GROUP BY Codigo
	
	UPDATE @ResultadosEvaluaciones
    SET ResultadoEvaluacionPRO = C.Calificacion, ObservacionPRO=C.Observacion,EvaluadorPRO=C.Evaluador
    FROM @ResultadosEvaluaciones AS A
    INNER JOIN DetalleEvaluacion AS B ON A.Evaluacion_Id = B.IdEvaluacion
    INNER JOIN CalificacionAspiranteEmpleado AS C ON C.DetalleEvaluacionId = B.Id    
    WHERE C.TipoCalificacion = @Profesional

	UPDATE @ResultadosEvaluaciones
	SET ResultadoEvaluacionTO = C.Calificacion,ObservacionTO=C.Observacion,EvaluadorTO=C.Evaluador
	FROM @ResultadosEvaluaciones AS A
	INNER JOIN DetalleEvaluacion AS B ON A.Evaluacion_Id = B.IdEvaluacion
	INNER JOIN CalificacionAspiranteEmpleado AS C ON C.DetalleEvaluacionId = B.Id 
	WHERE C.TipoCalificacion = @TOcupacional

	UPDATE @ResultadosEvaluaciones
	SET ResultadoEvaluacionFO = C.Calificacion,ObservacionFO=C.Observacion,EvaluadorFO=C.Evaluador
	FROM @ResultadosEvaluaciones AS A
	INNER JOIN DetalleEvaluacion AS B ON A.Evaluacion_Id = B.IdEvaluacion
	INNER JOIN CalificacionAspiranteEmpleado AS C ON C.DetalleEvaluacionId = B.Id 
	WHERE C.TipoCalificacion = @Fonoaudiologia
	
	
	UPDATE @ResultadosEvaluaciones
	SET ResultadoEvaluacionPSI = B.Calificacion,ObservacionPSI=B.ObservacionGeneral,EvaluadorPSI=B.Evaluador
	FROM @ResultadosEvaluaciones AS A
	INNER JOIN EvaluacionPSI AS B ON A.Evaluacion_Id = B.EvaluacionId	
	


	DECLARE @ResultadosEvaluaciones2 Table  
( Codigo int,
  Evaluacion_Id smallint,
  ResultadoEvaluacionIGPT smallint,
  ResultadoEvaluacionCPT smallint,
  ResultadoEvaluacionMFPT smallint,
  ResultadoEvaluacionLRPT smallint,  
  ResultadoEvaluacionMEPT smallint,
  ResultadoEvaluacionVPT smallint,
  ResultadoEvaluacionVMPT SMALLINT,
  ResultadoEvaluacionMGPT SMALLINT,
  ResultadoEvaluacionLEEPT smallint
)

INSERT INTO @ResultadosEvaluaciones2 (Codigo,Evaluacion_Id)
 SELECT asp.Codigo , asp.Id  from Evaluacion asp

UPDATE @ResultadosEvaluaciones2 SET ResultadoEvaluacionIGPT = B.PuntuacionTipica
FROM @ResultadosEvaluaciones2  AS A
INNER JOIN ValorAspecto AS B
ON A.Evaluacion_Id = B.Evaluacion_Id
INNER JOIN Aspecto C
ON B.Aspecto_Id = C.Id
WHERE C.Abreviatura = @IndiceG 

UPDATE @ResultadosEvaluaciones2 SET ResultadoEvaluacionCPT = B.PuntuacionTipica
FROM @ResultadosEvaluaciones2  AS A
INNER JOIN ValorAspecto AS B
ON A.Evaluacion_Id = B.Evaluacion_Id
INNER JOIN Aspecto C
ON B.Aspecto_Id = C.Id
WHERE C.Abreviatura = @Cognicion 

UPDATE @ResultadosEvaluaciones2 SET ResultadoEvaluacionMFPT = B.PuntuacionTipica
FROM @ResultadosEvaluaciones2  AS A
INNER JOIN ValorAspecto AS B
ON A.Evaluacion_Id = B.Evaluacion_Id
INNER JOIN Aspecto C
ON B.Aspecto_Id = C.Id
WHERE C.Abreviatura = @MotricidadF 

UPDATE @ResultadosEvaluaciones2 SET ResultadoEvaluacionLRPT = B.PuntuacionTipica
FROM @ResultadosEvaluaciones2  AS A
INNER JOIN ValorAspecto AS B
ON A.Evaluacion_Id = B.Evaluacion_Id
INNER JOIN Aspecto C
ON B.Aspecto_Id = C.Id
WHERE C.Abreviatura = @LenguajeR 

UPDATE @ResultadosEvaluaciones2 SET ResultadoEvaluacionMEPT = B.PuntuacionTipica
FROM @ResultadosEvaluaciones2  AS A
INNER JOIN ValorAspecto AS B
ON A.Evaluacion_Id = B.Evaluacion_Id
INNER JOIN Aspecto C
ON B.Aspecto_Id = C.Id
WHERE C.Abreviatura = @Memoria 

UPDATE @ResultadosEvaluaciones2 SET ResultadoEvaluacionVPT = B.PuntuacionTipica
FROM @ResultadosEvaluaciones2  AS A
INNER JOIN ValorAspecto AS B
ON A.Evaluacion_Id = B.Evaluacion_Id
INNER JOIN Aspecto C
ON B.Aspecto_Id = C.Id
WHERE C.Abreviatura = @VelocidadP 

UPDATE @ResultadosEvaluaciones2 SET ResultadoEvaluacionVMPT = B.PuntuacionTipica
FROM @ResultadosEvaluaciones2  AS A
INNER JOIN ValorAspecto AS B
ON A.Evaluacion_Id = B.Evaluacion_Id
INNER JOIN Aspecto C
ON B.Aspecto_Id = C.Id
WHERE C.Abreviatura = @CoordinacionVM 

UPDATE @ResultadosEvaluaciones2 SET ResultadoEvaluacionMGPT = B.PuntuacionTipica
FROM @ResultadosEvaluaciones2  AS A
INNER JOIN ValorAspecto AS B
ON A.Evaluacion_Id = B.Evaluacion_Id
INNER JOIN Aspecto C
ON B.Aspecto_Id = C.Id
WHERE C.Abreviatura = @MotricidadG 

UPDATE @ResultadosEvaluaciones2 SET ResultadoEvaluacionLEEPT = B.PuntuacionTipica
FROM @ResultadosEvaluaciones2  AS A
INNER JOIN ValorAspecto AS B
ON A.Evaluacion_Id = B.Evaluacion_Id
INNER JOIN Aspecto C
ON B.Aspecto_Id = C.Id
WHERE C.Abreviatura = @LenguajeEE 

DECLARE 
@ResultadosEvaluacionesPadre Table  ( Codigo int,
  ResultadoEvaluacionCOP Decimal(18,1),
  ResultadoEvaluacionCOM Decimal(18,1),
  ResultadoEvaluacionEE Decimal(18,1),
  ResultadoEvaluacionCNJ Decimal(18,1),
  ResultadoEvaluacionJFC Decimal(18,1),
  ResultadoEvaluacionREC Decimal(18,1),
  ResultadoEvaluacionVRC Decimal(18,1),
  ResultadoEvaluacionI Decimal(18,1) ) 

INSERT INTO @ResultadosEvaluacionesPadre (Codigo)
 SELECT adm.Codigo from Admision adm

UPDATE @ResultadosEvaluacionesPadre SET ResultadoEvaluacionCOP = B.Calificacion
FROM @ResultadosEvaluacionesPadre  AS A
INNER JOIN CalificacionPadresEmpleado AS B
ON A.Codigo = B.Admision_Codigo
WHERE B.TipoCalificacion = @COP

UPDATE @ResultadosEvaluacionesPadre SET ResultadoEvaluacionCOM = B.Calificacion
FROM @ResultadosEvaluacionesPadre  AS A
INNER JOIN CalificacionPadresEmpleado AS B
ON A.Codigo = B.Admision_Codigo
WHERE B.TipoCalificacion = @COM

UPDATE @ResultadosEvaluacionesPadre SET  ResultadoEvaluacionEE = B.Calificacion
FROM @ResultadosEvaluacionesPadre  AS A
INNER JOIN CalificacionPadresEmpleado AS B
ON A.Codigo = B.Admision_Codigo
WHERE B.TipoCalificacion = @Economica

UPDATE @ResultadosEvaluacionesPadre SET ResultadoEvaluacionCNJ = B.Calificacion
FROM @ResultadosEvaluacionesPadre  AS A
INNER JOIN CalificacionPadresEmpleado AS B
ON A.Codigo = B.Admision_Codigo
WHERE B.TipoCalificacion = @Consejeria

UPDATE @ResultadosEvaluacionesPadre SET ResultadoEvaluacionJFC = B.Calificacion
FROM @ResultadosEvaluacionesPadre  AS A
INNER JOIN CalificacionPadresEmpleado AS B
ON A.Codigo = B.Admision_Codigo
WHERE B.TipoCalificacion = @JefeConsejeria

UPDATE @ResultadosEvaluacionesPadre SET ResultadoEvaluacionREC = B.Calificacion
FROM @ResultadosEvaluacionesPadre  AS A
INNER JOIN CalificacionPadresEmpleado AS B
ON A.Codigo = B.Admision_Codigo
WHERE B.TipoCalificacion = @Rector

UPDATE @ResultadosEvaluacionesPadre SET ResultadoEvaluacionVRC = B.Calificacion
FROM @ResultadosEvaluacionesPadre  AS A
INNER JOIN CalificacionPadresEmpleado AS B
ON A.Codigo = B.Admision_Codigo
WHERE B.TipoCalificacion = @Vicerrector

SELECT 'RESUMEN DE RESULTADOS DE EVALUACIÓN DE ASPIRANTES' AS Evento
,'Admisiones para el Período '+ @SolicitudAdmision  AS Periodo
, UPPER(RTRIM(LTRIM(asp.Apellidos)) + ' ' + RTRIM(LTRIM(asp.Nombres))) AS NombreAspirante
, ISNULL(CONVERT(VARCHAR,((ResVal.ResultadoEvaluacionCPT + ResVal.ResultadoEvaluacionMFPT + ResVal.ResultadoEvaluacionLRPT + ResVal.ResultadoEvaluacionMEPT + ResVal.ResultadoEvaluacionVPT + ResVal.ResultadoEvaluacionVMPT))),0) AS SumaPT
, ResVal.ResultadoEvaluacionIGPT AS IG
, ResVal.ResultadoEvaluacionCPT AS C                                   
, ResVal.ResultadoEvaluacionMFPT AS MF
, Resval.ResultadoEvaluacionLRPT AS LR
, ResVal.ResultadoEvaluacionMEPT AS M
, ResVal.ResultadoEvaluacionVPT AS V
, ResVal.ResultadoEvaluacionVMPT AS VM
, ResVal.ResultadoEvaluacionMGPT AS MG
, ResVal.ResultadoEvaluacionLEEPT AS LEE
, ResMR.ResultadoEvaluacionPRO AS PRO
, ResMR.ResultadoEvaluacionTO AS TOC
, ResMR.ResultadoEvaluacionFO AS FO
, ResMR.ResultadoEvaluacionPSI AS PSI
, IIF (ResA.ResultadoEvaluacionCNJ = 0 OR  ResA.ResultadoEvaluacionCNJ IS NULL, 0 , 1 ) 
+ IIF (ResA.ResultadoEvaluacionJFC = 0 OR ResA.ResultadoEvaluacionJFC IS NULL, 0 , 1) 
+ IIF (ResA.ResultadoEvaluacionREC = 0 OR ResA.ResultadoEvaluacionREC IS NULL, 0 , 1) 
+ IIF (ResA.ResultadoEvaluacionVRC = 0 OR ResA.ResultadoEvaluacionVRC IS NULL, 0 , 1) 
+ IIF ((ResA.ResultadoEvaluacionCOP IS NULL OR ResA.ResultadoEvaluacionCOP = 0) AND (ResA.ResultadoEvaluacionCOM IS NULL OR ResA.ResultadoEvaluacionCOM = 0), 0, 1 )
AS SumaEval
, ResA.ResultadoEvaluacionCNJ AS CNJ
, ResA.ResultadoEvaluacionJFC AS JFC
, ResA.ResultadoEvaluacionREC AS REC
, ResA.ResultadoEvaluacionVRC AS VRC
, ResA.ResultadoEvaluacionCOP AS COP
, ResA.ResultadoEvaluacionCOM AS COM
, FORMAT (IIF (ResA.ResultadoEvaluacionCOP = 0 OR ResA.ResultadoEvaluacionCOP IS NULL, ResA.ResultadoEvaluacionCOM, IIF (ResA.ResultadoEvaluacionCOM = 0 OR ResA.ResultadoEvaluacionCOM IS NULL, ResA.ResultadoEvaluacionCOP, (ResA.ResultadoEvaluacionCOP+ResA.ResultadoEvaluacionCOM)/2)), 'n1') AS SumaCor
, ResA.ResultadoEvaluacionEE  AS EE 
, UPPER(adm.Parentesco) AS Parentesco
FROM dbo.Aspirante asp
INNER JOIN dbo.Admision adm ON adm.Aspirante_TipoDocumento = asp.TipoDocumento AND adm.Aspirante_Identificacion = asp.Identificacion
INNER JOIN dbo.Evaluacion EvaP ON EvaP.Codigo = adm.Codigo
INNER JOIN @ResultadosEvaluaciones2 ResVal ON adm.Codigo=ResVal.Codigo AND EvaP.Id=ResVal.Evaluacion_Id
INNER JOIN @ResultadosEvaluaciones ResMR ON EvaP.Id = ResMR.Evaluacion_Id
INNER JOIN @ResultadosEvaluacionesPadre ResA ON ResA.Codigo = adm.Codigo
ORDER BY SumaPT DESC