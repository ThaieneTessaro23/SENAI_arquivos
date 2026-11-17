
import 'package:flutter/material.dart';
import 'login_page.dart';

void main() {
  runApp(const IndusVRApp());
}

class IndusVRApp extends StatelessWidget {
  const IndusVRApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'IndusVR',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF0B1F33),
        ),
        scaffoldBackgroundColor: const Color(0xFF0B1F33),
        fontFamily: 'Roboto',
      ),

      // Primeira tela do aplicativo
      home: const LoginPage(),
    );
  }
}
