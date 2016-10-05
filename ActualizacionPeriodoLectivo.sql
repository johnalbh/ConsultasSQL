/*****************************************************  
	NOMBRE SCRIPT ACTUALIZACIÓN AÑO LECTIVO PREDETERMINADO
	AUTOR: JOHN LÓPEZ
	FECHA: 31/03/2016
	TABLA: PERIODO LECTIVO
*****************************************************/
/*** Año Lectivo Predeterminado 2015 ***************/
Update PeriodoLectivo set AnioActivo = 1 where id = 2
Update PeriodoLectivo set AnioActivo = 0 where id = 3

/*** Año Lectivo Predeterminado 2016 ***************/
Update PeriodoLectivo set AnioActivo = 0 where id = 2
Update PeriodoLectivo set AnioActivo = 1 where id = 3


SELECT * FROM PERIODOLECTIVO