/*SENTENCIA Nº4
Mostramos el nombre, apellido y posición de los jugadores del Real Madrid que han metido más de 10 goles y les hayan sacado mas de 80 tarjetas
*/
SELECT j.nombre, j.apellido, j.posicion
FROM jugador j, equipo e, estadisticas_jugador stats
WHERE j.idJugador = stats.idJugador 
AND j.idEquipo = e.idEquipo 
AND e.nombre = 'Real Madrid C.F.' 
AND stats.goles > 10
AND (stats.tarj_amarillas+stats.tarj_amarillas2da+stats.tarj_rojas) > 80;