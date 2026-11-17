import 'package:flutter/material.dart';

class ResultadoPage extends StatelessWidget{
  final double num1;
  final double num2;
  final String operacao;
  final double resultado;

  const ResultadoPage({
    super.key,
    required this.num1,
    required this.num2,
    required this.operacao,
    required this.resultado,
  });

  @override 
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("Resultado"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Card(
          elevation: 4, //Sombra do card
          margin: const EdgeInsets.all(16), //Margem externa
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                //Texto "Equação"
                Text("Equação"),
                //Exibe a equação: num1 operacao num2
                Text(
                  '$num1 $operacao $num2',
                  style: TextStyle(fontSize: 22)
                ),
                SizedBox(height: 16,),
                Divider(),
                SizedBox(height: 16,),
                //Resultado
                Text("Resultado"),
                SizedBox(height: 8,),
                Text(
                  resultado.toString(),
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.pink
                  ),
                ),

              ],
            ),
          )
        ),
      )
    );
  }
}