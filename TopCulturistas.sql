-- Crea la base de datos si no existe
CREATE DATABASE IF NOT EXISTS topRanking;

-- Selecciona la base de datos
USE topRanking;

-- Tabla para las categorías del Mr. Olympia
CREATE TABLE IF NOT EXISTS mrOcategorias (
    Nombre VARCHAR(50) PRIMARY KEY
);

-- Tabla para los rankings de los competidores
CREATE TABLE IF NOT EXISTS mrOranking (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Fecha DATE,
    Categoria VARCHAR(50),
    Posicion INT,
    NombreCompetidor VARCHAR(100),
    EnlaceWikipedia VARCHAR(255),
    CONSTRAINT fk_categoria FOREIGN KEY (Categoria) REFERENCES mrOcategorias(Nombre)
);

-- Powerlifters
CREATE TABLE IF NOT EXISTS ipfRanking (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Fecha DATE,
    Posicion INT,
    NombreCompetidor VARCHAR(100)
);

-- Inserta las categorías si no existen
INSERT IGNORE INTO mrOcategorias (Nombre) VALUES 
('Open'), 
('Classic'),
('202'),
('212'),
('Bikini'),
('Mens');

-- Inserta los datos de los Mr. Olympia con sus categorías y competidores
INSERT INTO mrOranking (Fecha, Categoria, Posicion, NombreCompetidor, EnlaceWikipedia) VALUES
-- 1965
('1965-01-01', 'Open', 1, 'Larry Scott', 'https://en.wikipedia.org/wiki/Larry_Scott_(bodybuilder)'),
('1965-01-01', 'Open', 2, 'Harold Poole', 'https://en.wikipedia.org/wiki/Harold_Poole'),
('1965-01-01', 'Open', 3, 'Earl Maynard', 'https://en.wikipedia.org/wiki/Earl_Maynard'),

-- 1966
('1966-01-01', 'Open', 1, 'Larry Scott', 'https://en.wikipedia.org/wiki/Larry_Scott_(bodybuilder)'),
('1966-01-01', 'Open', 2, 'Harold Poole', 'https://en.wikipedia.org/wiki/Harold_Poole'),
('1966-01-01', 'Open', 3, 'Chuck Sipes', 'https://en.wikipedia.org/wiki/Chuck_Sipes'),

-- 1967
('1967-01-01', 'Open', 1, 'Sergio Oliva', 'https://en.wikipedia.org/wiki/Sergio_Oliva'),
('1967-01-01', 'Open', 2, 'Harold Poole', 'https://en.wikipedia.org/wiki/Harold_Poole'),
('1967-01-01', 'Open', 3, 'Chuck Sipes', 'https://en.wikipedia.org/wiki/Chuck_Sipes'),

-- 1968
('1968-01-01', 'Open', 1, 'Sergio Oliva', 'https://en.wikipedia.org/wiki/Sergio_Oliva'),
('1968-01-01', 'Open', 2, 'Chuck Sipes', 'https://en.wikipedia.org/wiki/Chuck_Sipes'),
('1968-01-01', 'Open', 3, 'Roy Callender', NULL),

-- 1969
('1969-01-01', 'Open', 1, 'Sergio Oliva', 'https://en.wikipedia.org/wiki/Sergio_Oliva'),
('1969-01-01', 'Open', 2, 'Arnold Schwarzenegger', 'https://en.wikipedia.org/wiki/Arnold_Schwarzenegger'),
('1969-01-01', 'Open', 3, 'Roy Callender', NULL),

-- 1970
('1970-01-01', 'Open', 1, 'Arnold Schwarzenegger', 'https://en.wikipedia.org/wiki/Arnold_Schwarzenegger'),
('1970-01-01', 'Open', 2, 'Sergio Oliva', 'https://en.wikipedia.org/wiki/Sergio_Oliva'),
('1970-01-01', 'Open', 3, 'Reg Park', 'https://en.wikipedia.org/wiki/Reg_Park'),

-- 1971
('1971-01-01', 'Open', 1, 'Arnold Schwarzenegger', 'https://en.wikipedia.org/wiki/Arnold_Schwarzenegger'),
('1971-01-01', 'Open', 2, 'Franco Columbu', 'https://en.wikipedia.org/wiki/Franco_Columbu'),
('1971-01-01', 'Open', 3, 'Sergio Oliva', 'https://en.wikipedia.org/wiki/Sergio_Oliva'),

-- 1972
('1972-01-01', 'Open', 1, 'Arnold Schwarzenegger', 'https://en.wikipedia.org/wiki/Arnold_Schwarzenegger'),
('1972-01-01', 'Open', 2, 'Sergio Oliva', 'https://en.wikipedia.org/wiki/Sergio_Oliva'),
('1972-01-01', 'Open', 3, 'Serge Nubret', 'https://en.wikipedia.org/wiki/Serge_Nubret'),

-- 1973
('1973-01-01', 'Open', 1, 'Arnold Schwarzenegger', 'https://en.wikipedia.org/wiki/Arnold_Schwarzenegger'),
('1973-01-01', 'Open', 2, 'Sergio Oliva', 'https://en.wikipedia.org/wiki/Sergio_Oliva'),
('1973-01-01', 'Open', 3, 'Franco Columbu', 'https://en.wikipedia.org/wiki/Franco_Columbu'),

-- 1974
('1974-01-01', 'Open', 1, 'Arnold Schwarzenegger', 'https://en.wikipedia.org/wiki/Arnold_Schwarzenegger'),
('1974-01-01', 'Open', 2, 'Lou Ferrigno', 'https://en.wikipedia.org/wiki/Lou_Ferrigno'),
('1974-01-01', 'Open', 3, 'Serge Nubret', 'https://en.wikipedia.org/wiki/Serge_Nubret'),

-- 1975
('1975-01-01', 'Open', 1, 'Arnold Schwarzenegger', 'https://en.wikipedia.org/wiki/Arnold_Schwarzenegger'),
('1975-01-01', 'Open', 2, 'Serge Nubret', 'https://en.wikipedia.org/wiki/Serge_Nubret'),
('1975-01-01', 'Open', 3, 'Lou Ferrigno', 'https://en.wikipedia.org/wiki/Lou_Ferrigno'),

-- 1976
('1976-01-01', 'Open', 1, 'Franco Columbu', 'https://en.wikipedia.org/wiki/Franco_Columbu'),
('1976-01-01', 'Open', 2, 'Frank Zane', 'https://en.wikipedia.org/wiki/Frank_Zane'),
('1976-01-01', 'Open', 3, 'Boyko Georgiev', NULL),

-- 1977
('1977-01-01', 'Open', 1, 'Frank Zane', 'https://en.wikipedia.org/wiki/Frank_Zane'),
('1977-01-01', 'Open', 2, 'Robbie Robinson', 'https://en.wikipedia.org/wiki/Robbie_Robinson_(bodybuilder)'),
('1977-01-01', 'Open', 3, 'Ed Corney', NULL),

-- 1978
('1978-01-01', 'Open', 1, 'Frank Zane', 'https://en.wikipedia.org/wiki/Frank_Zane'),
('1978-01-01', 'Open', 2, 'Robbie Robinson', 'https://en.wikipedia.org/wiki/Robbie_Robinson_(bodybuilder)'),
('1978-01-01', 'Open', 3, 'Boyko Georgiev', NULL),

