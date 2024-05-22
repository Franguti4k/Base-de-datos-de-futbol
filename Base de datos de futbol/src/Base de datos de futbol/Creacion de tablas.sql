/*Tabla que representa a un equipo*/
CREATE TABLE `Equipo`(
	/*id del equipo*/
	idEquipo VARCHAR(4) NOT NULL PRIMARY KEY,
    /*Nombre del equipo*/
    nombre VARCHAR(30) NOT NULL UNIQUE,
    /*Codigo de 3 letras para identificar al pais de procedencia del equipo*/
    cod_pais VARCHAR(3) NOT NULL
);

/*Tabla que representa a un jugador*/
CREATE TABLE `Jugador`(
	/*id del jugador*/
	idJugador VARCHAR(4) NOT NULL PRIMARY KEY,
    /*Nombre del jugador*/
    nombre VARCHAR(20) NOT NULL,
    /*Apellidos del jugador*/
    apellido VARCHAR(20) NOT NULL,
    /*Dorsal del jugador*/
    dorsal INT NOT NULL,
    /*Salario del jugador, espresado en millones*/
    salario FLOAT NOT NULL,
    /*Posición del jugador*/
    posicion VARCHAR(20) NOT NULL,
    /*Nacionalidad del jugador*/
    nacionalidad VARCHAR(3) NOT NULL,
    /*id del Equipo al que pertenece*/
    idEquipo VARCHAR(4) NOT NULL
);

/*Tabla que referencia las estadisticas de un jugador*/
CREATE TABLE `Estadisticas_Jugador`(
	/*id del jugador*/
	idJugador VARCHAR(4) NOT NULL,
    /*Goles que ha marcado el jugador*/
    goles INT NOT NULL,
    /*Asistencia que ha dado el jugador*/
    asistencias INT NOT NULL,
    /*Tarjetas amarillas que le han sacado al jugador*/
    tarj_amarillas INT NOT NULL,
    /*2das tarjetas amarillas que le han sacado al jugador*/
    tarj_amarillas2da INT NOT NULL,
    /*Tarjetas rojas que le han sacado al jugador*/
    tarj_rojas INT NOT NULL
);

/*Tabla que representa el historial de un jugador*/
CREATE TABLE `Historial_Jugador`(
	/*id del jugador*/
    idJugador VARCHAR(4) NOT NULL,
    /*id del equipo del que procede,
    si es canterano se pone NULL*/
    Equipo_anterior VARCHAR(4),
    /*Valor que tiene actualmente el jugador*/
    valor_mercado FLOAT NOT NULL
);

/*Tabla que representa a un entrenador*/
CREATE TABLE `Entrenador`(
	/*id del entrenador*/
	idEntrenador VARCHAR(5) NOT NULL PRIMARY KEY,
    /*Nombre del entrenador*/
    nombre VARCHAR(20) NOT NULL,
    /*Apellidos del entrenador*/
    apellidos VARCHAR(20) NOT NULL,
    /*Salario del entrenador, expresado en millones*/
    salario FLOAT NOT NULL,
    /*Nacionalidad del entrenador*/
    nacionalidad VARCHAR(3) NOT NULL,
    /*id del Equipo al que pertence*/
    idEquipo VARCHAR(4) NOT NULL
);

/*Tabla que representa una liga/competicion*/
CREATE TABLE `Liga`(
	/*id de la liga/competicion*/
	idLiga VARCHAR(4) NOT NULL PRIMARY KEY,
    /*Nombre de la liga/competicion*/
    nombre VARCHAR(45) NOT NULL
);

/*Tabla que representa las participaciones de un equipo en una liga/competicion*/
CREATE TABLE `Participaciones`(
	/*Temporada en la que participo en la liga/competicion*/
    temporada VARCHAR(7) NOT NULL,
	/*id del equipo*/
	idEquipo VARCHAR(4) NOT NULL,
    /*id de la liga/competicion*/
    idLiga VARCHAR(4) NOT NULL,
    /*Posicion del equipo en la competicion*/
    posicion INT NOT NULL,
    PRIMARY KEY (temporada,idEquipo,idLiga)
);

/*Crear las relaciones entre las tablas*/
ALTER TABLE `Jugador`
ADD CONSTRAINT fk_equipo FOREIGN KEY (idEquipo) REFERENCES Equipo(idEquipo);
ALTER TABLE `Estadisticas_Jugador`
ADD CONSTRAINT fk_jugador FOREIGN KEY (idJugador) REFERENCES Jugador(idJugador);
ALTER TABLE `Historial_Jugador`
ADD CONSTRAINT fk_player FOREIGN KEY (idJugador) REFERENCES Jugador(idJugador);
ALTER TABLE `Historial_Jugador`
ADD CONSTRAINT fk_anterior FOREIGN KEY (Equipo_anterior) REFERENCES Equipo(idEquipo);
ALTER TABLE `Entrenador`
ADD CONSTRAINT fk_team FOREIGN KEY (idEquipo) REFERENCES Equipo(idEquipo);
ALTER TABLE `Participaciones`
ADD CONSTRAINT fk_participante FOREIGN KEY (idEquipo) REFERENCES Equipo(idEquipo);
ALTER TABLE `Participaciones`
ADD CONSTRAINT fk_competicion FOREIGN KEY (idLiga) REFERENCES Liga(idLiga);
