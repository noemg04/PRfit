const express = require('express');
const app = express();
const mysql = require('mysql2');

// Conexión a la base de datos
const conexion = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'mrOlympiaRanking'
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
        SELECT Categoria, Posicion, NombreCompetidor
        FROM Rankings
        WHERE YEAR(Fecha) = ?
        AND Categoria IN ('Open', 'Classic', '202', '212', 'Bikini', 'Mens')
        ORDER BY Categoria, Posicion ASC;
    `;

    conexion.query(sql, [año], (error, resultados) => {
        if (error) {
            res.status(500).send('Error en el servidor: ' + error);
            return;
        }

        if (resultados.length > 0) {
            let respuesta = `<h3>TOP de culturistas para el año ${año}:</h3>`;
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
                respuesta += `<h4>${categoria}</h4><ul>`;
                categorias[categoria].forEach(item => {
                    respuesta += `<li>${item}</li>`;
                });
                respuesta += `</ul>`;
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
    const sql = 'SELECT * FROM usuarios WHERE username = ?';

    dbUsuarios.query(sql, [username], (error, resultados) => {
        if (error) return res.status(500).send('Error en el servidor');
        if (resultados.length === 0) return res.status(404).send('Usuario no encontrado');

        const user = resultados[0];
        const isMatch = bcrypt.compareSync(password, user.password);

        if (!isMatch) return res.status(401).send('Contraseña incorrecta');

        res.send('Inicio de sesión exitoso');
    });
});



app.post('/guardar_progresion', (req, res) => {
    const { usuario_id, nombre_progresion, detalles } = req.body;
    const sqlProgresion = 'INSERT INTO progresiones (usuario_id, nombre_progresion) VALUES (?, ?)';

    dbUsuarios.query(sqlProgresion, [usuario_id, nombre_progresion], (error, resultados) => {
        if (error) return res.status(500).send('Error en el servidor');

        const progresionId = resultados.insertId;
        detalles.forEach(detalle => {
            const sqlDetalle = 'INSERT INTO detalles_progresion (progresion_id, sesion, series, repeticiones, peso, fecha) VALUES (?, ?, ?, ?, ?, CURDATE())';
            dbUsuarios.query(sqlDetalle, [progresionId, detalle.sesion, detalle.series, detalle.repeticiones, detalle.peso], (error, resultados) => {
                if (error) return res.status(500).send('Error al guardar detalle de progresión');
            });
        });

        res.json({ message: 'Progresión guardada con éxito' });
    });
});
