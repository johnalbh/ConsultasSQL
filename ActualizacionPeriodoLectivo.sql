/*****************************************************  
	NOMBRE SCRIPT ACTUALIZACI�N A�O LECTIVO PREDETERMINADO
	AUTOR: JOHN L�PEZ
	FECHA: 31/03/2016
	TABLA: PERIODO LECTIVO
*****************************************************/
/*** A�o Lectivo Predeterminado 2015 ***************/
Update PeriodoLectivo set AnioActivo = 1 where id = 2
Update PeriodoLectivo set AnioActivo = 0 where id = 3

/*** A�o Lectivo Predeterminado 2016 ***************/
Update PeriodoLectivo set AnioActivo = 0 where id = 2
Update PeriodoLectivo set AnioActivo = 1 where id = 3


SELECT * FROM PERIODOLECTIVO