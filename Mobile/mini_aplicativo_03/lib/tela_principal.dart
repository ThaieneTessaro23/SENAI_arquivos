import 'package:flutter/material.dart';
import 'package:mini_aplicativo_03/segunda_tela.dart';

class TelaPrincipal extends StatelessWidget{
  const TelaPrincipal({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tela Principal'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute( 
                builder: (context) => SegundaTela(nome: 'Thati', idade: 17),
              )
            );
          },
          child: const Text("Ir para a segunda tela"),
        ),
      ),
    );
  }
}