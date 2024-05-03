<?php
// Establecer conexión con la base de datos
$conexion = new mysqli("localhost", "root", "", "mrOlympiaRanking");

// Verificar la conexión
if ($conexion->connect_error) {
    die("Error de conexión: " . $conexion->connect_error);
}

// Obtener el año seleccionado del parámetro enviado por la solicitud AJAX
$año = $_GET['año'];

// Consulta SQL para obtener el TOP de culturistas para el año seleccionado
$sql = "SELECT * FROM Rankings WHERE Categoria IN ('Open', 'Classic') AND YEAR(Fecha) = $año ORDER BY Posicion ASC LIMIT 3";
$resultado = $conexion->query($sql);

// Verificar si se obtuvieron resultados
if ($resultado->num_rows > 0) {
    // Mostrar los datos en formato HTML
    echo "<h3>TOP de culturistas para el año $año:</h3>";
    echo "<ul>";
    while ($fila = $resultado->fetch_assoc()) {
        echo "<li>{$fila['Posicion']}. {$fila['NombreCompetidor']}</li>";
    }
    echo "</ul>";
} else {
    echo "No hay datos disponibles para el año $año.";
}

// Cerrar la conexión
$conexion->close();
?>
