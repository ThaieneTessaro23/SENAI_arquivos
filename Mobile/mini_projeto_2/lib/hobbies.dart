import 'package:flutter/material.dart';

class Hobbies extends StatelessWidget{
  final String primeiro;
  final String segundo;

  const Hobbies({super.key, required this.primeiro, required this.segundo});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar( 
        title: const Text('Hobbies 🎮'),
        backgroundColor: Colors.amberAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Primeiro: $primeiro"),
            Text("Segundo: $segundo"),

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