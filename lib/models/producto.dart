class Producto {
  final int id;
  final String nombre;
  final String descripcion;
  final String categoria;
  final String proveedor;
  final String codigoBarras;
  final double precio;
  final int stock;

  Producto({
    required this.id,
    required this.nombre,
    required this.descripcion,
    required this.categoria,
    required this.proveedor,
    required this.codigoBarras,
    required this.precio,
    required this.stock,
  });

  // 🧠 Convierte JSON -> Objeto Producto
  factory Producto.fromJson(Map<String, dynamic> json) {
    return Producto(
      id: int.parse(json['id'].toString()),
      nombre: json['nombre'] ?? '',
      descripcion: json['descripcion'] ?? '',
      categoria: json['categoria'] ?? '',
      proveedor: json['proveedor'] ?? '',
      codigoBarras: json['codigo_barras'] ?? '',
      precio: double.parse(json['precio'].toString()),
      stock: int.parse(json['stock'].toString()),
    );
  }

  // 🔁 Convierte Objeto -> JSON (para enviar al backend)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nombre': nombre,
      'descripcion': descripcion,
      'categoria': categoria,
      'proveedor': proveedor,
      'codigo_barras': codigoBarras,
      'precio': precio,
      'stock': stock,
    };
  }
}