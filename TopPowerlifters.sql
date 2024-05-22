-- Crea la base de datos si no existe
CREATE DATABASE IF NOT EXISTS ipfRanking;

-- Selecciona la base de datos
USE ipfRanking;

-- Tabla para los rankings de los competidores
CREATE TABLE IF NOT EXISTS Rankings (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Fecha DATE,
    Posicion INT,
    NombreCompetidor VARCHAR(100),
);


-- Inserta los datos de los Mr. Olympia con sus categorías y competidores
INSERT INTO Rankings (Fecha, Posicion, NombreCompetidor) VALUES
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
('1976-01-01', 3, 'Tom Stelluti');

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
