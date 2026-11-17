import 'package:flutter/material.dart';
import 'package:mini_aplicativo_03/tela_principal.dart';

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
      home: const TelaPrincipal(),
      debugShowCheckedModeBanner: false,
    );
  }
}
