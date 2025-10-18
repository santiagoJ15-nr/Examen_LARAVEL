import 'package:flutter/material.dart';
import '../models/producto.dart';

class DetalleProductoPage extends StatelessWidget {
  final Producto producto;
  const DetalleProductoPage({super.key, required this.producto});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(producto.nombre)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nombre: ${producto.nombre}',
                style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Text('Precio: S/ ${producto.precio}',
                style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Text('Stock: ${producto.stock}',
                style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}