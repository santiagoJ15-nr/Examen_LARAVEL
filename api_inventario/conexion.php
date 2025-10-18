<?php
// conexion.php
$host = "localhost"; // Servidor
$user = "root";      // Usuario de MySQL (por defecto en XAMPP)
$pass = "";          // Contraseña (vacía por defecto en XAMPP)
$db = "inventario_tienda"; // Nombre de la base de datos

try {
    $conexion = new PDO("mysql:host=$host;dbname=$db;charset=utf8", $user, $pass);
    $conexion->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    // echo "Conexión exitosa"; // Puedes probarlo si quieres
} catch (PDOException $e) {
    echo json_encode(["error" => "Error de conexión: " . $e->getMessage()]);
    exit;
}
?>