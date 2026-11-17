import 'package:flutter/material.dart';

class ResultadoPage extends StatelessWidget{
  final String nome;
  final String id;
  final String fabricante;
  final String quantidade;
  final String localizacao;
  final String data;
  final String observacao;
  final String tipo;

  const ResultadoPage({
    super.key,
    required this.nome,
    required this.id,
    required this.fabricante,
    required this.quantidade,
    required this.localizacao,
    required this.data,
    required this.observacao,
    required this.tipo,
  });

  @override 
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dados Salvos"),
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
                Text("Dados Informados"),
                SizedBox(height: 16),

                Text(
                  'Nome da ferramenta: $nome',
                  style: TextStyle(fontSize: 18),
                ),

                Text(
                  'ID: $id',
                  style: TextStyle(fontSize: 18),
                ),

                Text(
                  'Tipo de ferramenta: $tipo',
                  style: TextStyle(fontSize: 18),
                ),

                Text(
                  'Fabricante: $fabricante',
                  style: TextStyle(fontSize: 18),
                ),

                Text(
                  'Quantidade em estoque: $quantidade',
                  style: TextStyle(fontSize: 18),
                ),

                Text(
                  'Localização no depósito: $localizacao',
                  style: TextStyle(fontSize: 18),
                ),

                Text(
                  'Data de aquisição: $data',
                  style: TextStyle(fontSize: 18),
                ),

                Text(
                  'Observações: $observacao',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          )
        ),
      )
    );
  }
}