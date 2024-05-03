const express = require('express');
const app = express();

// Middleware para servir archivos estáticos
app.use(express.static('public'));

// Motor de plantillas
app.set('view engine', 'ejs');

// Rutas
app.get('/', (req, res) => {
    res.render('index');
});

// Más configuraciones y rutas...

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
    console.log(`Servidor corriendo en http://localhost:${PORT}`);
});
