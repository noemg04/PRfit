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
INSERT INTO mrOranking (Fecha, Categoria, Posicion, NombreCompetidor) VALUES
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
('1970-01-01', 'Open', 3, 'Franco Columbu'),

-- 1971
('1971-01-01', 'Open', 1, 'Arnold Schwarzenegger'),
('1971-01-01', 'Open', 2, 'Serge Nubret'),
('1971-01-01', 'Open', 3, 'Franco Columbu'),

-- 1972
('1972-01-01', 'Open', 1, 'Arnold Schwarzenegger'),
('1972-01-01', 'Open', 2, 'Serge Nubret'),
('1972-01-01', 'Open', 3, 'Sergio Oliva'),

-- 1973
('1973-01-01', 'Open', 1, 'Arnold Schwarzenegger'),
('1973-01-01', 'Open', 2, 'Serge Nubret'),
('1973-01-01', 'Open', 3, 'Lou Ferrigno'),

-- 1974
('1974-01-01', 'Open', 1, 'Arnold Schwarzenegger'),
('1974-01-01', 'Open', 2, 'Lou Ferrigno'),
('1974-01-01', 'Open', 3, 'Franco Columbu'),

-- 1975
('1975-01-01', 'Open', 1, 'Arnold Schwarzenegger'),
('1975-01-01', 'Open', 2, 'Lou Ferrigno'),
('1975-01-01', 'Open', 3, 'Franco Columbu'),

-- 1976
('1976-01-01', 'Open', 1, 'Franco Columbu'),
('1976-01-01', 'Open', 2, 'Ken Waller'),
('1976-01-01', 'Open', 3, 'Mike Mentzer'),

-- 1977
('1977-01-01', 'Open', 1, 'Frank Zane'),
('1977-01-01', 'Open', 2, 'Kenny Waller'),
('1977-01-01', 'Open', 3, 'Roger Walker'),

-- 1978
('1978-01-01', 'Open', 1, 'Frank Zane'),
('1978-01-01', 'Open', 2, 'Chris Dickerson'),
('1978-01-01', 'Open', 3, 'Robbie Robinson'),

-- 1979
('1979-01-01', 'Open', 1, 'Frank Zane'),
('1979-01-01', 'Open', 2, 'Mike Mentzer'),
('1979-01-01', 'Open', 3, 'Robbie Robinson'),

-- 1980
('1980-01-01', 'Open', 1, 'Arnold Schwarzenegger'),
('1980-01-01', 'Open', 2, 'Chris Dickerson'),
('1980-01-01', 'Open', 3, 'Franco Columbu'),

-- 1981
('1981-01-01', 'Open', 1, 'Franco Columbu'),
('1981-01-01', 'Open', 2, 'Chris Dickerson'),
('1981-01-01', 'Open', 3, 'Tom Platz'),

-- 1982
('1982-01-01', 'Open', 1, 'Chris Dickerson'),
('1982-01-01', 'Open', 2, 'Frank Zane'),
('1982-01-01', 'Open', 3, 'Tom Platz'),

-- 1983
('1983-01-01', 'Open', 1, 'Samir Bannout'),
('1983-01-01', 'Open', 2, 'Mohammed Makkawy'),
('1983-01-01', 'Open', 3, 'Lee Haney'),

-- 1984
('1984-01-01', 'Open', 1, 'Lee Haney'),
('1984-01-01', 'Open', 2, 'Mohammed Makkawy'),
('1984-01-01', 'Open', 3, 'Jusup Wilkosz'),

-- 1985
('1985-01-01', 'Open', 1, 'Lee Haney'),
('1985-01-01', 'Open', 2, 'Albert Beckles'),
('1985-01-01', 'Open', 3, 'Rich Gaspari'),

-- 1986
('1986-01-01', 'Open', 1, 'Lee Haney'),
('1986-01-01', 'Open', 2, 'Rich Gaspari'),
('1986-01-01', 'Open', 3, 'Mike Christian'),

