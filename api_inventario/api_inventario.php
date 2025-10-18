<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE");
header("Access-Control-Allow-Headers: Content-Type");
header("Content-Type: application/json");

include 'conexion.php';

// Método HTTP usado
$metodo = $_SERVER['REQUEST_METHOD'];

switch ($metodo) {
    case 'GET':
        // Si se envía un ID, muestra un producto específico
        if (isset($_GET['id'])) {
            $id = $_GET['id'];
            $sql = $conexion->prepare("SELECT * FROM productos WHERE id = ?");
            $sql->execute([$id]);
            echo json_encode($sql->fetch(PDO::FETCH_ASSOC));
        } else {
            // Si no, muestra todos los productos
            $sql = $conexion->query("SELECT * FROM productos");
            echo json_encode($sql->fetchAll(PDO::FETCH_ASSOC));
        }
        break;

    case 'POST':
        $data = json_decode(file_get_contents("php://input"), true);
        if (!empty($data['nombre']) && !empty($data['precio']) && isset($data['stock'])) {
            $sql = $conexion->prepare("INSERT INTO productos (nombre, descripcion, categoria, precio, stock, proveedor, codigo_barras) VALUES (?, ?, ?, ?, ?, ?, ?)");
            $sql->execute([
                $data['nombre'],
                $data['descripcion'] ?? 'Sin descripción',
                $data['categoria'] ?? 'Sin categoría',
                $data['precio'],
                $data['stock'],
                $data['proveedor'] ?? 'Desconocido',
                $data['codigo_barras'] ?? uniqid()
            ]);
            echo json_encode(["mensaje" => "Producto agregado correctamente"]);
        } else {
            echo json_encode(["error" => "Datos incompletos"]);
        }
        break;

    case 'PUT':
        $data = json_decode(file_get_contents("php://input"), true);
        if (!empty($data['id']) && !empty($data['nombre'])) {
            $sql = $conexion->prepare("UPDATE productos SET nombre=?, descripcion=?, categoria=?, precio=?, stock=?, proveedor=? WHERE id=?");
            $sql->execute([
                $data['nombre'],
                $data['descripcion'] ?? '',
                $data['categoria'] ?? '',
                $data['precio'],
                $data['stock'],
                $data['proveedor'] ?? '',
                $data['id']
            ]);
            echo json_encode(["mensaje" => "Producto actualizado correctamente"]);
        } else {
            echo json_encode(["error" => "Datos incompletos"]);
        }
        break;

    case 'DELETE':
        if (isset($_GET['id'])) {
            $sql = $conexion->prepare("DELETE FROM productos WHERE id = ?");
            $sql->execute([$_GET['id']]);
            echo json_encode(["mensaje" => "Producto eliminado correctamente"]);
        } else {
            echo json_encode(["error" => "Falta el ID del producto"]);
        }
        break;

    default:
        echo json_encode(["error" => "Método no permitido"]);
        break;
}
?>