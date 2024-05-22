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
    database: 'usuariosDB' // Asegúrate de cambiar esto al nombre correcto de tu base de datos
});

conexion.connect(err => {
    if (err) {
        console.error('Error de conexión: ' + err.message);
        return;
    }
    console.log('Conexión establecida con la base de datos.');
});

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
app.use(express.urlencoded({ extended: true }));
app.use(express.json());
app.use(session({
    secret: 'secreto', // Cambia esto a una cadena aleatoria y única
    resave: false,
    saveUninitialized: false
}))


// Motor de plantillas - si no estás usando EJS, puedes comentar o remover esta línea
app.set('view engine', 'ejs');

// Rutas
app.get('/', (req, res) => {
    res.sendFile(__dirname + '/pages/index.html');
});

// Ruta para obtener el ranking de culturistas
app.get('/obtener_top_culturistas', (req, res) => {
    const año = req.query.año;
    const sql = `
        SELECT mrOranking.Categoria, mrOranking.Posicion, mrOranking.NombreCompetidor
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
            let respuesta = `<h3>Año ${año}:</h3>`;
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
            let respuesta = "<table border='1' class='ranking'>";
            respuesta += `<tr><th>Año ${año}</th></tr>`;
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


app.post('/guardar_calorias', (req, res) => {
    const { calories, protein, fat } = req.body;
    const userId = req.session.userId; // Asumiendo que estás utilizando sesiones para manejar la autenticación

    if (!userId) {
        return res.status(401).json({ message: 'Usuario no autenticado' });
    }

    const sql = 'INSERT INTO dieta (usuario_id, calorias, proteinas, grasas) VALUES (?, ?, ?, ?)';

    dbUsuarios.query(sql, [userId, calories, protein, fat], (error, resultados) => {
        if (error) {
            console.error(error);
            return res.status(500).json({ message: 'Error en el servidor al guardar los datos de calorías.' });
        }
        res.json({ message: 'Datos de calorías guardados con éxito.' });
    });
});

app.get('/mostrar_calorias', (req, res) => {
    const userId = req.session.userId; // Asumiendo que estás utilizando sesiones para manejar la autenticación

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
    const userId = req.session.userId; // Asumiendo que estás utilizando sesiones para manejar la autenticación
    const planificacion = req.body;
  
    if (!userId) {
      return res.status(401).json({ message: 'Usuario no autenticado' });
    }
    
    const insertQuery = 'INSERT INTO planificacion_sbd (usuario_id, semana, peso_sentadilla, peso_banca, peso_muerto) VALUES (?, ?, ?, ?, ?)';
    
    // Utilizar async/await para insertar los datos de cada semana de forma secuencial
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

// Función para insertar los datos de una semana en la base de datos
async function insertarSemana(userId, semanaData, insertQuery) {
    return new Promise((resolve, reject) => {
        dbUsuarios.query(insertQuery, [userId, semanaData.semana, semanaData.pesoSentadilla, semanaData.pesoBanca, semanaData.pesoMuerto], (error, results, fields) => {
            if (error) {
                reject(error);
            } else {
                resolve();
            }
        });
    });
}

  
  app.get('/mostrar_sbd', (req, res) => {
    const userId = req.session.userId; // Asumiendo que estás utilizando sesiones para manejar la autenticación

    if (!userId) {
        return res.status(401).json({ message: 'Usuario no autenticado' });
    }

    const sql = 'SELECT semana, peso_sentadilla, peso_banca, peso_muerto FROM planificacion_sbd WHERE usuario_id = ?';

    dbUsuarios.query(sql, [userId], (error, resultados) => {
        if (error) {
            console.error(error);
            return res.status(500).json({ message: 'Error en el servidor al recuperar los datos de la planificación de entrenamiento.' });
        }

        if (resultados.length === 0) {
            return res.status(404).json({ message: 'No se encontraron datos de planificación de entrenamiento para este usuario.' });
        }

        const planificacion = resultados.map(item => {
            const { semana, peso_sentadilla, peso_banca, peso_muerto } = item;
            return { semana, peso_sentadilla, peso_banca, peso_muerto };
        });

        res.json(planificacion);
    });
});




app.get('/logout', (req, res) => {
    req.session.destroy();
    res.redirect('/register.html'); // Redirige al usuario a la página de inicio o a donde desees
});
