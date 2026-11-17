import 'package:flutter/material.dart';

class Cursos extends StatelessWidget{
  final String nome1;
  final String nome2;

  const Cursos({super.key, required this.nome1, required this.nome2});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar( 
        title: const Text('Cursos/Formações ⚙️'),
        backgroundColor: Colors.amberAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Curso 1: $nome1"),
            Text("Curso 2: $nome2"),

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