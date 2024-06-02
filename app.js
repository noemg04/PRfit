const express = require('express');
const session = require('express-session');
const app = express();
const mysql = require('mysql2');

// Conexión a la base de datos
const conexion = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'topRanking'
});

//Segunda base de datos, progresiones
const dbUsuarios = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'usuariosDB'
});

// Conexión a la base de datos principal
conexion.connect(err => {
    if (err) {
        console.error('Error de conexión: ' + err.message);
        return;
    }
    console.log('Conexión establecida con la base de datos.');
});

// Conexión a la base de datos de usuarios
dbUsuarios.connect(err => {
    if (err) {
        console.error('Error al conectar a la base de datos de usuarios: ' + err.message);
        return;
    }
    console.log('Conexión establecida con la base de datos de usuarios.');
});

// Middleware para servir archivos estáticos desde la carpeta 'pages'
app.use(express.static('pages'));
app.use(express.static('imagenes'));
app.use('/styles', express.static(__dirname + '/styles'));
app.use(express.urlencoded({ extended: true }));
app.use(express.json());
app.use(session({
    secret: 'secreto',// Mi palabra secreta
    resave: false,
    saveUninitialized: false
}))


app.set('view engine', 'ejs');

// Rutas
app.get('/', (req, res) => {
    res.sendFile(__dirname + '/pages/index.html');
});

// Ruta para obtener el ranking de culturistas
app.get('/obtener_top_culturistas', (req, res) => {
    const año = req.query.año;
    const sql = `
        SELECT mrOranking.Categoria, mrOranking.Posicion, mrOranking.NombreCompetidor, mrOranking.EnlaceWikipedia
        FROM mrOranking
        JOIN mrOcategorias ON mrOranking.Categoria = mrOcategorias.Nombre
        WHERE YEAR(mrOranking.Fecha) = ?
        AND mrOcategorias.Nombre IN ('Open', 'Classic', '202', '212', 'Bikini', 'Mens')
        ORDER BY mrOranking.Categoria, mrOranking.Posicion ASC;
    `;

    conexion.query(sql, [año], (error, resultados) => {
        if (error) {
            res.status(500).send('Error en el servidor: ' + error);
            return;
        }

        if (resultados.length > 0) {
            let respuesta = `<h3>Año ${año}</h3>`;
            let categoriaActual = null;
            let categorias = {};

            // Agrupar los resultados por categoría
            resultados.forEach(fila => {
                if (!categorias[fila.Categoria]) {
                    categorias[fila.Categoria] = [];
                }
                const competidor = fila.EnlaceWikipedia 
                    ? `<a href="${fila.EnlaceWikipedia}" target="_blank">${fila.Posicion}. ${fila.NombreCompetidor}</a>`
                    : `${fila.Posicion}. ${fila.NombreCompetidor}`;
                categorias[fila.Categoria].push(competidor);
            });

            // Construir la respuesta HTML para cada categoría
            Object.keys(categorias).forEach(categoria => {
                respuesta += "<table border='1' class='ranking'>";
                respuesta += `<tr><th colspan="${categorias[categoria].length}">${categoria}</th></tr>`;
                respuesta += "<tr>";
                categorias[categoria].forEach(item => {
                    respuesta += `<td>${item}</td>`;
                });
                respuesta += "</tr>";
                respuesta += "</table>";
            });

            res.send(respuesta);
        } else {
            res.send(`No hay datos disponibles para el año ${año}.`);
        }
    });
});


// Ruta para obtener el ranking de powerlifters
app.get('/obtener_top_powerlifters', (req, res) => {
    const año = req.query.año;
    const sql = `
        SELECT Posicion, NombreCompetidor
        FROM ipfRanking
        WHERE YEAR(Fecha) = ?;
    `;

    conexion.query(sql, [año], (error, resultados) => {
        if (error) {
            res.status(500).send('Error en el servidor: ' + error);
            return;
        }

        if (resultados.length > 0) {
            let respuesta = `<h3>Año ${año}</h3>`;
            let categoriaActual = null;
            let categorias = {};

            // Agrupar los resultados por categoría
            resultados.forEach(fila => {
                if (!categorias[fila.Categoria]) {
                    categorias[fila.Categoria] = [];
                }
                categorias[fila.Categoria].push(`${fila.Posicion}. ${fila.NombreCompetidor}`);
            });

            // Construir la respuesta HTML para cada categoría
            Object.keys(categorias).forEach(categoria => {
                respuesta += "<table border='1' class='ranking'>";
                respuesta += `<tr><th colspan="3">Open</th></tr>`;
                respuesta += "<tr>";
                categorias[categoria].forEach(item => {
                    respuesta += `<td>${item}</td>`;
                });
                respuesta += "</tr>";
                respuesta += "</table>";
            });
            

            res.send(respuesta);
        } else {
            res.send(`No hay datos disponibles para el año ${año}.`);
        }
    });
});


// Escucha del servidor
app.listen(3000, () => {
    console.log(`Servidor corriendo en http://localhost:3000`);
});

const bcrypt = require('bcryptjs');

