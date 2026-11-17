import 'package:flutter/material.dart';

class SobreMim extends StatelessWidget{
  final String nome;
  final int idade;

  const SobreMim({super.key, required this.nome, required this.idade});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar( 
        title: const Text('Sobre Mim 🗿'),
        backgroundColor: Colors.amberAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Nome: $nome"),
            Text("Idade: $idade"),

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