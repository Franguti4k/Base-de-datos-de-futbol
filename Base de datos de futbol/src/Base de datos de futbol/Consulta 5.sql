/*SENTENCIA Nº5
Mostramos el nombre, apellido del jugador y el equipo que jugó antes de jugar en el actual, si vale en el mercado más de 100 millones de euros
*/
SELECT j.nombre, j.apellido, e.nombre AS Equipo_anterior FROM jugador AS j, equipo AS e
WHERE e.idEquipo = 
	(SELECT h.Equipo_anterior FROM historial_jugador AS h
	WHERE h.idJugador = j.idJugador)
AND j.idJugador IN
	(SELECT h.idJugador FROM historial_jugador AS h
    WHERE h.valor_mercado > 100);