// Ruta para registrar un nuevo usuario
app.post('/register', (req, res) => {
    const { username, email, password } = req.body;
    const salt = bcrypt.genSaltSync(10);
    const hash = bcrypt.hashSync(password, salt);

    const sql = 'INSERT INTO usuarios (username, email, password) VALUES (?, ?, ?)';

    dbUsuarios.query(sql, [username, email, hash], (error, resultados) => {
        if (error) {
            res.status(500).json({ message: 'Error en el servidor: ' + error.message });
        } else {
            res.json({ message: 'Usuario registrado con éxito' });
        }
    });
});

// Ruta para iniciar sesión de un usuario
app.post('/login', (req, res) => {
    const { username, password } = req.body;
    const sql = 'SELECT id, password FROM usuarios WHERE username = ?';

    dbUsuarios.query(sql, [username], (error, resultados) => {
        if (error) return res.status(500).send('Error en el servidor');
        if (resultados.length === 0) return res.status(404).send('Usuario no encontrado');

        const user = resultados[0];
        const isMatch = bcrypt.compareSync(password, user.password);

        if (!isMatch) return res.status(401).send('Contraseña incorrecta');

        // Almacenar el ID de usuario en la sesión
        req.session.userId = user.id;

        res.send('Inicio de sesión exitoso');
    });

});

// Ruta para mostrar el nombre de usuario del usuario autenticado
app.get('/mostrar_usuario', (req, res) => {
    const userId = req.session.userId;

    if (!userId) {
        return res.status(401).json({ message: 'Usuario no autenticado' });
    }

    const sql = 'SELECT username FROM usuarios WHERE id = ?';

    dbUsuarios.query(sql, [userId], (error, resultados) => {
        if (error) {
            console.error(error);
            return res.status(500).json({ message: 'Error en el servidor al recuperar el nombre de usuario.' });
        }

        if (resultados.length === 0) {
            return res.status(404).json({ message: 'Usuario no encontrado.' });
        }

        const { username } = resultados[0];
        res.json({ username });
    });
});

// Ruta para guardar los datos de calorías del usuario
app.post('/guardar_calorias', (req, res) => {
    const { calories, protein, fat } = req.body;
    const userId = req.session.userId;

    if (!userId) {
        console.log('Usuario no autenticado');
        return res.status(401).json({ message: 'Usuario no autenticado' });
    }

    console.log(`Guardando datos para el usuario ${userId}: Calorías: ${calories}, Proteínas: ${protein}, Grasas: ${fat}`);

    // Consulta SQL para insertar o actualizar datos
    const sql = 'INSERT INTO dieta (usuario_id, calorias, proteinas, grasas) VALUES (?, ?, ?, ?) ON DUPLICATE KEY UPDATE calorias = VALUES(calorias), proteinas = VALUES(proteinas), grasas = VALUES(grasas)';// ON DUPLICATE KEY UPDATE para sobreescribir

    // Ejecutar la consulta
    dbUsuarios.query(sql, [userId, calories, protein, fat], (error, resultados) => {
        if (error) {
            console.error('Error en el servidor al guardar los datos de calorías:', error);
            return res.status(500).json({ message: 'Error en el servidor al guardar los datos de calorías.' });
        }
        res.json({ message: 'Datos de calorías guardados con éxito.' });
    });
});

// Ruta para mostrar los datos de calorías del usuario autenticado
app.get('/mostrar_calorias', (req, res) => {
    const userId = req.session.userId;

    if (!userId) {
        return res.status(401).json({ message: 'Usuario no autenticado' });
    }

    const sql = 'SELECT calorias, proteinas, grasas FROM dieta WHERE usuario_id = ?';

    dbUsuarios.query(sql, [userId], (error, resultados) => {
        if (error) {
            console.error(error);
            return res.status(500).json({ message: 'Error en el servidor al recuperar los datos de calorías.' });
        }

        if (resultados.length === 0) {
            return res.status(404).json({ message: 'No se encontraron datos de calorías para este usuario.' });
        }

        const { calorias, proteinas, grasas } = resultados[0];
        res.json({ calorias, proteinas, grasas });
    });
});


// Ruta para guardar la planificación de entrenamiento para las 5 semanas
app.post('/guardar_sbd', (req, res) => {
    const userId = req.session.userId;
    const planificacion = req.body;

    if (!userId) {
        return res.status(401).json({ message: 'Usuario no autenticado' });
    }

    const insertQuery = `
        INSERT INTO planificacion_sbd 
        (usuario_id, semana, porcentaje, repeticion, peso_sentadilla, peso_banca, peso_muerto) 
        VALUES (?, ?, ?, ?, ?, ?, ?) 
        ON DUPLICATE KEY UPDATE 
            porcentaje = VALUES(porcentaje), 
            repeticion = VALUES(repeticion), 
            peso_sentadilla = VALUES(peso_sentadilla), 
            peso_banca = VALUES(peso_banca), 
            peso_muerto = VALUES(peso_muerto)
    `;

    (async () => {
        try {
            for (let i = 0; i < planificacion.length; i++) {
                const semanaData = planificacion[i];
                await insertarSemana(userId, semanaData, insertQuery);
                console.log(`Planificación de entrenamiento para la semana ${semanaData.semana} guardada exitosamente.`);
            }
            res.json({ message: 'Planificación de entrenamiento para las semanas guardada exitosamente.' });
        } catch (error) {
            console.error('Error al guardar la planificación:', error);
            res.status(500).json({ error: 'Error al guardar la planificación' });
        }
    })();
});