-- 1979
('1979-01-01', 'Open', 1, 'Frank Zane', 'https://en.wikipedia.org/wiki/Frank_Zane'),
('1979-01-01', 'Open', 2, 'Mike Mentzer', 'https://en.wikipedia.org/wiki/Mike_Mentzer'),
('1979-01-01', 'Open', 3, 'Boyko Georgiev', NULL),

-- 1980
('1980-01-01', 'Open', 1, 'Arnold Schwarzenegger', 'https://en.wikipedia.org/wiki/Arnold_Schwarzenegger'),
('1980-01-01', 'Open', 2, 'Chris Dickerson', 'https://en.wikipedia.org/wiki/Chris_Dickerson_(bodybuilder)'),
('1980-01-01', 'Open', 3, 'Frank Zane', 'https://en.wikipedia.org/wiki/Frank_Zane'),

-- 1981
('1981-01-01', 'Open', 1, 'Franco Columbu', 'https://en.wikipedia.org/wiki/Franco_Columbu'),
('1981-01-01', 'Open', 2, 'Chris Dickerson', 'https://en.wikipedia.org/wiki/Chris_Dickerson_(bodybuilder)'),
('1981-01-01', 'Open', 3, 'Tom Platz', 'https://en.wikipedia.org/wiki/Tom_Platz'),

-- 1982
('1982-01-01', 'Open', 1, 'Chris Dickerson', 'https://en.wikipedia.org/wiki/Chris_Dickerson_(bodybuilder)'),
('1982-01-01', 'Open', 2, 'Frank Zane', 'https://en.wikipedia.org/wiki/Frank_Zane'),
('1982-01-01', 'Open', 3, 'Casey Viator', NULL),

-- 1983
('1983-01-01', 'Open', 1, 'Samir Bannout', 'https://en.wikipedia.org/wiki/Samir_Bannout'),
('1983-01-01', 'Open', 2, 'Mohammed Makkawy', 'https://en.wikipedia.org/wiki/Mohammed_Makkawy'),
('1983-01-01', 'Open', 3, 'Frank Zane', 'https://en.wikipedia.org/wiki/Frank_Zane'),

-- 1984
('1984-01-01', 'Open', 1, 'Lee Haney', 'https://en.wikipedia.org/wiki/Lee_Haney'),
('1984-01-01', 'Open', 2, 'Mohammed Makkawy', 'https://en.wikipedia.org/wiki/Mohammed_Makkawy'),
('1984-01-01', 'Open', 3, 'John Terilli', NULL),

-- 1985
('1985-01-01', 'Open', 1, 'Lee Haney', 'https://en.wikipedia.org/wiki/Lee_Haney'),
('1985-01-01', 'Open', 2, 'Albert Beckles', 'https://en.wikipedia.org/wiki/Albert_Beckles'),
('1985-01-01', 'Open', 3, 'Rich Gaspari', 'https://en.wikipedia.org/wiki/Rich_Gaspari'),

-- 1986
('1986-01-01', 'Open', 1, 'Lee Haney', 'https://en.wikipedia.org/wiki/Lee_Haney'),
('1986-01-01', 'Open', 2, 'Rich Gaspari', 'https://en.wikipedia.org/wiki/Rich_Gaspari'),
('1986-01-01', 'Open', 3, 'Mike Christian', 'https://en.wikipedia.org/wiki/Mike_Christian'),

-- 1987
('1987-01-01', 'Open', 1, 'Lee Haney', 'https://en.wikipedia.org/wiki/Lee_Haney'),
('1987-01-01', 'Open', 2, 'Rich Gaspari', 'https://en.wikipedia.org/wiki/Rich_Gaspari'),
('1987-01-01', 'Open', 3, 'Lee Labrada', 'https://en.wikipedia.org/wiki/Lee_Labrada'),

-- 1988
('1988-01-01', 'Open', 1, 'Lee Haney', 'https://en.wikipedia.org/wiki/Lee_Haney'),
('1988-01-01', 'Open', 2, 'Rich Gaspari', 'https://en.wikipedia.org/wiki/Rich_Gaspari'),
('1988-01-01', 'Open', 3, 'Lee Labrada', 'https://en.wikipedia.org/wiki/Lee_Labrada'),

-- 1989
('1989-01-01', 'Open', 1, 'Lee Haney', 'https://en.wikipedia.org/wiki/Lee_Haney'),
('1989-01-01', 'Open', 2, 'Lee Labrada', 'https://en.wikipedia.org/wiki/Lee_Labrada'),
('1989-01-01', 'Open', 3, 'Vince Taylor', 'https://en.wikipedia.org/wiki/Vince_Taylor'),

-- 1990
('1990-01-01', 'Open', 1, 'Lee Haney', 'https://en.wikipedia.org/wiki/Lee_Haney'),
('1990-01-01', 'Open', 2, 'Lee Labrada', 'https://en.wikipedia.org/wiki/Lee_Labrada'),
('1990-01-01', 'Open', 3, 'Shawn Ray', 'https://en.wikipedia.org/wiki/Shawn_Ray'),

-- 1991
('1991-01-01', 'Open', 1, 'Lee Haney', 'https://en.wikipedia.org/wiki/Lee_Haney'),
('1991-01-01', 'Open', 2, 'Dorian Yates', 'https://en.wikipedia.org/wiki/Dorian_Yates'),
('1991-01-01', 'Open', 3, 'Vince Taylor', 'https://en.wikipedia.org/wiki/Vince_Taylor'),

-- 1992
('1992-01-01', 'Open', 1, 'Dorian Yates', 'https://en.wikipedia.org/wiki/Dorian_Yates'),
('1992-01-01', 'Open', 2, 'Kevin Levrone', 'https://en.wikipedia.org/wiki/Kevin_Levrone'),
('1992-01-01', 'Open', 3, 'Lee Labrada', 'https://en.wikipedia.org/wiki/Lee_Labrada'),

-- 1993
('1993-01-01', 'Open', 1, 'Dorian Yates', 'https://en.wikipedia.org/wiki/Dorian_Yates'),
('1993-01-01', 'Open', 2, 'Flex Wheeler', 'https://en.wikipedia.org/wiki/Flex_Wheeler'),
('1993-01-01', 'Open', 3, 'Shawn Ray', 'https://en.wikipedia.org/wiki/Shawn_Ray'),

-- 1994
('1994-01-01', 'Open', 1, 'Dorian Yates', 'https://en.wikipedia.org/wiki/Dorian_Yates'),
('1994-01-01', 'Open', 2, 'Shawn Ray', 'https://en.wikipedia.org/wiki/Shawn_Ray'),
('1994-01-01', 'Open', 3, 'Kevin Levrone', 'https://en.wikipedia.org/wiki/Kevin_Levrone'),

-- 1995
('1995-01-01', 'Open', 1, 'Dorian Yates', 'https://en.wikipedia.org/wiki/Dorian_Yates'),
('1995-01-01', 'Open', 2, 'Kevin Levrone', 'https://en.wikipedia.org/wiki/Kevin_Levrone'),
('1995-01-01', 'Open', 3, 'Nasser El Sonbaty', 'https://en.wikipedia.org/wiki/Nasser_El_Sonbaty'),

-- 1996
('1996-01-01', 'Open', 1, 'Dorian Yates', 'https://en.wikipedia.org/wiki/Dorian_Yates'),
('1996-01-01', 'Open', 2, 'Kevin Levrone', 'https://en.wikipedia.org/wiki/Kevin_Levrone'),
('1996-01-01', 'Open', 3, 'Shawn Ray', 'https://en.wikipedia.org/wiki/Shawn_Ray'),

