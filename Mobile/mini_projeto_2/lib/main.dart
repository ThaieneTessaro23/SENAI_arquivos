import 'package:flutter/material.dart';
import 'package:mini_projeto_2/pagina_inicial.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navegação entre Páginas - Flutter',
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      home: const PaginaInicial(),
      debugShowCheckedModeBanner: false,
    );
  }
}