-- 1987
('1987-01-01', 'Open', 1, 'Lee Haney'),
('1987-01-01', 'Open', 2, 'Rich Gaspari'),
('1987-01-01', 'Open', 3, 'Lee Labrada'),

-- 1988
('1988-01-01', 'Open', 1, 'Lee Haney'),
('1988-01-01', 'Open', 2, 'Rich Gaspari'),
('1988-01-01', 'Open', 3, 'Mike Christian'),

-- 1989
('1989-01-01', 'Open', 1, 'Lee Haney'),
('1989-01-01', 'Open', 2, 'Vince Taylor'),
('1989-01-01', 'Open', 3, 'Rich Gaspari'),

-- 1990
('1990-01-01', 'Open', 1, 'Lee Haney'),
('1990-01-01', 'Open', 2, 'Vince Taylor'),
('1990-01-01', 'Open', 3, 'Rich Gaspari'),

-- 1991
('1991-01-01', 'Open', 1, 'Lee Haney'),
('1991-01-01', 'Open', 2, 'Dorian Yates'),
('1991-01-01', 'Open', 3, 'Vince Taylor'),

-- 1992
('1992-01-01', 'Open', 1, 'Dorian Yates'),
('1992-01-01', 'Open', 2, 'Kevin Levrone'),
('1992-01-01', 'Open', 3, 'Lee Labrada'),

-- 1993
('1993-01-01', 'Open', 1, 'Dorian Yates'),
('1993-01-01', 'Open', 2, 'Flex Wheeler'),
('1993-01-01', 'Open', 3, 'Shawn Ray'),

-- 1994
('1994-01-01', 'Open', 1, 'Dorian Yates'),
('1994-01-01', 'Open', 2, 'Shawn Ray'),
('1994-01-01', 'Open', 3, 'Kevin Levrone'),

-- 1995
('1995-01-01', 'Open', 1, 'Dorian Yates'),
('1995-01-01', 'Open', 2, 'Nasser El Sonbaty'),
('1995-01-01', 'Open', 3, 'Shawn Ray'),

-- 1996
('1996-01-01', 'Open', 1, 'Dorian Yates'),
('1996-01-01', 'Open', 2, 'Shawn Ray'),
('1996-01-01', 'Open', 3, 'Kevin Levrone'),

-- 1997
('1997-01-01', 'Open', 1, 'Dorian Yates'),
('1997-01-01', 'Open', 2, 'Nasser El Sonbaty'),
('1997-01-01', 'Open', 3, 'Shawn Ray'),

-- 1998
('1998-01-01', 'Open', 1, 'Ronnie Coleman'),
('1998-01-01', 'Open', 2, 'Flex Wheeler'),
('1998-01-01', 'Open', 3, 'Nasser El Sonbaty'),

-- 1999
('1999-01-01', 'Open', 1, 'Ronnie Coleman'),
('1999-01-01', 'Open', 2, 'Flex Wheeler'),
('1999-01-01', 'Open', 3, 'Chris Cormier'),

-- 2000
('2000-01-01', 'Open', 1, 'Ronnie Coleman'),
('2000-01-01', 'Open', 2, 'Kevin Levrone'),
('2000-01-01', 'Open', 3, 'Flex Wheeler'),

-- 2000
('2000-01-01', 'Open', 1, 'Ronnie Coleman'),
('2000-01-01', 'Open', 2, 'Kevin Levrone'),
('2000-01-01', 'Open', 3, 'Flex Wheeler'),

-- 2001
('2001-01-01', 'Open', 1, 'Ronnie Coleman'),
('2001-01-01', 'Open', 2, 'Jay Cutler'),
('2001-01-01', 'Open', 3, 'Kevin Levrone'),

-- 2002
('2002-01-01', 'Open', 1, 'Ronnie Coleman'),
('2002-01-01', 'Open', 2, 'Kevin Levrone'),
('2002-01-01', 'Open', 3, 'Chris Cormier'),