async function insertarSemana(userId, semanaData, insertQuery) {
    return new Promise((resolve, reject) => {
        dbUsuarios.query(
            insertQuery, 
            [userId, semanaData.semana, semanaData.porcentaje, semanaData.repeticion, semanaData.pesoSentadilla, semanaData.pesoBanca, semanaData.pesoMuerto], 
            (error, results, fields) => {
                if (error) {
                    reject(error);
                } else {
                    resolve();
                }
            }
        );
    });
}

// Ruta para mostrar los datos de planificación de entrenamiento (SBD) del usuario autenticado
app.get('/mostrar_sbd', (req, res) => {
    const userId = req.session.userId;

    if (!userId) {
        return res.status(401).json({ message: 'Usuario no autenticado' });
    }

    const sql = 'SELECT semana, porcentaje, repeticion, peso_sentadilla, peso_banca, peso_muerto FROM planificacion_sbd WHERE usuario_id = ?';

    dbUsuarios.query(sql, [userId], (error, resultados) => {
        if (error) {
            console.error(error);
            return res.status(500).json({ message: 'Error en el servidor al recuperar los datos de la planificación de entrenamiento.' });
        }

        if (resultados.length === 0) {
            return res.status(404).json({ message: 'No se encontraron datos de planificación de entrenamiento para este usuario.' });
        }

        const planificacion = resultados.map(item => {
            const { semana, porcentaje, repeticion, peso_sentadilla, peso_banca, peso_muerto } = item;
            return { semana, porcentaje, repeticion, peso_sentadilla, peso_banca, peso_muerto };
        });

        res.json(planificacion);
    });
});

// Ruta para guardar la planificación de entrenamiento (Smolov JR) del usuario autenticado
app.post('/guardarSmolovJR', (req, res) => {
    const userId = req.session.userId;
    const planificacion = req.body;

    if (!userId) {
        return res.status(401).json({ message: 'Usuario no autenticado' });
    }

    // Consulta SQL para insertar o actualizar datos
    const insertQuery = `
        INSERT INTO planificacion_smolovjr (usuario_id, semana, dia, series, repeticiones, peso)
        VALUES (?, ?, ?, ?, ?, ?)
        ON DUPLICATE KEY UPDATE series = VALUES(series), repeticiones = VALUES(repeticiones), peso = VALUES(peso)
    `;

    // Utilizar async/await para insertar los datos de cada día de forma secuencial
    (async () => {
        try {
            for (let i = 0; i < planificacion.length; i++) {
                const diaData = planificacion[i];
                // Utiliza la consulta SQL definida fuera del bucle
                await insertarDia(userId, diaData, insertQuery);
                console.log(`Planificación de entrenamiento para la semana ${diaData.semana}, día ${diaData.dia} guardada exitosamente.`);
            }
            res.json({ message: 'Planificación de entrenamiento para las semanas guardada exitosamente.' });
        } catch (error) {
            console.error('Error al guardar la planificación:', error);
            res.status(500).json({ error: 'Error al guardar la planificación' });
        }
    })();
});

// Función para insertar los datos de un día en la base de datos
async function insertarDia(userId, diaData, insertQuery) {
    return new Promise((resolve, reject) => {
        dbUsuarios.query(insertQuery, [userId, diaData.semana, diaData.dia, diaData.series, diaData.repeticiones, diaData.peso], (error, results, fields) => {
            if (error) {
                reject(error);
            } else {
                resolve();
            }
        });
    });
}

// Ruta para mostrar los datos de la planificación de entrenamiento (Smolov JR) del usuario autenticado
app.get('/mostrar_smolovjr', (req, res) => {
    const userId = req.session.userId;

    if (!userId) {
        return res.status(401).json({ message: 'Usuario no autenticado' });
    }

    const sql = 'SELECT semana, dia, series, repeticiones, peso FROM planificacion_smolovjr WHERE usuario_id = ?';

    dbUsuarios.query(sql, [userId], (error, resultados) => {
        if (error) {
            console.error(error);
            return res.status(500).json({ message: 'Error en el servidor al recuperar los datos de la planificación de entrenamiento.' });
        }

        if (resultados.length === 0) {
            return res.status(404).json({ message: 'No se encontraron datos de planificación de entrenamiento para este usuario.' });
        }

        const planificacion = resultados.map(item => {
            const { semana, dia, series, repeticiones, peso } = item;
            return { semana, dia, series, repeticiones, peso };
        });

        res.json(planificacion);
    });
});

// Ruta para cerrar la sesión
app.get('/logout', (req, res) => {
    req.session.destroy();
    res.redirect('/register.html'); // Redirige al usuario a la página de inicio o a donde desees
});
