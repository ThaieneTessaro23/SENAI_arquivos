import 'package:flutter/material.dart';

class Contato extends StatelessWidget{
  final String nome1;
  final String nome2;

  const Contato({super.key, required this.nome1, required this.nome2});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar( 
        title: const Text('Contato 🥸'),
        backgroundColor: Colors.amberAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Telefone: $nome1"),
            Text("E-mail: $nome2"),

            const SizedBox(height: 20),

            ElevatedButton (
              onPressed: (){
                Navigator.pop(context);
              },
              child: const Text("<-- Voltar"),
            ),
          ],
        ),
      ),
    );
  }
}