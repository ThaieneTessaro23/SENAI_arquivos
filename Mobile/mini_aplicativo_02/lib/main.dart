import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp>{
  final List<String> _frases = [
    "Tudo é possível quando se é inteligente - Barbie em O Quebra Nozes",
    "Amor e Imaginação podem mudar o mundo - Barbie Rapunzel",
  ];

  String _fraseGerada = "Clique aqui para gerar uma frase";

  void gerarFrase(){
    int aleatorio = Random().nextInt(_frases.length);
    setState((){
      _fraseGerada = _frases[aleatorio];
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar( 
          title: const Text("Coach Barbieverso"),
          backgroundColor: Color(0xFFee4a99),
          centerTitle: true,
        ),
        body: Container(
          width: double.infinity,
          color: Colors.white,
          padding: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/images/barbie.webp", width: 300,),
              Text(
                _fraseGerada,
                style: const TextStyle(fontSize: 17, color: Colors.pink)
              ),
              ElevatedButton(
                onPressed: gerarFrase,
                child: Text("Nova Frase"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFee4a99)
                ),
              ),
            ],
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}