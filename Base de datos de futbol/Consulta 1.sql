/*SENTENCIA Nº1
Mostramos a la liga; la temporada en la que se jugó,
si es a partir de la temporada 2020-21; y quién gano la competicion
*/
SELECT l.nombre AS Competicion, t.temporada, e.nombre AS Equipo_Ganador FROM equipo e, liga l, participaciones t
WHERE t.temporada LIKE '202%' AND e.idEquipo=t.idEquipo AND l.idLiga=t.idLiga AND t.posicion < 2
ORDER BY l.nombre ASC, t.temporada ASC, t.posicion ASC;
