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
    "1- Nem tudo merece sua preocupação",
    "2- Escolha com cuidado suas batalhas",
    "3- Crescer dói, mas vale a pena",
    "4- Problemas fazem parte da vida",
    "5- Assuma responsabilidade pelas suas escolhas",
    "6- Errar é parte do processo",
    "7- Nem todo mundo vai gostar de você",
    "8- Dizer não também é maturidade",
    "9- O desconforto traz evolução",
    "10- Pare de buscar aprovação constante",

    "11- Você não precisa ser perfeito",
    "12- Falhar ensina mais que vencer",
    "13- Se importe menos com opiniões alheias",
    "14- Coragem é agir mesmo com medo",
    "15- Nem toda crítica é um ataque",
    "16- Comparação rouba sua paz",
    "17- Aceitar limites traz liberdade",
    "18- Reclamar não resolve problemas",
    "19- A vida não deve nada a ninguém",
    "20- Sucesso exige desconforto",

    "21- Nem tudo é sobre você",
    "22- Crescimento começa na responsabilidade",
    "23- Fugir do problema só adia a solução",
    "24- A verdade pode doer, mas liberta",
    "25- Autoconhecimento evita frustrações",
    "26- Se tudo é prioridade, nada é prioridade",
    "27- Expectativas irreais geram frustração",
    "28- Disciplina supera motivação",
    "29- Você escolhe suas dores",
    "30- Maturidade é saber perder",

    "31- Se preocupar com tudo é a receita perfeita para enlouquecer",
    "32- Nem todo drama merece plateia",
    "33- Às vezes o melhor plano é simplesmente começar",
    "34- Reclamar da vida não paga boleto",
    "35- Se todo mundo é especial, ninguém é especial",
    "36- A vida não é um conto de fadas, e tudo bem",
    "37- Focar no que importa economiza energia mental",
    "38- Você não controla tudo, e isso é normal",
    "39- A verdade pode machucar, mas a mentira destrói",
    "40- Crescer é aprender a lidar com frustrações",

    "41- Nem todo problema precisa virar novela mexicana",
    "42- Você não é o protagonista do mundo inteiro",
    "43- Às vezes ligar o modo ‘tanto faz’ salva sua sanidade",
    "44- Maturidade é parar de terceirizar culpa",
    "45- Autenticidade afasta quem não combina com você",
    "46- Se importar menos pode significar viver mais",
    "47- O fracasso não define seu valor",
    "48- Ficar se explicando demais só cansa",
    "49- Aceitar imperfeições traz leveza",
    "50- A paz começa quando você escolhe suas prioridades"
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
          title: const Text("Coach do livro"),
          backgroundColor: Color(0xFFD11F00),
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
              Image.asset("assets/images/foda_se.jpg", width: 300,),
              Text(
                _fraseGerada,
                style: const TextStyle(fontSize: 17, color: Colors.orange)
              ),
              ElevatedButton(
                onPressed: gerarFrase,
                child: Text("Nova Verdade"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFFF5639)
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