-- 1997
('1997-01-01', 'Open', 1, 'Dorian Yates', 'https://en.wikipedia.org/wiki/Dorian_Yates'),
('1997-01-01', 'Open', 2, 'Nasser El Sonbaty', 'https://en.wikipedia.org/wiki/Nasser_El_Sonbaty'),
('1997-01-01', 'Open', 3, 'Shawn Ray', 'https://en.wikipedia.org/wiki/Shawn_Ray'),

-- 1998
('1998-01-01', 'Open', 1, 'Ronnie Coleman', 'https://en.wikipedia.org/wiki/Ronnie_Coleman'),
('1998-01-01', 'Open', 2, 'Flex Wheeler', 'https://en.wikipedia.org/wiki/Flex_Wheeler'),
('1998-01-01', 'Open', 3, 'Nasser El Sonbaty', 'https://en.wikipedia.org/wiki/Nasser_El_Sonbaty'),

-- 1999
('1999-01-01', 'Open', 1, 'Ronnie Coleman', 'https://en.wikipedia.org/wiki/Ronnie_Coleman'),
('1999-01-01', 'Open', 2, 'Flex Wheeler', 'https://en.wikipedia.org/wiki/Flex_Wheeler'),
('1999-01-01', 'Open', 3, 'Chris Cormier', 'https://en.wikipedia.org/wiki/Chris_Cormier'),

-- 2000
('2000-01-01', 'Open', 1, 'Ronnie Coleman', 'https://en.wikipedia.org/wiki/Ronnie_Coleman'),
('2000-01-01', 'Open', 2, 'Kevin Levrone', 'https://en.wikipedia.org/wiki/Kevin_Levrone'),
('2000-01-01', 'Open', 3, 'Flex Wheeler', 'https://en.wikipedia.org/wiki/Flex_Wheeler'),

-- 2001
('2001-01-01', 'Open', 1, 'Ronnie Coleman', 'https://en.wikipedia.org/wiki/Ronnie_Coleman'),
('2001-01-01', 'Open', 2, 'Jay Cutler', 'https://en.wikipedia.org/wiki/Jay_Cutler_(bodybuilder)'),
('2001-01-01', 'Open', 3, 'Kevin Levrone', 'https://en.wikipedia.org/wiki/Kevin_Levrone'),

-- 2002
('2002-01-01', 'Open', 1, 'Ronnie Coleman', 'https://en.wikipedia.org/wiki/Ronnie_Coleman'),
('2002-01-01', 'Open', 2, 'Kevin Levrone', 'https://en.wikipedia.org/wiki/Kevin_Levrone'),
('2002-01-01', 'Open', 3, 'Chris Cormier', 'https://en.wikipedia.org/wiki/Chris_Cormier'),

-- 2003
('2003-01-01', 'Open', 1, 'Ronnie Coleman', 'https://en.wikipedia.org/wiki/Ronnie_Coleman'),
('2003-01-01', 'Open', 2, 'Jay Cutler', 'https://en.wikipedia.org/wiki/Jay_Cutler_(bodybuilder)'),
('2003-01-01', 'Open', 3, 'Dexter Jackson', 'https://en.wikipedia.org/wiki/Dexter_Jackson_(bodybuilder)'),

-- 2004
('2004-01-01', 'Open', 1, 'Ronnie Coleman', 'https://en.wikipedia.org/wiki/Ronnie_Coleman'),
('2004-01-01', 'Open', 2, 'Jay Cutler', 'https://en.wikipedia.org/wiki/Jay_Cutler_(bodybuilder)'),
('2004-01-01', 'Open', 3, 'Gustavo Badell', 'https://en.wikipedia.org/wiki/Gustavo_Badell'),

-- 2005
('2005-01-01', 'Open', 1, 'Ronnie Coleman', 'https://en.wikipedia.org/wiki/Ronnie_Coleman'),
('2005-01-01', 'Open', 2, 'Jay Cutler', 'https://en.wikipedia.org/wiki/Jay_Cutler_(bodybuilder)'),
('2005-01-01', 'Open', 3, 'Gustavo Badell', 'https://en.wikipedia.org/wiki/Gustavo_Badell'),

-- 2006
('2006-01-01', 'Open', 1, 'Jay Cutler', 'https://en.wikipedia.org/wiki/Jay_Cutler_(bodybuilder)'),
('2006-01-01', 'Open', 2, 'Ronnie Coleman', 'https://en.wikipedia.org/wiki/Ronnie_Coleman'),
('2006-01-01', 'Open', 3, 'Victor Martinez', 'https://en.wikipedia.org/wiki/Victor_Martinez_(bodybuilder)'),

-- 2007
('2007-01-01', 'Open', 1, 'Jay Cutler', 'https://en.wikipedia.org/wiki/Jay_Cutler_(bodybuilder)'),
('2007-01-01', 'Open', 2, 'Victor Martinez', 'https://en.wikipedia.org/wiki/Victor_Martinez_(bodybuilder)'),
('2007-01-01', 'Open', 3, 'Dexter Jackson', 'https://en.wikipedia.org/wiki/Dexter_Jackson_(bodybuilder)'),

-- 2008
('2008-01-01', 'Open', 1, 'Dexter Jackson', 'https://en.wikipedia.org/wiki/Dexter_Jackson_(bodybuilder)'),
('2008-01-01', 'Open', 2, 'Jay Cutler', 'https://en.wikipedia.org/wiki/Jay_Cutler_(bodybuilder)'),
('2008-01-01', 'Open', 3, 'Phil Heath', 'https://en.wikipedia.org/wiki/Phil_Heath'),
('2008-01-01', '202', 1, 'David Henry', 'https://en.wikipedia.org/wiki/David_Henry_(bodybuilder)'),
('2008-01-01', '202', 2, 'Kevin English', 'https://en.wikipedia.org/wiki/Kevin_English'),
('2008-01-01', '202', 3, 'James Flex Lewis', 'https://en.wikipedia.org/wiki/James_Lewis_(bodybuilder)'),

-- 2009
('2009-01-01', 'Open', 1, 'Jay Cutler', 'https://en.wikipedia.org/wiki/Jay_Cutler_(bodybuilder)'),
('2009-01-01', 'Open', 2, 'Branch Warren', 'https://en.wikipedia.org/wiki/Branch_Warren'),
('2009-01-01', 'Open', 3, 'Dexter Jackson', 'https://en.wikipedia.org/wiki/Dexter_Jackson_(bodybuilder)'),
('2009-01-01', '202', 1, 'Kevin English', 'https://en.wikipedia.org/wiki/Kevin_English'),
('2009-01-01', '202', 2, 'David Henry', 'https://en.wikipedia.org/wiki/David_Henry_(bodybuilder)'),
('2009-01-01', '202', 3, 'Richard Jackson', 'https://en.wikipedia.org/wiki/Richard_Jackson_(bodybuilder)'),

