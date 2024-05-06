const express = require('express');
const app = express();
const mysql = require('mysql2')

// Middleware para servir archivos estáticos
app.use(express.static('pages'));
app.use(express.static('imagenes'));

// Motor de plantillas
app.set('view engine', 'ejs');

// Rutas
app.get('/', (req, res) => {
    res.sendFile(__dirname + '/pages/index.html');
});

// Más configuraciones y rutas...

app.listen(3000, () => {
    console.log(`Servidor corriendo`);
});

const db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'mrOlympiaRanking',//Nombre de la base de datos
});

db.connect((err) => {
    if (err){
        console.log('Error al conectar a BD: ', err);
        return;
    }
    console.log('Conexion realizada');
});