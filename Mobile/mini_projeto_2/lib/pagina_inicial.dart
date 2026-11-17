import 'package:flutter/material.dart';
import 'package:mini_projeto_2/contato.dart';
import 'package:mini_projeto_2/cursos_formacoes.dart';
import 'package:mini_projeto_2/filmes_series.dart';
import 'package:mini_projeto_2/hobbies.dart';
import 'package:mini_projeto_2/sobre_mim.dart';

class PaginaInicial extends StatelessWidget{
  const PaginaInicial({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Página Inicial ✨'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            ElevatedButton(
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SobreMim(nome: 'Thati', idade: 17),
                  )
                );
              },
              child: const Text("Sobre Mim"),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Hobbies(primeiro: 'Desenhar', segundo: 'Jogar'),
                  )
                );
              },
              child: const Text("Hobbies"),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Cursos(nome1: 'Desenvolvimento de Sistemas', nome2: "Inglês"),
                  )
                );
              },
              child: const Text("Cursos/Formações"),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Filmes(nome1: 'Como Treinar seu Dragão', nome2: 'Avatar'),
                  )
                );
              },
              child: const Text("Filmes e Séries"),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Contato(nome1: '(19)99112-6878', nome2: 'thaienetessaro@gamil.com'),
                  )
                );
              },
              child: const Text("Contato"),
            ),

          ],
        ),
      ),
    );
  }
}