import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; //biblioteca http
import 'dart:convert'; //pacote para gerar json

class CadastroModelosPage extends StatefulWidget {
  const CadastroModelosPage({super.key});

  @override
  State<CadastroModelosPage> createState() => _CadastroModelosPageState();
}

class _CadastroModelosPageState extends State<CadastroModelosPage> {
  final formKey = GlobalKey<FormState>();
  final nomeController = TextEditingController();
  final anoController = TextEditingController();

  String? categoria;
  bool ativo = true;

  final categorias = [
    'HATCH',
    'SEDAN',
    'SUV',
    'PICAPE',
  ];

  //indica se os dados estão sendo enviados para API
  bool salvando = false;

  Future<void> salvar() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
    }

    //montar o json com os dados do formulario
    final dadosModelo = {
      "NOME": nomeController.text.trim(),
      "CATEGORIA": categoria,
      "ANO_MODELO": anoController.text.trim(),
      "ATIVO": ativo ? '1' : '0' 
    };

    //indicar que os dados estao sendo salvos
    setState(() {
      salvando = true;
    });

    //tentar enviar os dados para a API
    try{
      //faz uma requisição post na API
      final response = await http.post(
        Uri.parse(
          'http://desktop-cb35gig/industria_automotiva_api/public/api/modelos'
        ),
        //informaq para a API que os dados são em JSON
      headers: {
        'Accept': 'application/json',
        },
        body: jsonEncode(dadosModelo)
      );

        //verificar se o resultado foi sucesso 
      if(response.statusCode == 200 || response.statusCode == 201){
        ScaffoldMessenger.of(context).showSnackBar(
           SnackBar(content: Text('Modelo Cadastrado!')),
        );
      }
    }
    catch (e){
     ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro ao acessar a API: $e')),
      );
    }
    finally{
      //atualiza a tela para indicar que o envio terminou
      setState(() {
        salvando = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF1F4E5F);
    const backgroundColor = Color(0xFFF2F4F5);
    const textColor = Color(0xFF263238);

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: const Text(
          'Cadastro de Modelos',
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: Container(
              padding: const EdgeInsets.all(28),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(
                  color: const Color(0xFFE0E5E7),
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x12000000),
                    blurRadius: 14,
                    offset: Offset(0, 6),
                  ),
                ],
              ),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      'Dados do modelo',
                      style: TextStyle(
                        color: textColor,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 24),
                    TextFormField(
                      controller: nomeController,
                      maxLength: 100,
                      decoration: const InputDecoration(
                        labelText: 'Nome',
                        prefixIcon: Icon(Icons.directions_car_outlined),
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Informe o nome';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    DropdownButtonFormField<String>(
                      value: categoria,
                      decoration: const InputDecoration(
                        labelText: 'Categoria',
                        prefixIcon: Icon(Icons.category_outlined),
                        border: OutlineInputBorder(),
                      ),
                      items: categorias.map((item) {
                        return DropdownMenuItem(
                          value: item,
                          child: Text(item),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          categoria = value;
                        });
                      },
                      validator: (value) {
                        if (value == null) {
                          return 'Selecione a categoria';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: anoController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Ano do modelo',
                        prefixIcon: Icon(Icons.calendar_month_outlined),
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Informe o ano';
                        }
                        if (int.tryParse(value) == null) {
                          return 'Informe um ano válido';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    SwitchListTile(
                      contentPadding: EdgeInsets.zero,
                      title: const Text(
                        'Modelo ativo',
                        style: TextStyle(
                          color: textColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      subtitle: Text(
                        ativo ? 'Ativo' : 'Inativo',
                      ),
                      value: ativo,
                      activeTrackColor: primaryColor,
                      onChanged: (value) {
                        setState(() {
                          ativo = value;
                        });
                      },
                    ),
                    const SizedBox(height: 24),
                    SizedBox(
                      height: 52,
                      child: FilledButton.icon(
                        onPressed: salvar,
                        style: FilledButton.styleFrom(
                          backgroundColor: primaryColor,
                        ),
                        icon: const Icon(Icons.save_outlined),
                        label: const Text(
                          'SALVAR',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}