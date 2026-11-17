import 'package:flutter/material.dart';
import 'package:mini_aplicativo_4/resultado.dart';

class CalculadoraPage extends StatefulWidget{
  const CalculadoraPage({super.key});

  @override
  State<CalculadoraPage> createState() => _CalculadoraPageState();
}

class _CalculadoraPageState extends State<CalculadoraPage>{
  final TextEditingController _num1 = TextEditingController();
  final TextEditingController _num2 = TextEditingController();
  String _operacao = "+";

  //Função que será chamada ao clicar em "Calcular"
  void _calcular(){
    if(_num1.text.isNotEmpty && _num2.text.isNotEmpty){
      final double num1 = double.parse(_num1.text);
      final double num2 = double.parse(_num2.text);

      double resultado;

      switch(_operacao){
        case '+':
          resultado = num1 + num2;
          break;
        case '-':
          resultado = num1 - num2;
          break;
        case '*':
          resultado = num1 * num2;
          break;
        case '/':
          resultado = num1 / num2;
          break;
        default:
          resultado = 0;
      }

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResultadoPage(
            num1: num1,
            num2: num2,
            operacao: _operacao,
            resultado: resultado,
          )
        )
      );

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculadora"),
        backgroundColor: Colors.amber,
      ),
      body: Padding(
        padding:const EdgeInsets.all(16),
        child: Column(
          children:[
            //Campo para o primeiro número 
            TextField(
              controller: _num1,
              keyboardType: TextInputType.number, 
              decoration: const InputDecoration(
                labelText: 'Número 1',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16,),
            //Campo para o segundo número 
            TextField(
              controller: _num2,
              keyboardType: TextInputType.number, 
              decoration: const InputDecoration(
                labelText: 'Número 2',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16,),
            //DropDown para escolher a operação (+, -, *, /)
            DropdownButtonFormField<String>(
              value: _operacao, 
              decoration: const InputDecoration(
                labelText: 'Operação',
                border: OutlineInputBorder(),
              ),
              items: const[
                DropdownMenuItem(value: '+', child: Text("Adição (+)"),),
                DropdownMenuItem(value: '-', child: Text("Subtração (-)"),),
                DropdownMenuItem(value: '*', child: Text("Multiplicação (*)"),),
                DropdownMenuItem(value: '/', child: Text("Divisão (/)"),),
              ],
              onChanged: (value){
                setState((){
                  _operacao = value!;
                });
              },
            ),
            SizedBox(height: 16,),
            ElevatedButton(
              onPressed: _calcular,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
              ),
              child: Text('Calcular', style: TextStyle(fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }
}