USE portafolio_telecom;

CREATE TABLE Incidencias (

    IdTicket INT PRIMARY KEY,

    Fecha DATE,

    Cliente VARCHAR(100),

    Zona VARCHAR(50),

    TipoFalla VARCHAR(50),

    TiempoResolucionHoras INT

)

INSERT INTO Incidencias VALUES
(1,'2026-01-01','Juan Perez','Lima Norte','Sin Internet',4),
(2,'2026-01-02','Maria Flores','Callao','Fibra Cortada',8),
(3,'2026-01-03','Pedro Ruiz','Lima Centro','Baja Velocidad',2),
(4,'2026-01-04','Ana Torres','Lima Norte','Sin Internet',3),
(5,'2026-01-05','Luis Diaz','Callao','Router Dañado',6);

SELECT * FROM Incidencias;

SHOW DATABASES;

SELECT COUNT(*) AS TotalIncidencias
FROM Incidencias;

SELECT
Zona,
COUNT(*) AS Total
FROM Incidencias
GROUP BY Zona;

SELECT
TipoFalla,
COUNT(*) AS Total
FROM Incidencias
GROUP BY TipoFalla;

SELECT
AVG(TiempoResolucionHoras) AS PromedioHoras
FROM Incidencias;

CREATE TABLE Tecnicos (

    IdTecnico INT PRIMARY KEY,

    NombreTecnico VARCHAR(100),

    Especialidad VARCHAR(50)

);

INSERT INTO Tecnicos VALUES
(1,'Carlos Ramos','Fibra Optica'),
(2,'Luis Torres','Redes'),
(3,'Juan Flores','Soporte'),
(4,'Ana Ruiz','Wireless');

ALTER TABLE Incidencias
ADD IdTecnico INT;

UPDATE Incidencias
SET IdTecnico = 1
WHERE IdTicket = 1;

UPDATE Incidencias
SET IdTecnico = 2
WHERE IdTicket = 2;

UPDATE Incidencias
SET IdTecnico = 3
WHERE IdTicket = 3;

UPDATE Incidencias
SET IdTecnico = 4
WHERE IdTicket = 4;

UPDATE Incidencias
SET IdTecnico = 1
WHERE IdTicket = 5;

SELECT

i.IdTicket,
i.Cliente,
i.TipoFalla,
t.NombreTecnico,
t.Especialidad

FROM Incidencias i

INNER JOIN Tecnicos t
ON i.IdTecnico = t.IdTecnico;

SELECT
t.NombreTecnico,
COUNT(*) AS TotalIncidencias
FROM Incidencias i
INNER JOIN Tecnicos t
ON i.IdTecnico = t.IdTecnico
GROUP BY t.NombreTecnico;

SELECT
t.NombreTecnico,
AVG(i.TiempoResolucionHoras) AS PromedioHoras
FROM Incidencias i
INNER JOIN Tecnicos t
ON i.IdTecnico = t.IdTecnico
GROUP BY t.NombreTecnico;

SELECT
TipoFalla,
COUNT(*) AS Total
FROM Incidencias
GROUP BY TipoFalla
ORDER BY Total DESC;

SELECT * FROM Tecnicos;


