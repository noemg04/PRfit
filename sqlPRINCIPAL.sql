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
    peso_sentadilla DECIMAL(8, 2),
    peso_banca DECIMAL(8, 2),
    peso_muerto DECIMAL(8, 2),
    FOREIGN KEY (usuario_id) REFERENCES usuariosDB(id)
);


CREATE TABLE dieta (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT,
    calorias DECIMAL(8, 2),
    proteinas DECIMAL(8, 2),
    grasas DECIMAL(8, 2),
    FOREIGN KEY (usuario_id) REFERENCES usuariosDB(id)
);