-- 2010
('2010-01-01', 'Open', 1, 'Jay Cutler', 'https://en.wikipedia.org/wiki/Jay_Cutler_(bodybuilder)'),
('2010-01-01', 'Open', 2, 'Phil Heath', 'https://en.wikipedia.org/wiki/Phil_Heath'),
('2010-01-01', 'Open', 3, 'Branch Warren', 'https://en.wikipedia.org/wiki/Branch_Warren'),
('2010-01-01', '202', 1, 'Kevin English', 'https://en.wikipedia.org/wiki/Kevin_English'),
('2010-01-01', '202', 2, 'David Henry', 'https://en.wikipedia.org/wiki/David_Henry_(bodybuilder)'),
('2010-01-01', '202', 3, 'Eduardo Correa', 'https://en.wikipedia.org/wiki/Eduardo_Correa'),

-- Introducción de la categoría Bikini en 2010
('2010-01-01', 'Bikini', 1, 'Sonia Gonzales', 'https://en.wikipedia.org/wiki/Sonia_Gonzalez'),
('2010-01-01', 'Bikini', 2, 'Nathalia Melo', 'https://en.wikipedia.org/wiki/Nathalia_Melo'),
('2010-01-01', 'Bikini', 3, 'Amanda Latona', 'https://en.wikipedia.org/wiki/Amanda_Latona'),

-- 2011
('2011-01-01', 'Open', 1, 'Phil Heath', 'https://en.wikipedia.org/wiki/Phil_Heath'),
('2011-01-01', 'Open', 2, 'Jay Cutler', 'https://en.wikipedia.org/wiki/Jay_Cutler_(bodybuilder)'),
('2011-01-01', 'Open', 3, 'Kai Greene', 'https://en.wikipedia.org/wiki/Kai_Greene'),
('2011-01-01', '202', 1, 'Kevin English', 'https://en.wikipedia.org/wiki/Kevin_English'),
('2011-01-01', '202', 2, 'James Flex Lewis', 'https://en.wikipedia.org/wiki/James_Lewis_(bodybuilder)'),
('2011-01-01', '202', 3, 'Jose Raymond', 'https://en.wikipedia.org/wiki/Jose_Raymond_(bodybuilder)'),
('2011-01-01', 'Bikini', 1, 'Nicole Nagrani', 'https://en.wikipedia.org/wiki/Nicole_Nagrani'),
('2011-01-01', 'Bikini', 2, 'Nathalia Melo', 'https://en.wikipedia.org/wiki/Nathalia_Melo'),
('2011-01-01', 'Bikini', 3, 'Dianna Dahlgren', 'https://en.wikipedia.org/wiki/Dianna_Dahlgren'),

-- 2012
('2012-01-01', 'Open', 1, 'Phil Heath', 'https://en.wikipedia.org/wiki/Phil_Heath'),
('2012-01-01', 'Open', 2, 'Kai Greene', 'https://en.wikipedia.org/wiki/Kai_Greene'),
('2012-01-01', 'Open', 3, 'Shawn Rhoden', 'https://en.wikipedia.org/wiki/Shawn_Rhoden'),
('2012-01-01', '212', 1, 'James Flex Lewis', 'https://en.wikipedia.org/wiki/James_Lewis_(bodybuilder)'),
('2012-01-01', '212', 2, 'David Henry', 'https://en.wikipedia.org/wiki/David_Henry_(bodybuilder)'),
('2012-01-01', '212', 3, 'Eduardo Correa', 'https://en.wikipedia.org/wiki/Eduardo_Correa'),
('2012-01-01', 'Bikini', 1, 'Nathalia Melo', 'https://en.wikipedia.org/wiki/Nathalia_Melo'),
('2012-01-01', 'Bikini', 2, 'Nicole Nagrani', 'https://en.wikipedia.org/wiki/Nicole_Nagrani'),
('2012-01-01', 'Bikini', 3, 'India Paulino', 'https://en.wikipedia.org/wiki/India_Paulino'),

-- 2013
('2013-01-01', 'Open', 1, 'Phil Heath', 'https://en.wikipedia.org/wiki/Phil_Heath'),
('2013-01-01', 'Open', 2, 'Kai Greene', 'https://en.wikipedia.org/wiki/Kai_Greene'),
('2013-01-01', 'Open', 3, 'Dennis Wolf', 'https://en.wikipedia.org/wiki/Dennis_Wolf_(bodybuilder)'),
('2013-01-01', '212', 1, 'James Flex Lewis', 'https://en.wikipedia.org/wiki/James_Lewis_(bodybuilder)'),
('2013-01-01', '212', 2, 'David Henry', 'https://en.wikipedia.org/wiki/David_Henry_(bodybuilder)'),
('2013-01-01', '212', 3, 'Kevin English', 'https://en.wikipedia.org/wiki/Kevin_English'),
('2013-01-01', 'Bikini', 1, 'Ashley Kaltwasser', 'https://en.wikipedia.org/wiki/Ashley_Kaltwasser'),
('2013-01-01', 'Bikini', 2, 'Yeshaira Robles', 'https://en.wikipedia.org/wiki/Yeshaira_Robles'),
('2013-01-01', 'Bikini', 3, 'Stacey Alexander', 'https://en.wikipedia.org/wiki/Stacey_Alexander_(bodybuilder)'),
('2013-01-01', 'Mens', 1, 'Mark Anthony Wingson', 'https://en.wikipedia.org/wiki/Mark_Anthony_Wingson'),
('2013-01-01', 'Mens', 2, 'Jeremy Buendia', 'https://en.wikipedia.org/wiki/Jeremy_Buendia'),
('2013-01-01', 'Mens', 3, 'Sadik Hadzovic', 'https://en.wikipedia.org/wiki/Sadik_Hadzovic'),

-- 2014
('2014-01-01', 'Open', 1, 'Phil Heath', 'https://en.wikipedia.org/wiki/Phil_Heath'),
('2014-01-01', 'Open', 2, 'Kai Greene', 'https://en.wikipedia.org/wiki/Kai_Greene'),
('2014-01-01', 'Open', 3, 'Shawn Rhoden', 'https://en.wikipedia.org/wiki/Shawn_Rhoden'),
('2014-01-01', '212', 1, 'James Flex Lewis', 'https://en.wikipedia.org/wiki/James_Lewis_(bodybuilder)'),
('2014-01-01', '212', 2, 'Eduardo Correa', 'https://en.wikipedia.org/wiki/Eduardo_Correa'),
('2014-01-01', '212', 3, 'Jose Raymond', 'https://en.wikipedia.org/wiki/Jose_Raymond_(bodybuilder)'),
('2014-01-01', 'Bikini', 1, 'Ashley Kaltwasser', 'https://en.wikipedia.org/wiki/Ashley_Kaltwasser'),
('2014-01-01', 'Bikini', 2, 'Janet Layug', 'https://en.wikipedia.org/wiki/Janet_Layug'),
('2014-01-01', 'Bikini', 3, 'Stacey Alexander', 'https://en.wikipedia.org/wiki/Stacey_Alexander_(bodybuilder)'),
('2014-01-01', 'Mens', 1, 'Jeremy Buendia', 'https://en.wikipedia.org/wiki/Jeremy_Buendia'),
('2014-01-01', 'Mens', 2, 'Sadik Hadzovic', 'https://en.wikipedia.org/wiki/Sadik_Hadzovic'),
('2014-01-01', 'Mens', 3, 'Jason Poston', 'https://en.wikipedia.org/wiki/Jason_Poston'),

