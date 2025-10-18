import 'package:flutter/material.dart';
import 'screens/lista_productos.dart';
import 'screens/agregar_producto.dart';
import 'screens/editar_producto.dart';
import 'screens/detalle_producto.dart';
import 'models/producto.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Inventario Tienda',
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      home: const ListaProductosPage(),
      routes: {
        '/agregar': (context) => const AgregarProductoPage(),
        

      },
    );
    
  }
}