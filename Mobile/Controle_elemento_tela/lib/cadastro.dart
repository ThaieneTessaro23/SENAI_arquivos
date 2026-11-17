import 'package:flutter/material.dart';
import 'package:mini_aplicativo_4/visualizacao.dart';

class Cadastrar extends StatefulWidget{
  const Cadastrar({super.key});

  @override
  State<Cadastrar> createState() => _CadastrarState();
}

class _CadastrarState extends State<Cadastrar>{
  final TextEditingController _nome = TextEditingController();
  final TextEditingController _id = TextEditingController();
  final TextEditingController _fabricante = TextEditingController();
  final TextEditingController _quantidade = TextEditingController();
  final TextEditingController _localizacao = TextEditingController();
  final TextEditingController _data = TextEditingController();
  final TextEditingController _observacao = TextEditingController();
  String _tipo = "Manual";


  // DATA
  DateTime? _dataSelecionada;

  Future<void> _selecionarData() async {
    DateTime? data = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (data != null) {
      setState(() {
        _dataSelecionada = data;
        _data.text = "${data.day}/${data.month}/${data.year}";
      });
    }
  }


  //Função que será chamada ao clicar em "Salvar"
  void _salvar(){
    if(_nome.text.isNotEmpty && _id.text.isNotEmpty && _fabricante.text.isNotEmpty && _quantidade.text.isNotEmpty && _localizacao.text.isNotEmpty && _data.text.isNotEmpty && _observacao.text.isNotEmpty){

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResultadoPage(
            nome: _nome.text,
            id: _id.text,
            fabricante: _fabricante.text,
            quantidade: _quantidade.text,
            localizacao: _localizacao.text,
            data: _data.text,
            observacao: _observacao.text,
            tipo: _tipo,
          ),
        ),
      );

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cadastro de Ferramenta"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding:const EdgeInsets.all(16),
        child: Column(
          children:[
            //Campo para Nome
            TextField(
              controller: _nome,
              keyboardType: TextInputType.number, 
              decoration: const InputDecoration(
                labelText: 'Nome da ferramenta',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16,),


            //Campo para o ID
            TextField(
              controller: _id,
              keyboardType: TextInputType.number, 
              decoration: const InputDecoration(
                labelText: 'Código ou ID da ferramenta',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16,),


            //DropDown para escolher o Tipo de Ferramenta
            DropdownButtonFormField<String>(
              initialValue: _tipo, 
              decoration: const InputDecoration(
                labelText: 'Tipo de ferramenta',
                border: OutlineInputBorder(),
              ),
              items: const[
                DropdownMenuItem(value: 'Manual', child: Text("Manual"),),
                DropdownMenuItem(value: 'Elétrica', child: Text("Elétrica"),),
                DropdownMenuItem(value: 'Medição', child: Text("Medição"),),
                DropdownMenuItem(value: 'Outros', child: Text("Outros"),),
              ],
              onChanged: (value){
                setState((){
                  _tipo = value!;
                });
              },
            ),
            SizedBox(height: 16,),


            //Campo para o Fabricante
            TextField(
              controller: _fabricante,
              keyboardType: TextInputType.number, 
              decoration: const InputDecoration(
                labelText: 'Fabricante',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16,),


            //Campo para Quantidade em estoque
            TextField(
              controller: _quantidade,
              keyboardType: TextInputType.number, 
              decoration: const InputDecoration(
                labelText: 'Quantidade em estoque',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16,),


            //Campo para Localização no depósito 
            TextField(
              controller: _localizacao,
              keyboardType: TextInputType.number, 
              decoration: const InputDecoration(
                labelText: 'Localização no depósito',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16,),


            //Campo para Data de aquisição
            TextField(
              controller: _data,
              readOnly: true, // impede digitar
              onTap: _selecionarData, // abre o calendário
              decoration: const InputDecoration(
                labelText: 'Data de aquisição',
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.calendar_today),
              ),
            ),
            SizedBox(height: 16,),


            //Campo para Observações 
            TextField(
              controller: _observacao,
              keyboardType: TextInputType.number, 
              decoration: const InputDecoration(
                labelText: 'Observações ',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16,),


            ElevatedButton(
              onPressed: _salvar,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue.shade900,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
              ),
              child: Text('Cadastrar', style: TextStyle(fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }
}