-- 2015
('2015-01-01', 'Open', 1, 'Phil Heath', 'https://en.wikipedia.org/wiki/Phil_Heath'),
('2015-01-01', 'Open', 2, 'Dexter Jackson', 'https://en.wikipedia.org/wiki/Dexter_Jackson_(bodybuilder)'),
('2015-01-01', 'Open', 3, 'Shawn Rhoden', 'https://en.wikipedia.org/wiki/Shawn_Rhoden'),
('2015-01-01', '212', 1, 'James Flex Lewis', 'https://en.wikipedia.org/wiki/James_Lewis_(bodybuilder)'),
('2015-01-01', '212', 2, 'Jose Raymond', 'https://en.wikipedia.org/wiki/Jose_Raymond_(bodybuilder)'),
('2015-01-01', '212', 3, 'Hidetada Yamagishi', 'https://en.wikipedia.org/wiki/Hidetada_Yamagishi'),
('2015-01-01', 'Bikini', 1, 'Ashley Kaltwasser', 'https://en.wikipedia.org/wiki/Ashley_Kaltwasser'),
('2015-01-01', 'Bikini', 2, 'Janet Layug', 'https://en.wikipedia.org/wiki/Janet_Layug'),
('2015-01-01', 'Bikini', 3, 'Courtney King', 'https://en.wikipedia.org/wiki/Courtney_King'),
('2015-01-01', 'Mens', 1, 'Jeremy Buendia', 'https://en.wikipedia.org/wiki/Jeremy_Buendia'),
('2015-01-01', 'Mens', 2, 'Sadik Hadzovic', 'https://en.wikipedia.org/wiki/Sadik_Hadzovic'),
('2015-01-01', 'Mens', 3, 'Jason Poston', 'https://en.wikipedia.org/wiki/Jason_Poston'),

-- 2016
('2016-01-01', 'Open', 1, 'Phil Heath', 'https://en.wikipedia.org/wiki/Phil_Heath'),
('2016-01-01', 'Open', 2, 'Shawn Rhoden', 'https://en.wikipedia.org/wiki/Shawn_Rhoden'),
('2016-01-01', 'Open', 3, 'Dexter Jackson', 'https://en.wikipedia.org/wiki/Dexter_Jackson_(bodybuilder)'),
('2016-01-01', '212', 1, 'James Flex Lewis', 'https://en.wikipedia.org/wiki/James_Lewis_(bodybuilder)'),
('2016-01-01', '212', 2, 'Ahmad Ashkanani', 'https://en.wikipedia.org/wiki/Ahmad_Ashkanani'),
('2016-01-01', '212', 3, 'Jose Raymond', 'https://en.wikipedia.org/wiki/Jose_Raymond_(bodybuilder)'),
('2016-01-01', 'Bikini', 1, 'Courtney King', 'https://en.wikipedia.org/wiki/Courtney_King'),
('2016-01-01', 'Bikini', 2, 'Angelica Teixeira', 'https://en.wikipedia.org/wiki/Angelica_Teixeira'),
('2016-01-01', 'Bikini', 3, 'India Paulino', 'https://en.wikipedia.org/wiki/India_Paulino'),
('2016-01-01', 'Mens', 1, 'Jeremy Buendia', 'https://en.wikipedia.org/wiki/Jeremy_Buendia'),
('2016-01-01', 'Mens', 2, 'Ryan Terry', 'https://en.wikipedia.org/wiki/Ryan_Terry_(bodybuilder)'),
('2016-01-01', 'Mens', 3, 'Jeremy Potvin', 'https://en.wikipedia.org/wiki/Jeremy_Potvin'),

-- 2017
('2017-01-01', 'Open', 1, 'Phil Heath', 'https://en.wikipedia.org/wiki/Phil_Heath'),
('2017-01-01', 'Open', 2, 'Mamdouh Elssbiay', 'https://en.wikipedia.org/wiki/Mamdouh_Elssbiay'),
('2017-01-01', 'Open', 3, 'William Bonac', 'https://en.wikipedia.org/wiki/William_Bonac'),
('2017-01-01', '212', 1, 'Flex Lewis', 'https://en.wikipedia.org/wiki/James_Lewis_(bodybuilder)'),
('2017-01-01', '212', 2, 'Ahmad Ashkanani', 'https://en.wikipedia.org/wiki/Ahmad_Ashkanani'),
('2017-01-01', '212', 3, 'David Henry', 'https://en.wikipedia.org/wiki/David_Henry_(bodybuilder)'),
('2017-01-01', 'Classic', 1, 'Breon Ansley', 'https://en.wikipedia.org/wiki/Breon_Ansley'),
('2017-01-01', 'Classic ', 2, 'Chris Bumstead', 'https://en.wikipedia.org/wiki/Chris_Bumstead'),
('2017-01-01', 'Classic ', 3, 'George Peterson', 'https://en.wikipedia.org/wiki/George_Peterson_(bodybuilder)'),
('2017-01-01', 'Bikini', 1, 'Angelica Teixeira', 'https://en.wikipedia.org/wiki/Angelica_Teixeira'),
('2017-01-01', 'Bikini', 2, 'Jennifer Ronzitti', 'https://en.wikipedia.org/wiki/Jennifer_Ronzitti'),
('2017-01-01', 'Bikini', 3, 'India Paulino', 'https://en.wikipedia.org/wiki/India_Paulino'),
('2017-01-01', 'Mens ', 1, 'Jeremy Buendia', 'https://en.wikipedia.org/wiki/Jeremy_Buendia'),
('2017-01-01', 'Mens ', 2, 'Andre Ferguson', 'https://en.wikipedia.org/wiki/Andre_Ferguson'),
('2017-01-01', 'Mens ', 3, 'Brandon Hendrickson', 'https://en.wikipedia.org/wiki/Brandon_Hendrickson'),

-- 2018
('2018-01-01', 'Open', 1, 'Shawn Rhoden', 'https://en.wikipedia.org/wiki/Shawn_Rhoden'),
('2018-01-01', 'Open', 2, 'Phil Heath', 'https://en.wikipedia.org/wiki/Phil_Heath'),
('2018-01-01', 'Open', 3, 'Roelly Winklaar', 'https://en.wikipedia.org/wiki/Roelly_Winklaar'),
('2018-01-01', '212', 1, 'Flex Lewis', 'https://en.wikipedia.org/wiki/James_Lewis_(bodybuilder)'),
('2018-01-01', '212', 2, 'Derek Lunsford', 'https://en.wikipedia.org/wiki/Derek_Lunsford'),
('2018-01-01', '212', 3, 'David Henry', 'https://en.wikipedia.org/wiki/David_Henry_(bodybuilder)'),
('2018-01-01', 'Classic ', 1, 'Breon Ansley', 'https://en.wikipedia.org/wiki/Breon_Ansley'),
('2018-01-01', 'Classic ', 2, 'Chris Bumstead', 'https://en.wikipedia.org/wiki/Chris_Bumstead'),
('2018-01-01', 'Classic ', 3, 'George Peterson', 'https://en.wikipedia.org/wiki/George_Peterson_(bodybuilder)'),
('2018-01-01', 'Bikini', 1, 'Angelica Teixeira', 'https://en.wikipedia.org/wiki/Angelica_Teixeira'),
('2018-01-01', 'Bikini', 2, 'Janet Layug', 'https://en.wikipedia.org/wiki/Janet_Layug'),
('2018-01-01', 'Bikini', 3, 'Elisa Pecini', 'https://en.wikipedia.org/wiki/Elisa_Pecini'),
('2018-01-01', 'Mens ', 1, 'Brandon Hendrickson', 'https://en.wikipedia.org/wiki/Brandon_Hendrickson'),
('2018-01-01', 'Mens ', 2, 'Raymont Edmonds', 'https://en.wikipedia.org/wiki/Raymont_Edmonds'),
('2018-01-01', 'Mens ', 3, 'Ryan Terry', 'https://en.wikipedia.org/wiki/Ryan_Terry_(bodybuilder)'),


