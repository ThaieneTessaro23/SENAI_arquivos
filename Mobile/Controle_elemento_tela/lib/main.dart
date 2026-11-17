import 'package:flutter/material.dart';
import 'package:mini_aplicativo_4/cadastro.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cadastro de Ferramentas',
      theme: ThemeData( 
        primarySwatch: Colors.indigo, 
      ),
      home: const Cadastrar(),
    );
  }
}
