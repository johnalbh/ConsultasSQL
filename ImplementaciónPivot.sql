SELECT 
	P.NumeroIdentificacion AS NumeroIdentificacionPasajero,
	IIF (P.[11] <> 0 AND P.[11] <> 99, 'Si', 'No') AS Manana ,
	IIF (P.[21] <> 0 AND P.[21] <> 99, 'Si', 'No') AS Tarde ,
	IIF ((P.[11] = 0 OR P.[11] = 99) AND (P.[21] = 0 OR P.[21]= 99), 'No Toma Servicio', 'Toma Servicio') AS TomaServicio
FROM 

(
	SELECT
		PRE.NumeroIdentificacionPasajero AS NumeroIdentificacion,
		BR.DominioJornada as DominioJornada,
		BR.DominioNombreRuta
	FROM Estudiante AS EST
 

	INNER JOIN PersonaRuta AS PRE ON
	EST.NumeroIdentificacion = PRE.NumeroIdentificacionPasajero

	INNER JOIN BUSRUTA AS BR ON
	PRE.IdBusRuta = BR.IdBusRuta

	WHERE  
	BR.FechaCalendario = '1900-01-01' 
	and pRE.NumeroIdentificacionPasajero = '00012101864'

) AS S PIVOT (
	max(S.DominioNombreRuta)
	FOR S.DominioJornada in ([11], [21], [22])
) AS P