-- 2019
('2019-01-01', 'Open', 1, 'Brandon Curry', 'https://en.wikipedia.org/wiki/Brandon_Curry'),
('2019-01-01', 'Open', 2, 'William Bonac', 'https://en.wikipedia.org/wiki/William_Bonac'),
('2019-01-01', 'Open', 3, 'Hadi Choopan', 'https://en.wikipedia.org/wiki/Hadi_Choopan'),
('2019-01-01', '212', 1, 'Kamal Elgargni', 'https://en.wikipedia.org/wiki/Kamal_Elgargni'),
('2019-01-01', '212', 2, 'Derek Lunsford', 'https://en.wikipedia.org/wiki/Derek_Lunsford'),
('2019-01-01', '212', 3, 'Shaun Clarida', 'https://en.wikipedia.org/wiki/Shaun_Clarida'),
('2019-01-01', 'Classic ', 1, 'Chris Bumstead', 'https://en.wikipedia.org/wiki/Chris_Bumstead'),
('2019-01-01', 'Classic ', 2, 'Breion Ansley', 'https://en.wikipedia.org/wiki/Breon_Ansley'),
('2019-01-01', 'Classic ', 3, 'George Peterson', 'https://en.wikipedia.org/wiki/George_Peterson_(bodybuilder)'),
('2019-01-01', 'Bikini', 1, 'Elisa Pecini', 'https://en.wikipedia.org/wiki/Elisa_Pecini'),
('2019-01-01', 'Bikini', 2, 'Janet Layug', 'https://en.wikipedia.org/wiki/Janet_Layug'),
('2019-01-01', 'Bikini', 3, 'Angelica Teixeira', 'https://en.wikipedia.org/wiki/Angelica_Teixeira'),
('2019-01-01', 'Mens ', 1, 'Raymont Edmonds', 'https://en.wikipedia.org/wiki/Raymont_Edmonds'),
('2019-01-01', 'Mens ', 2, 'Andrea Ferguson', 'https://en.wikipedia.org/wiki/Andre_Ferguson'),
('2019-01-01', 'Mens ', 3, 'Kyron Holden', 'https://en.wikipedia.org/wiki/Kyron_Holden'),

-- 2020
('2020-01-01', 'Open', 1, 'Mamdouh Elssbiay', 'https://en.wikipedia.org/wiki/Mamdouh_Elssbiay'),
('2020-01-01', 'Open', 2, 'Phil Heath', 'https://en.wikipedia.org/wiki/Phil_Heath'),
('2020-01-01', 'Open', 3, 'Hadi Choopan', 'https://en.wikipedia.org/wiki/Hadi_Choopan'),
('2020-01-01', '212', 1, 'Kamal Elgargni', 'https://en.wikipedia.org/wiki/Kamal_Elgargni'),
('2020-01-01', '212', 2, 'Derek Lunsford', 'https://en.wikipedia.org/wiki/Derek_Lunsford'),
('2020-01-01', '212', 3, 'Shaun Clarida', 'https://en.wikipedia.org/wiki/Shaun_Clarida'),
('2020-01-01', 'Classic ', 1, 'Chris Bumstead', 'https://en.wikipedia.org/wiki/Chris_Bumstead'),
('2020-01-01', 'Classic ', 2, 'Breion Ansley', 'https://en.wikipedia.org/wiki/Breon_Ansley'),
('2020-01-01', 'Classic ', 3, 'Alex Cambronero', 'https://en.wikipedia.org/wiki/Alex_Cambronero'),
('2020-01-01', 'Bikini', 1, 'Janet Layug', 'https://en.wikipedia.org/wiki/Janet_Layug'),
('2020-01-01', 'Bikini', 2, 'Jennifer Dorie', 'https://en.wikipedia.org/wiki/Jennifer_Dorie'),
('2020-01-01', 'Bikini', 3, 'Etila Santiago Santos', 'https://en.wikipedia.org/wiki/Etila_Santiago_Santos'),
('2020-01-01', 'Mens ', 1, 'Raymont Edmonds', 'https://en.wikipedia.org/wiki/Raymont_Edmonds'),
('2020-01-01', 'Mens ', 2, 'Andrea Ferguson', 'https://en.wikipedia.org/wiki/Andre_Ferguson'),
('2020-01-01', 'Mens ', 3, 'Kyron Holden', 'https://en.wikipedia.org/wiki/Kyron_Holden'),


-- 2021
('2021-01-01', 'Open', 1, 'Mamdouh Elssbiay', 'https://en.wikipedia.org/wiki/Mamdouh_Elssbiay'),
('2021-01-01', 'Open', 2, 'Brandon Curry', 'https://en.wikipedia.org/wiki/Brandon_Curry'),
('2021-01-01', 'Open', 3, 'Hadi Choopan', 'https://en.wikipedia.org/wiki/Hadi_Choopan'),
('2021-01-01', '212', 1, 'Shaun Clarida', 'https://en.wikipedia.org/wiki/Shaun_Clarida'),
('2021-01-01', '212', 2, 'George Peterson', 'https://en.wikipedia.org/wiki/George_Peterson_(bodybuilder)'),
('2021-01-01', '212', 3, 'Keone Pearson', 'https://en.wikipedia.org/wiki/Keone_Pearson'),
('2021-01-01', 'Classic ', 1, 'Chris Bumstead', 'https://en.wikipedia.org/wiki/Chris_Bumstead'),
('2021-01-01', 'Classic ', 2, 'Breion Ansley', 'https://en.wikipedia.org/wiki/Breon_Ansley'),
('2021-01-01', 'Classic ', 3, 'Brian Jones', 'https://en.wikipedia.org/wiki/Brian_Jones_(bodybuilder)'),
('2021-01-01', 'Bikini', 1, 'Ashley Kaltwasser', 'https://en.wikipedia.org/wiki/Ashley_Kaltwasser'),
('2021-01-01', 'Bikini', 2, 'Jennifer Dorie', 'https://en.wikipedia.org/wiki/Jennifer_Dorie'),
('2021-01-01', 'Bikini', 3, 'Etila Santiago Santos', 'https://en.wikipedia.org/wiki/Etila_Santiago_Santos'),
('2021-01-01', 'Mens ', 1, 'Raymont Edmonds', 'https://en.wikipedia.org/wiki/Raymont_Edmonds'),
('2021-01-01', 'Mens ', 2, 'Andrea Ferguson', 'https://en.wikipedia.org/wiki/Andre_Ferguson'),
('2021-01-01', 'Mens ', 3, 'Kyron Holden', 'https://en.wikipedia.org/wiki/Kyron_Holden'),

