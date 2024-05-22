/*SENTENCIA Nº2
Mostrar las veces que un equipo ha ganado una competición, siempre y cuando lo haya 5 veces o más
*/
SELECT l.nombre, e.nombre, count(*) AS Veces_Ganada FROM equipo e, liga l, participaciones p
WHERE e.idEquipo=p.idEquipo AND l.idLiga=p.idLiga AND p.posicion=1
GROUP BY e.idEquipo, l.idLiga
HAVING Veces_Ganada >= 5
ORDER BY l.nombre ASC,Veces_Ganada DESC;