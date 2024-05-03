-- Crea la base de datos si no existe
CREATE DATABASE IF NOT EXISTS mrOlympiaRanking;

-- Selecciona la base de datos
USE mrOlympiaRanking;

-- Tabla para las categorías del Mr. Olympia
CREATE TABLE IF NOT EXISTS Categorias (
    Nombre VARCHAR(50) PRIMARY KEY
);

-- Tabla para los rankings de los competidores
CREATE TABLE IF NOT EXISTS Rankings (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Fecha DATE,
    Categoria VARCHAR(50),
    Posicion INT,
    NombreCompetidor VARCHAR(100),
    CONSTRAINT fk_categoria FOREIGN KEY (Categoria) REFERENCES Categorias(Nombre)
);

-- Inserta las categorías si no existen
INSERT IGNORE INTO Categorias (Nombre) VALUES 
('Open'), 
('Classic'), 
('212'), 
('Physique'), 
('Fitness'), 
('Bikini'), 
('Figure');

-- Inserta los datos de los Mr. Olympia con sus categorías y competidores
INSERT INTO Rankings (Fecha, Categoria, Posicion, NombreCompetidor) VALUES
-- 1965
('1965-01-01', 'Open', 1, 'Larry Scott'),
('1965-01-01', 'Open', 2, 'Harold Poole'),
('1965-01-01', 'Open', 3, 'Earl Maynard'),

-- 1966
('1966-01-01', 'Open', 1, 'Larry Scott'),
('1966-01-01', 'Open', 2, 'Harold Poole'),
('1966-01-01', 'Open', 3, 'Chuck Sipes'),

-- 1967
('1967-01-01', 'Open', 1, 'Sergio Oliva'),
('1967-01-01', 'Open', 2, 'Chuck Sipes'),
('1967-01-01', 'Open', 3, 'Harold Poole'),

-- 1968
('1968-01-01', 'Open', 1, 'Sergio Oliva'),
('1968-01-01', 'Open', 2, 'Arnold Schwarzenegger'),
('1968-01-01', 'Open', 3, 'Harold Poole'),

-- 1969
('1969-01-01', 'Open', 1, 'Sergio Oliva'),
('1969-01-01', 'Open', 2, 'Arnold Schwarzenegger'),
('1969-01-01', 'Open', 3, 'Dennis Tinerino'),

-- 1970
('1970-01-01', 'Open', 1, 'Arnold Schwarzenegger'),
('1970-01-01', 'Open', 2, 'Sergio Oliva'),
('1970-01-01', 'Open', 3, 'Franco Columbu');

-- 1971
('1971-01-01', 'Open', 1, 'Arnold Schwarzenegger'),
('1971-01-01', 'Open', 2, 'Serge Nubret'),
('1971-01-01', 'Open', 3, 'Franco Columbu');

-- 1972
('1972-01-01', 'Open', 1, 'Arnold Schwarzenegger'),
('1972-01-01', 'Open', 2, 'Serge Nubret'),
('1972-01-01', 'Open', 3, 'Sergio Oliva');

-- 1973
('1973-01-01', 'Open', 1, 'Arnold Schwarzenegger'),
('1973-01-01', 'Open', 2, 'Serge Nubret'),
('1973-01-01', 'Open', 3, 'Lou Ferrigno');

-- 1974
('1974-01-01', 'Open', 1, 'Arnold Schwarzenegger'),
('1974-01-01', 'Open', 2, 'Lou Ferrigno'),
('1974-01-01', 'Open', 3, 'Franco Columbu');

-- 1975
('1975-01-01', 'Open', 1, 'Arnold Schwarzenegger'),
('1975-01-01', 'Open', 2, 'Lou Ferrigno'),
('1975-01-01', 'Open', 3, 'Franco Columbu');

-- 1976
('1976-01-01', 'Open', 1, 'Franco Columbu'),
('1976-01-01', 'Open', 2, 'Ken Waller'),
('1976-01-01', 'Open', 3, 'Mike Mentzer');

-- 1977
('1977-01-01', 'Open', 1, 'Frank Zane'),
('1977-01-01', 'Open', 2, 'Kenny Waller'),
('1977-01-01', 'Open', 3, 'Roger Walker');

-- 1978
('1978-01-01', 'Open', 1, 'Frank Zane'),
('1978-01-01', 'Open', 2, 'Chris Dickerson'),
('1978-01-01', 'Open', 3, 'Frank Zane');

-- 1979
('1979-01-01', 'Open', 1, 'Frank Zane'),
('1979-01-01', 'Open', 2, 'Mike Mentzer'),
('1979-01-01', 'Open', 3, 'Robbie Robinson');

-- 1980
('1980-01-01', 'Open', 1, 'Arnold Schwarzenegger'),
('1980-01-01', 'Open', 2, 'Chris Dickerson'),
('1980-01-01', 'Open', 3, 'Franco Columbu');

-- 1981
('1981-01-01', 'Open', 1, 'Franco Columbu'),
('1981-01-01', 'Open', 2, 'Chris Dickerson'),
('1981-01-01', 'Open', 3, 'Tom Platz');

-- 1982
('1982-01-01', 'Open', 1, 'Chris Dickerson'),
('1982-01-01', 'Open', 2, 'Frank Zane'),
('1982-01-01', 'Open', 3, 'Tom Platz');

-- 1983
('1983-01-01', 'Open', 1, 'Samir Bannout'),
('1983-01-01', 'Open', 2, 'Mohammed Makkawy'),
('1983-01-01', 'Open', 3, 'Lee Haney');

-- 1984
('1984-01-01', 'Open', 1, 'Lee Haney'),
('1984-01-01', 'Open', 2, 'Mohammed Makkawy'),
('1984-01-01', 'Open', 3, 'Jusup Wilkosz');

-- 1985
('1985-01-01', 'Open', 1, 'Lee Haney'),
('1985-01-01', 'Open', 2, 'Albert Beckles'),
('1985-01-01', 'Open', 3, 'Rich Gaspari');

-- 1986
('1986-01-01', 'Open', 1, 'Lee Haney'),
('1986-01-01', 'Open', 2, 'Rich Gaspari'),
('1986-01-01', 'Open', 3, 'Mike Christian');

-- 1987
('1987-01-01', 'Open', 1, 'Lee Haney'),
('1987-01-01', 'Open', 2, 'Rich Gaspari'),
('1987-01-01', 'Open', 3, 'Lee Labrada');

-- 1988
('1988-01-01', 'Open', 1, 'Lee Haney'),
('1988-01-01', 'Open', 2, 'Rich Gaspari'),
('1988-01-01', 'Open', 3, 'Mike Christian');

-- 1989
('1989-01-01', 'Open', 1, 'Lee Haney'),
('1989-01-01', 'Open', 2, 'Vince Taylor'),
('1989-01-01', 'Open', 3, 'Rich Gaspari');

-- 1990
('1990-01-01', 'Open', 1, 'Lee Haney'),
('1990-01-01', 'Open', 2, 'Vince Taylor'),
('1990-01-01', 'Open', 3, 'Rich Gaspari');


-- 2024
('2024-01-01', 'Open', 1, 'Brandon Curry'),
('2024-01-01', 'Open', 2, 'Phil Heath'),
('2024-01-01', 'Open', 3, 'Hadi Choopan'),
('2024-01-01', 'Classic', 1, 'Chris Bumstead'),
('2024-01-01', 'Classic', 2, 'Breon Ansley'),
('2024-01-01', 'Classic', 3, 'Terrence Ruffin');
-- Inserta los datos restantes del Mr. Olympia para otros años...