-- 2022
('2022-01-01', 'Open', 1, 'Hadi Choopan', 'https://en.wikipedia.org/wiki/Hadi_Choopan'),
('2022-01-01', 'Open', 2, 'Derek Lunsford', 'https://en.wikipedia.org/wiki/Derek_Lunsford'),
('2022-01-01', 'Open', 3, 'Nick Walker', 'https://en.wikipedia.org/wiki/Nick_Walker_(bodybuilder)'),
('2022-01-01', 'Bikini', 1, 'Maureen Blanquisco', 'https://en.wikipedia.org/wiki/Maureen_Blanquisco'),
('2022-01-01', 'Bikini', 2, 'Jennifer Dorie', 'https://en.wikipedia.org/wiki/Jennifer_Dorie'),
('2022-01-01', 'Bikini', 3, 'Lauralie Chapados', 'https://en.wikipedia.org/wiki/Lauralie_Chapados'),
('2022-01-01', 'Mens', 1, 'Erin Banks', 'https://en.wikipedia.org/wiki/Erin_Banks_(bodybuilder)'),
('2022-01-01', 'Mens', 2, 'Brandon Hendrickson', 'https://en.wikipedia.org/wiki/Brandon_Hendrickson'),
('2022-01-01', 'Mens', 3, 'Diogo Montenegro', 'https://en.wikipedia.org/wiki/Diogo_Montenegro'),
('2022-01-01', 'Classic', 1, 'Chris Bumstead', 'https://en.wikipedia.org/wiki/Chris_Bumstead'),
('2022-01-01', 'Classic', 2, 'Ramon Rocha Queiroz', 'https://en.wikipedia.org/wiki/Ramon_Rocha_Queiroz'),
('2022-01-01', 'Classic', 3, 'Urs Kalecinski', 'https://en.wikipedia.org/wiki/Urs_Kalecinski'),
('2022-01-01', '212', 1, 'Angel Calderon Frias', 'https://en.wikipedia.org/wiki/Angel_Calderon_Frias'),
('2022-01-01', '212', 2, 'Shaun Clarida', 'https://en.wikipedia.org/wiki/Shaun_Clarida'),
('2022-01-01', '212', 3, 'Kamal Elgargni', 'https://en.wikipedia.org/wiki/Kamal_Elgargni'),

-- 2023
('2023-01-01', 'Open', 1, 'Hadi Choopan', 'https://en.wikipedia.org/wiki/Hadi_Choopan'),
('2023-01-01', 'Open', 2, 'Nick Walker', 'https://en.wikipedia.org/wiki/Nick_Walker_(bodybuilder)'),
('2023-01-01', 'Open', 3, 'Samson Dauda', 'https://www.ifbbpro.com/wp-content/uploads/2022/11/Samson-Dauda-1.jpg'),
('2023-01-01', 'Bikini', 1, 'Maureen Blanquisco', 'https://en.wikipedia.org/wiki/Maureen_Blanquisco'),
('2023-01-01', 'Bikini', 2, 'Etila Santiago Santos', 'https://www.ifbbpro.com/wp-content/uploads/2022/11/Etila-Santiago-Santos-1.jpg'),
('2023-01-01', 'Bikini', 3, 'Jennifer Dorie', 'https://en.wikipedia.org/wiki/Jennifer_Dorie'),
('2023-01-01', 'Mens', 1, 'Erin Banks', 'https://en.wikipedia.org/wiki/Erin_Banks_(bodybuilder)'),
('2023-01-01', 'Mens', 2, 'Brandon Hendrickson', 'https://en.wikipedia.org/wiki/Brandon_Hendrickson'),
('2023-01-01', 'Mens', 3, 'Riccardo Croci', 'https://www.ifbbpro.com/wp-content/uploads/2022/11/Riccardo-Croci-1.jpg'),
('2023-01-01', 'Classic', 1, 'Chris Bumstead', 'https://en.wikipedia.org/wiki/Chris_Bumstead'),
('2023-01-01', 'Classic', 2, 'Ramon Rocha Queiroz', 'https://en.wikipedia.org/wiki/Ramon_Rocha_Queiroz'),
('2023-01-01', 'Classic', 3, 'Urs Kalecinski', 'https://en.wikipedia.org/wiki/Urs_Kalecinski'),
('2023-01-01', '212', 1, 'Angel Calderon Frias', 'https://en.wikipedia.org/wiki/Angel_Calderon_Frias'),
('2023-01-01', '212', 2, 'Shaun Clarida', 'https://en.wikipedia.org/wiki/Shaun_Clarida'),
('2023-01-01', '212', 3, 'Keone Pearson', 'https://www.ifbbpro.com/wp-content/uploads/2022/11/Keone-Pearson-1.jpg');


INSERT INTO ipfRanking (Fecha, Posicion, NombreCompetidor) VALUES
-- 1971
('1971-01-01', 1, 'Hugh Cassidy'),
('1971-01-01', 2, 'Marino Santini'),
('1971-01-01', 3, 'Yozo Ishii'),

('1972-01-01', 1, 'Hugh Cassidy'),
('1972-01-01', 2, 'Marino Santini'),
('1972-01-01', 3, 'Frank Williams'),

('1973-01-01', 1, 'Marino Santini'),
('1973-01-01', 2, 'Hugh Cassidy'),
('1973-01-01', 3, 'Kiyoshi Sugimoto'),

('1974-01-01', 1, 'Hugh Cassidy'),
('1974-01-01', 2, 'Roger Estep'),
('1974-01-01', 3, 'Marino Santini'),

('1975-01-01', 1, 'Roger Estep'),
('1975-01-01', 2, 'Franco Columbu'),
('1975-01-01', 3, 'Hugh Cassidy'),

('1976-01-01', 1, 'Franco Columbu'),
('1976-01-01', 2, 'Bill Kazmaier'),
('1976-01-01', 3, 'Tom Stelluti'),

-- 1977
('1977-01-01', 1, 'Larry Pacifico'),
('1977-01-01', 2, 'Ulf Morin Sweden'),
('1977-01-01', 3, 'Reijo Kiviranta Finland'),

-- 1978
('1978-01-01', 1, 'Hideaki Inaba'),
('1978-01-01', 2, 'Mike Bridges'),
('1978-01-01', 3, 'Precious McKenzie'),

-- 1979
('1979-01-01', 1, 'Mike Bridges'),
('1979-01-01', 2, 'Hideaki Inaba'),
('1979-01-01', 3, 'Lamar Gant'),

-- 1980
('1980-01-01', 1, 'Mike Bridges'),
('1980-01-01', 2, 'Lamar Gant'),
('1980-01-01', 3, 'Joe Bradley'),

-- 1981
('1981-01-01', 1, 'Mike Bridges'),
('1981-01-01', 2, 'Walter Thomas'),
('1981-01-01', 3, 'Hideaki Inaba'),

-- 1982
('1982-01-01', 1, 'Mike Bridges'),
('1982-01-01', 2, 'Chuck Dunbar'),
('1982-01-01', 3, 'Hideaki Inaba'),

-- 1983
('1983-01-01', 1, 'Hideaki Inaba'),
('1983-01-01', 2, 'Mike Bridges'),
('1983-01-01', 3, 'Kenneth Mattsson'),

-- 1984
('1984-01-01', 1, 'Ed Coan'),
('1984-01-01', 2, 'Daniel Austin'),
('1984-01-01', 3, 'Chuck Dunbar'),

-- 1985
('1985-01-01', 1, 'Hideaki Inaba'),
('1985-01-01', 2, 'Jarmo Virtanen'),
('1985-01-01', 3, 'Eric Coppin'),

-- 1986
('1986-01-01', 1, 'Hideaki Inaba'),
('1986-01-01', 2, 'Lamar Gant'),
('1986-01-01', 3, 'Jarmo Virtanen'),

