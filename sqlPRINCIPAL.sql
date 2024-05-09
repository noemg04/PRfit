CREATE TABLE usuariosDB (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL
);

CREATE TABLE progresiones (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT,
    nombre_progresion VARCHAR(50),
    detalle TEXT,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
);

CREATE TABLE detalles_progresion (
    id INT AUTO_INCREMENT PRIMARY KEY,
    progresion_id INT,
    sesion VARCHAR(50),
    peso DECIMAL(5, 2),
    fecha DATE,
    FOREIGN KEY (progresion_id) REFERENCES progresiones(id)
);