/*SENTENCIA Nº3
Mostramos el numero de entrenadores, por nacionalidad, que entrenan a equipos ingleses,
ordenandolos de más frecuente a menos frecuente, y por nacionalidad de forma ascendente
*/
SELECT nacionalidad, count(*) AS Numero_Entrenadores FROM Entrenador
WHERE idEquipo IN (
	SELECT idEquipo FROM Equipo
	WHERE cod_Pais = 'ENG')
GROUP BY nacionalidad
ORDER BY Numero_Entrenadores DESC, nacionalidad ASC;