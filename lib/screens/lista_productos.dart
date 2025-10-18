import 'package:flutter/material.dart';
import '../models/producto.dart';
import 'editar_producto.dart'; // 👈 Importamos la pantalla de edición
import 'agregar_producto.dart'; 

class ListaProductosPage extends StatefulWidget {
  const ListaProductosPage({super.key});

  @override
  State<ListaProductosPage> createState() => _ListaProductosPageState();
}

class _ListaProductosPageState extends State<ListaProductosPage> {
  // Lista de productos de prueba (aquí luego conectaremos con la API)
  List<Producto> productos = [
    Producto(
      id: 1,
      nombre: 'Auriculares Bluetooth',
      descripcion: 'Auriculares inalámbricos con cancelación de ruido',
      categoria: 'Electrónica',
      proveedor: 'SoundMax',
      codigoBarras: '100200300',
      precio: 49.99,
      stock: 25,
    ),
    Producto(
      id: 2,
      nombre: 'Polera Algodón Talla M',
      descripcion: 'Polera de algodón 100% para hombre',
      categoria: 'Ropa',
      proveedor: 'Textiles Perú',
      codigoBarras: '200300400',
      precio: 19.50,
      stock: 40,
    ),
    Producto(
      id: 3,
      nombre: 'Laptop HP 14"',
      descripcion: 'Laptop HP con 8GB RAM y 512GB SSD',
      categoria: 'Computadoras',
      proveedor: 'HP Inc.',
      codigoBarras: '300400500',
      precio: 2599.00,
      stock: 10,
    ),
    Producto(
      id: 4,
      nombre: 'Mouse Gamer RGB',
      descripcion: 'Mouse ergonómico con luces RGB personalizables',
      categoria: 'Accesorios',
      proveedor: 'LogiTech',
      codigoBarras: '400500600',
      precio: 89.90,
      stock: 60,
    ),
    Producto(
      id: 5,
      nombre: 'Zapatillas Running',
      descripcion: 'Zapatillas deportivas ligeras talla 42',
      categoria: 'Calzado',
      proveedor: 'SportLine',
      codigoBarras: '500600700',
      precio: 149.00,
      stock: 35,
    ),
    Producto(
      id: 6,
      nombre: 'Smartwatch Pro',
      descripcion: 'Reloj inteligente con sensor de ritmo cardíaco',
      categoria: 'Electrónica',
      proveedor: 'TechWear',
      codigoBarras: '600700800',
      precio: 399.00,
      stock: 20,
    ),
    Producto(
      id: 7,
      nombre: 'Mochila Impermeable 30L',
      descripcion: 'Mochila resistente al agua con múltiples compartimentos',
      categoria: 'Accesorios',
      proveedor: 'Adventure Gear',
      codigoBarras: '700800900',
      precio: 89.50,
      stock: 50,
    ),
  ];

  void _editarProducto(Producto producto, int index) async {
    final Producto? productoEditado = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditarProductoPage(producto: producto),
      ),
    );

    if (productoEditado != null) {
      setState(() {
        productos[index] = productoEditado;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Producto actualizado ✅')),
      );
    }
  }

  void _eliminarProducto(int index) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Eliminar producto'),
        content: const Text('¿Estás seguro de eliminar este producto?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                productos.removeAt(index);
              });
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Producto eliminado 🗑️')),
              );
            },
            child: const Text(
              'Eliminar',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inventario de Productos'),
        backgroundColor: Colors.blueGrey,
      ),
      body: ListView.builder(
        itemCount: productos.length,
        itemBuilder: (context, index) {
          final p = productos[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: ListTile(
              title: Text(p.nombre),
              subtitle: Text('Precio: S/ ${p.precio} | Stock: ${p.stock}'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit, color: Colors.blue),
                    onPressed: () => _editarProducto(p, index),
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () => _eliminarProducto(index),
                  ),
                ],
              ),
              onTap: () {
                // Aquí más adelante abriremos detalle_producto.dart
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
  onPressed: () async {
    final Producto? nuevoProducto = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AgregarProductoPage()),
    );

    if (nuevoProducto != null) {
      setState(() {
        productos.add(nuevoProducto);
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Producto agregado ✅')),
      );
    }
  },
  child: const Icon(Icons.add),
),
    );
  }
}