-- 1987
('1987-01-01', 1, 'Hideaki Inaba'),
('1987-01-01', 2, 'Lamar Gant'),
('1987-01-01', 3, 'Jarmo Virtanen'),

-- 1988
('1988-01-01', 1, 'Lamar Gant'),
('1988-01-01', 2, 'Ed Coan'),
('1988-01-01', 3, 'Hideaki Inaba'),

-- 1989
('1989-01-01', 1, 'Hideaki Inaba'),
('1989-01-01', 2, 'Lamar Gant'),
('1989-01-01', 3, 'Hiroyuki Isagawa'),

-- 1990
('1990-01-01', 1, 'Hideaki Inaba'),
('1990-01-01', 2, 'Lamar Gant'),
('1990-01-01', 3, 'Daniel Austin'),

-- 1991
('1991-01-01', 1, 'Daniel Austin'),
('1991-01-01', 2, 'Hiroyuki Isagawa'),
('1991-01-01', 3, 'David Ricks'),

-- 1992
('1992-01-01', 1, 'Andrzej Stanaszek'),
('1992-01-01', 2, 'Gerard McNamara'),
('1992-01-01', 3, 'Sergey Zhuravlev'),

-- 1993
('1993-01-01', 1, 'Ed Coan'),
('1993-01-01', 2, 'Alexey Sivokon'),
('1993-01-01', 3, 'Andrzej Stanaszek'),

-- 1994
('1994-01-01', 1, 'Ed Coan'),
('1994-01-01', 2, 'Andrzej Stanaszek'),
('1994-01-01', 3, 'Alexey Sivokon'),

-- 1995
('1995-01-01', 1, 'Andrzej Stanaszek'),
('1995-01-01', 2, 'Ed Coan'),
('1995-01-01', 3, 'Wim Elyn'),

-- 1996
('1996-01-01', 1, 'Darimin Bin Sutrisno'),
('1996-01-01', 2, 'Andrzej Stanaszek'),
('1996-01-01', 3, 'Chun-Hsiung Hu'),

-- 1997
('1997-01-01', 1, 'Alexey Sivokon'),
('1997-01-01', 2, 'Andrzej Stanaszek'),
('1997-01-01', 3, 'Wade Hooper'),

-- 1998
('1998-01-01', 1, 'Alexey Sivokon'),
('1998-01-01', 2, 'Alexey Gankov'),
('1998-01-01', 3, 'Andrzej Stanaszek'),

-- 1999
('1999-01-01', 1, 'Alexey Sivokon'),
('1999-01-01', 2, 'Jarosław Olech'),
('1999-01-01', 3, 'Andrey Tarasenko'),

-- 2000
('2000-01-01', 1, 'Alexey Sivokon'),
('2000-01-01', 2, 'Jarosław Olech'),
('2000-01-01', 3, 'Andrey Tarasenko'),

-- 2001
('2001-01-01', 1, 'Alexey Sivokon'),
('2001-01-01', 2, 'Jarosław Olech'),
('2001-01-01', 3, 'Darimin Bin Sutrisno'),

-- 2002
('2002-01-01', 1, 'Jarosław Olech'),
('2002-01-01', 2, 'Viktor Furazhkin'),
('2002-01-01', 3, 'Vitaliy Papazov'),

-- 2003
('2003-01-01', 1, 'Andrzej Stanaszek'),
('2003-01-01', 2, 'Jarosław Olech'),
('2003-01-01', 3, 'Sergey Fedosienko'),


-- 2004
('2004-01-01', 1, 'Sergey Fedosienko'),
('2004-01-01', 2, 'Jarosław Olech'),
('2004-01-01', 3, 'Ravil Kazakov'),

-- 2005
('2005-01-01', 1, 'Darimin Bin Sutrisno'),
('2005-01-01', 2, 'Ivan Freydun'),
('2005-01-01', 3, 'Jarosław Olech'),

-- 2006
('2006-01-01', 1, 'Jarosław Olech'),
('2006-01-01', 2, 'Tsung-Ting Hsieh'),
('2006-01-01', 3, 'Priscilla Ribic'),

-- 2007
('2007-01-01', 1, 'Sergey Fedosienko'),
('2007-01-01', 2, 'Yulia Zaugolova'),
('2007-01-01', 3, 'Galina Potselueva'),

-- 2008
('2008-01-01', 1, 'Yukako Fukushima'),
('2008-01-01', 2, 'Jarosław Olech'),
('2008-01-01', 3, 'Wei-Ling Chen'),

-- 2009
('2009-01-01', 1, 'Sergey Fedosienko'),
('2009-01-01', 2, 'Jarosław Olech'),
('2009-01-01', 3, 'Irina Poletaeva'),

-- 2010
('2010-01-01', 1, 'Sergey Fedosienko'),
('2010-01-01', 2, 'Hartati Sri'),
('2010-01-01', 3, 'Ivan Freydun'),

-- 2011
('2011-01-01', 1, 'Larysa Soloviova'),
('2011-01-01', 2, 'Jarosław Olech'),
('2011-01-01', 3, 'Sergey Fedosienko'),

-- 2012
('2012-01-01', 1, 'Larysa Soloviova'),
('2012-01-01', 2, 'Sergey Fedosienko'),
('2012-01-01', 3, 'Sari Noviana'),

-- 2013
('2013-01-01', 1, 'Larysa Soloviova'),
('2013-01-01', 2, 'Sergey Fedosienko'),
('2013-01-01', 3, 'Natalia Salnikova'),

-- 2014
('2014-01-01', 1, 'Larysa Soloviova'),
('2014-01-01', 2, 'Carl Yngvar Christensen'),
('2014-01-01', 3, 'Sergey Fedosienko'),

-- 2015
('2015-01-01', 1, 'Natalia Salnikova'),
('2015-01-01', 2, 'Larysa Soloviova'),
('2015-01-01', 3, 'Yukako Fukushima'),

-- 2016
('2016-01-01', 1, 'Larysa Soloviova'),
('2016-01-01', 2, 'Wei-Ling Chen'),
('2016-01-01', 3, 'Sergey Fedosienko'),

-- 2017
('2017-01-01', 1, 'Sergey Fedosienko'),
('2017-01-01', 2, 'Jarosław Olech'),
('2017-01-01', 3, 'Larysa Soloviova'),

-- 2018
('2018-01-01', 1, 'Larysa Soloviova'),
('2018-01-01', 2, 'Yukako Fukushima'),
('2018-01-01', 3, 'Andrey Konovalov'),

-- 2019
('2019-01-01', 1, 'Larysa Soloviova'),
('2019-01-01', 2, 'Carola Garra'),
('2019-01-01', 3, 'Sergey Fedosienko'),

-- 2021
('2021-01-01', 1, 'Carola Garra'),
('2021-01-01', 2, 'Taylor LaChapelle'),
('2021-01-01', 3, 'Oleksiy Bychkov'),

-- 2022
('2022-01-01', 1, 'Tiffany Chapon'),
('2022-01-01', 2, 'Amanda Lawrence'),
('2022-01-01', 3, 'Taylor Atwood'),

-- 2023
('2023-01-01', 1, 'Natalie Richards'),
('2023-01-01', 2, 'Carola Garra'),
('2023-01-01', 3, 'Amanda Lawrence'),

-- 2024
('2024-01-01', 1, 'Agata Sitko'),
('2024-01-01', 2, 'Kjell Egil Bakkelund'),
('2024-01-01', 3, 'Bobbie Butters');