-- 2003
('2003-01-01', 'Open', 1, 'Ronnie Coleman'),
('2003-01-01', 'Open', 2, 'Jay Cutler'),
('2003-01-01', 'Open', 3, 'Dexter Jackson'),

-- 2004
('2004-01-01', 'Open', 1, 'Ronnie Coleman'),
('2004-01-01', 'Open', 2, 'Jay Cutler'),
('2004-01-01', 'Open', 3, 'Gustavo Badell'),

-- 2005
('2005-01-01', 'Open', 1, 'Ronnie Coleman'),
('2005-01-01', 'Open', 2, 'Jay Cutler'),
('2005-01-01', 'Open', 3, 'Gustavo Badell'),

-- 2006
('2006-01-01', 'Open', 1, 'Jay Cutler'),
('2006-01-01', 'Open', 2, 'Ronnie Coleman'),
('2006-01-01', 'Open', 3, 'Victor Martinez'),

-- 2007
('2007-01-01', 'Open', 1, 'Jay Cutler'),
('2007-01-01', 'Open', 2, 'Victor Martinez'),
('2007-01-01', 'Open', 3, 'Dexter Jackson'),

-- 2008
('2008-01-01', 'Open', 1, 'Dexter Jackson'),
('2008-01-01', 'Open', 2, 'Jay Cutler'),
('2008-01-01', 'Open', 3, 'Phil Heath'),
('2008-01-01', '202', 1, 'David Henry'),
('2008-01-01', '202', 2, 'Kevin English'),
('2008-01-01', '202', 3, 'James Flex Lewis'),

-- 2009
('2009-01-01', 'Open', 1, 'Jay Cutler'),
('2009-01-01', 'Open', 2, 'Branch Warren'),
('2009-01-01', 'Open', 3, 'Dexter Jackson'),
('2009-01-01', '202', 1, 'Kevin English'),
('2009-01-01', '202', 2, 'David Henry'),
('2009-01-01', '202', 3, 'Richard Jackson'),

-- 2010
('2010-01-01', 'Open', 1, 'Jay Cutler'),
('2010-01-01', 'Open', 2, 'Phil Heath'),
('2010-01-01', 'Open', 3, 'Branch Warren'),
('2010-01-01', '202', 1, 'Kevin English'),
('2010-01-01', '202', 2, 'David Henry'),
('2010-01-01', '202', 3, 'Eduardo Correa'),
-- Introducción de la categoría Bikini en 2010
('2010-01-01', 'Bikini', 1, 'Sonia Gonzales'),
('2010-01-01', 'Bikini', 2, 'Nathalia Melo'),
('2010-01-01', 'Bikini', 3, 'Amanda Latona'),

-- 2011
('2011-01-01', 'Open', 1, 'Phil Heath'),
('2011-01-01', 'Open', 2, 'Jay Cutler'),
('2011-01-01', 'Open', 3, 'Kai Greene'),
('2011-01-01', '202', 1, 'Kevin English'),
('2011-01-01', '202', 2, 'James Flex Lewis'),
('2011-01-01', '202', 3, 'Jose Raymond'),
('2011-01-01', 'Bikini', 1, 'Nicole Nagrani'),
('2011-01-01', 'Bikini', 2, 'Nathalia Melo'),
('2011-01-01', 'Bikini', 3, 'Dianna Dahlgren'),

-- 2012
('2012-01-01', 'Open', 1, 'Phil Heath'),
('2012-01-01', 'Open', 2, 'Kai Greene'),
('2012-01-01', 'Open', 3, 'Shawn Rhoden'),
('2012-01-01', '212', 1, 'James Flex Lewis'),
('2012-01-01', '212', 2, 'David Henry'),
('2012-01-01', '212', 3, 'Eduardo Correa'),
('2012-01-01', 'Bikini', 1, 'Nathalia Melo'),
('2012-01-01', 'Bikini', 2, 'Nicole Nagrani'),
('2012-01-01', 'Bikini', 3, 'India Paulino'),

