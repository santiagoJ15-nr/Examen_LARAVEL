import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/producto.dart';

class InventarioService {
  final String baseUrl = 'http://localhost/api_inventario/api_inventario.php';

  // Obtener todos los productos
  Future<List<Producto>> obtenerProductos() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => Producto.fromJson(json)).toList();
    } else {
      throw Exception('Error al obtener productos');
    }
  }

  // Agregar producto
  Future<void> agregarProducto(Producto producto) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'nombre': producto.nombre,
        'descripcion': producto.descripcion,
        'categoria': producto.categoria,
        'precio': producto.precio,
        'stock': producto.stock,
        'proveedor': producto.proveedor,
        'codigo_barras': producto.codigoBarras,
      }),
    );

    if (response.statusCode != 200) {
      throw Exception('Error al agregar producto');
    }
  }

  // Editar producto
  Future<void> editarProducto(Producto producto) async {
    final response = await http.put(
      Uri.parse(baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'id': producto.id,
        'nombre': producto.nombre,
        'descripcion': producto.descripcion,
        'categoria': producto.categoria,
        'precio': producto.precio,
        'stock': producto.stock,
        'proveedor': producto.proveedor,
      }),
    );

    if (response.statusCode != 200) {
      throw Exception('Error al editar producto');
    }
  }

  // Eliminar producto
  Future<void> eliminarProducto(int id) async {
    final response = await http.delete(Uri.parse('$baseUrl?id=$id'));
    if (response.statusCode != 200) {
      throw Exception('Error al eliminar producto');
    }
  }
}