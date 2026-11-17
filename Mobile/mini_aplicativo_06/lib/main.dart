import 'package:flutter/material.dart';
import 'package:mini_aplicativo_06/animais.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Animais(), 
      debugShowCheckedModeBanner: false,
    );
  }
}
