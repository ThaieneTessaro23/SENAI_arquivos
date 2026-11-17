import 'package:flutter/material.dart';
import 'package:industria_alimenticia/pages/json_page.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({super.key});

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  // Chave global que controla o formulário
  final _formKey = GlobalKey<FormState>();
  final nomeController = TextEditingController();
  final quantidadeController = TextEditingController();
  String? _categoria;

  //Monta o JSON
  void enviarFormulario() {
    final dadosProduto = {
      "nome": nomeController.text,
      "quantidade": int.parse(quantidadeController.text),
      "categoria": _categoria,
    };

    Navigator.push(context, MaterialPageRoute(builder: (_) => JsonPage(dadosProduto: dadosProduto,)));
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            // Add TextFormFields and ElevatedButton here
            TextFormField(
              controller: nomeController,
              decoration: const InputDecoration(
                labelText: 'Nome do produto',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Preencha este campo!';
                }
                return null;
              },
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: quantidadeController,
              decoration: const InputDecoration(
                labelText: 'Quantidade',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Preencha este campo!';
                }
                return null;
              },
            ),
            SizedBox(height: 16),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: 'Selecione uma opção',
                border: OutlineInputBorder(),
              ),
              initialValue: _categoria,
              items: ['Laticínios', 'Bebidas', 'Panificação']
                  .map(
                    (option) =>
                        DropdownMenuItem(value: option, child: Text(option)),
                  )
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _categoria = value;
                });
              },
              validator: (value) {
                if (value == null) {
                  return 'Por favor, selecione uma opção';
                }
                return null;
              },
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: enviarFormulario,
              child: const Text('Cadastrar'),
            ),
          ],
        ),
      ),
    );
  }
}