-- 2013
('2013-01-01', 'Open', 1, 'Phil Heath'),
('2013-01-01', 'Open', 2, 'Kai Greene'),
('2013-01-01', 'Open', 3, 'Dennis Wolf'),
('2013-01-01', '212', 1, 'James Flex Lewis'),
('2013-01-01', '212', 2, 'David Henry'),
('2013-01-01', '212', 3, 'Kevin English'),
('2013-01-01', 'Bikini', 1, 'Ashley Kaltwasser'),
('2013-01-01', 'Bikini', 2, 'Yeshaira Robles'),
('2013-01-01', 'Bikini', 3, 'Stacey Alexander'),
('2013-01-01', 'Mens', 1, 'Mark Anthony Wingson'),
('2013-01-01', 'Mens', 2, 'Jeremy Buendia'),
('2013-01-01', 'Mens', 3, 'Sadik Hadzovic'),

-- 2014
('2014-01-01', 'Open', 1, 'Phil Heath'),
('2014-01-01', 'Open', 2, 'Kai Greene'),
('2014-01-01', 'Open', 3, 'Shawn Rhoden'),
('2014-01-01', '212', 1, 'James Flex Lewis'),
('2014-01-01', '212', 2, 'Eduardo Correa'),
('2014-01-01', '212', 3, 'Jose Raymond'),
('2014-01-01', 'Bikini', 1, 'Ashley Kaltwasser'),
('2014-01-01', 'Bikini', 2, 'Janet Layug'),
('2014-01-01', 'Bikini', 3, 'Stacey Alexander'),
('2014-01-01', 'Mens', 1, 'Jeremy Buendia'),
('2014-01-01', 'Mens', 2, 'Sadik Hadzovic'),
('2014-01-01', 'Mens', 3, 'Jason Poston'),

-- 2015
('2015-01-01', 'Open', 1, 'Phil Heath'),
('2015-01-01', 'Open', 2, 'Dexter Jackson'),
('2015-01-01', 'Open', 3, 'Shawn Rhoden'),
('2015-01-01', '212', 1, 'James Flex Lewis'),
('2015-01-01', '212', 2, 'Jose Raymond'),
('2015-01-01', '212', 3, 'Hidetada Yamagishi'),
('2015-01-01', 'Bikini', 1, 'Ashley Kaltwasser'),
('2015-01-01', 'Bikini', 2, 'Janet Layug'),
('2015-01-01', 'Bikini', 3, 'Courtney King'),
('2015-01-01', 'Mens', 1, 'Jeremy Buendia'),
('2015-01-01', 'Mens', 2, 'Sadik Hadzovic'),
('2015-01-01', 'Mens', 3, 'Jason Poston'),

-- 2016
('2016-01-01', 'Open', 1, 'Phil Heath'),
('2016-01-01', 'Open', 2, 'Shawn Rhoden'),
('2016-01-01', 'Open', 3, 'Dexter Jackson'),
('2016-01-01', '212', 1, 'James Flex Lewis'),
('2016-01-01', '212', 2, 'Ahmad Ashkanani'),
('2016-01-01', '212', 3, 'Jose Raymond'),
('2016-01-01', 'Bikini', 1, 'Courtney King'),
('2016-01-01', 'Bikini', 2, 'Angelica Teixeira'),
('2016-01-01', 'Bikini', 3, 'India Paulino'),
('2016-01-01', 'Mens', 1, 'Jeremy Buendia'),
('2016-01-01', 'Mens', 2, 'Ryan Terry'),
('2016-01-01', 'Mens', 3, 'Jeremy Potvin'),
('2016-01-01', 'Classic', 1, 'Danny Hester'),
('2016-01-01', 'Classic', 2, 'Arash Rahbar'),
('2016-01-01', 'Classic', 3, 'Sadik Hadzovic'),

