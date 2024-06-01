CREATE TABLE usuariosDB (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL
);

CREATE TABLE planificacion_sbd (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT,
    semana INT,
    porcentaje DECIMAL(5, 2),
    repeticion VARCHAR(10),
    peso_sentadilla DECIMAL(8, 2),
    peso_banca DECIMAL(8, 2),
    peso_muerto DECIMAL(8, 2),
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id),
    UNIQUE (usuario_id, semana)
);

CREATE TABLE planificacion_smolovjr (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT,
    semana INT,
    dia VARCHAR(10),
    series INT,
    repeticiones INT,
    peso DECIMAL(8, 2),
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id),
    UNIQUE (usuario_id, semana, dia)
);


CREATE TABLE dieta (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT UNIQUE,
    calorias DECIMAL(8, 2),
    proteinas DECIMAL(8, 2),
    grasas DECIMAL(8, 2),
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
);

