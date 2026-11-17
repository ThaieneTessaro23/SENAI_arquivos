import 'package:flutter/material.dart';

class SegundaTela extends StatelessWidget{
  final String nome;
  final int idade;

  const SegundaTela({super.key, required this.nome, required this.idade});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar( 
        title: const Text('Segunda Tela'),
        backgroundColor: Colors.amberAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Nome: $nome"),
            Text("Idade: $idade"),
            ElevatedButton (
              onPressed: (){
                Navigator.pop(context);
              },
              child: const Text("Voltar para a tela principal"),
            ),
          ],
        ),
      ),
    );
  }
}