-- 2017
('2017-01-01', 'Open', 1, 'Phil Heath'),
('2017-01-01', 'Open', 2, 'Mamdouh Elssbiay (Big Ramy)'),
('2017-01-01', 'Open', 3, 'William Bonac'),
('2017-01-01', '212', 1, 'James Flex Lewis'),
('2017-01-01', '212', 2, 'Ahmad Ashkanani'),
('2017-01-01', '212', 3, 'Jose Raymond'),
('2017-01-01', 'Bikini', 1, 'Angelica Teixeira'),
('2017-01-01', 'Bikini', 2, 'Jennifer Ronzitti'),
('2017-01-01', 'Bikini', 3, 'Romina Basualdo'),
('2017-01-01', 'Mens', 1, 'Jeremy Buendia'),
('2017-01-01', 'Mens', 2, 'Andre Ferguson'),
('2017-01-01', 'Mens', 3, 'Brandon Hendrickson'),
('2017-01-01', 'Classic', 1, 'Breon Ansley'),
('2017-01-01', 'Classic', 2, 'Chris Bumstead'),
('2017-01-01', 'Classic', 3, 'George Peterson'),

-- 2018
('2018-01-01', 'Open', 1, 'Shawn Rhoden'),
('2018-01-01', 'Open', 2, 'Phil Heath'),
('2018-01-01', 'Open', 3, 'Roelly Winklaar'),
('2018-01-01', '212', 1, 'James Flex Lewis'),
('2018-01-01', '212', 2, 'Derek Lunsford'),
('2018-01-01', '212', 3, 'Kamal Elgargni'),
('2018-01-01', 'Bikini', 1, 'Angelica Teixeira'),
('2018-01-01', 'Bikini', 2, 'Lauralie Chapados'),
('2018-01-01', 'Bikini', 3, 'Janet Layug'),
('2018-01-01', 'Mens', 1, 'Brandon Hendrickson'),
('2018-01-01', 'Mens', 2, 'Raymont Edmonds'),
('2018-01-01', 'Mens', 3, 'Ryan Terry'),
('2018-01-01', 'Classic', 1, 'Breon Ansley'),
('2018-01-01', 'Classic', 2, 'Chris Bumstead'),
('2018-01-01', 'Classic', 3, 'George Peterson'),

-- 2019
('2019-01-01', 'Open', 1, 'Brandon Curry'),
('2019-01-01', 'Open', 2, 'William Bonac'),
('2019-01-01', 'Open', 3, 'Hadi Choopan'),
('2019-01-01', '212', 1, 'Kamal Elgargni'),
('2019-01-01', '212', 2, 'Derek Lunsford'),
('2019-01-01', '212', 3, 'Shaun Clarida'),
('2019-01-01', 'Bikini', 1, 'Elisa Pecini'),
('2019-01-01', 'Bikini', 2, 'Janet Layug'),
('2019-01-01', 'Bikini', 3, 'Angelica Teixeira'),
('2019-01-01', 'Mens', 1, 'Raymont Edmonds'),
('2019-01-01', 'Mens', 2, 'Andre Ferguson'),
('2019-01-01', 'Mens', 3, 'Kyron Holden'),
('2019-01-01', 'Classic', 1, 'Chris Bumstead'),
('2019-01-01', 'Classic', 2, 'Breon Ansley'),
('2019-01-01', 'Classic', 3, 'George Peterson'),

-- 2020
('2020-01-01', 'Open', 1, 'Mamdouh Elssbiay (Big Ramy)'),
('2020-01-01', 'Open', 2, 'Brandon Curry'),
('2020-01-01', 'Open', 3, 'Phil Heath'),
('2020-01-01', '212', 1, 'Shaun Clarida'),
('2020-01-01', '212', 2, 'Kamal Elgargni'),
('2020-01-01', '212', 3, 'George Peterson'),
('2020-01-01', 'Bikini', 1, 'Janet Layug'),
('2020-01-01', 'Bikini', 2, 'Jennifer Dorie'),
('2020-01-01', 'Bikini', 3, 'Etila Santiago Santos'),
('2020-01-01', 'Mens', 1, 'Brandon Hendrickson'),
('2020-01-01', 'Mens', 2, 'Jeremy Potvin'),
('2020-01-01', 'Mens', 3, 'Kyron Holden'),
('2020-01-01', 'Classic', 1, 'Chris Bumstead'),
('2020-01-01', 'Classic', 2, 'Terrence Ruffin'),
('2020-01-01', 'Classic', 3, 'Breon Ansley'),

