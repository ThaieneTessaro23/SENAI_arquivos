import 'package:flutter/material.dart';
import 'package:industria_quimica/pagina_inicial.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Elementra - Indústria Química',
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      home: const PaginaInicial(),
      debugShowCheckedModeBanner: false,
    );
  }
}