-- 2021
('2021-01-01', 'Open', 1, 'Mamdouh Elssbiay (Big Ramy)'),
('2021-01-01', 'Open', 2, 'Brandon Curry'),
('2021-01-01', 'Open', 3, 'Hadi Choopan'),
('2021-01-01', 'Bikini', 1, 'Jennifer Dorie'),
('2021-01-01', 'Bikini', 2, 'Lauralie Chapados'),
('2021-01-01', 'Bikini', 3, 'Ashley Kaltwasser'),
('2021-01-01', 'Mens', 1, 'Brandon Hendrickson'),
('2021-01-01', 'Mens', 2, 'Diogo Montenegro'),
('2021-01-01', 'Mens', 3, 'Raymont Edmonds'),
('2021-01-01', 'Classic', 1, 'Chris Bumstead'),
('2021-01-01', 'Classic', 2, 'Terrence Ruffin'),
('2021-01-01', 'Classic', 3, 'Breon Ansley'),
('2021-01-01', '212', 1, 'Derek Lunsford'),
('2021-01-01', '212', 2, 'Shaun Clarida'),
('2021-01-01', '212', 3, 'Kamal Elgargni'),

-- 2022
('2022-01-01', 'Open', 1, 'Hadi Choopan'),
('2022-01-01', 'Open', 2, 'Derek Lunsford'),
('2022-01-01', 'Open', 3, 'Nick Walker'),
('2022-01-01', 'Bikini', 1, 'Maureen Blanquisco'),
('2022-01-01', 'Bikini', 2, 'Jennifer Dorie'),
('2022-01-01', 'Bikini', 3, 'Lauralie Chapados'),
('2022-01-01', 'Mens', 1, 'Erin Banks'),
('2022-01-01', 'Mens', 2, 'Brandon Hendrickson'),
('2022-01-01', 'Mens', 3, 'Diogo Montenegro'),
('2022-01-01', 'Classic', 1, 'Chris Bumstead'),
('2022-01-01', 'Classic', 2, 'Ramon Rocha Queiroz'),
('2022-01-01', 'Classic', 3, 'Urs Kalecinski'),
('2022-01-01', '212', 1, 'Angel Calderon Frias'),
('2022-01-01', '212', 2, 'Shaun Clarida'),
('2022-01-01', '212', 3, 'Kamal Elgargni'),

-- 2023 (Datos basados en el último evento conocido)
('2023-01-01', 'Open', 1, 'Hadi Choopan'),
('2023-01-01', 'Open', 2, 'Nick Walker'),
('2023-01-01', 'Open', 3, 'Samson Dauda'),
('2023-01-01', 'Bikini', 1, 'Maureen Blanquisco'),
('2023-01-01', 'Bikini', 2, 'Etila Santiago Santos'),
('2023-01-01', 'Bikini', 3, 'Jennifer Dorie'),
('2023-01-01', 'Mens', 1, 'Erin Banks'),
('2023-01-01', 'Mens', 2, 'Brandon Hendrickson'),
('2023-01-01', 'Mens', 3, 'Riccardo Croci'),
('2023-01-01', 'Classic', 1, 'Chris Bumstead'),
('2023-01-01', 'Classic', 2, 'Ramon Rocha Queiroz'),
('2023-01-01', 'Classic', 3, 'Urs Kalecinski'),
('2023-01-01', '212', 1, 'Angel Calderon Frias'),
('2023-01-01', '212', 2, 'Shaun Clarida'),
('2023-01-01', '212', 3, 'Keone Pearson');


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