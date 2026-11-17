import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; //biblioteca http
import 'dart:convert'; //pacote para gerar JSON

class EditarComponentePage extends StatefulWidget {
  //variavel para armazenar o componente que será editado
  final Map<String, dynamic> componente;

  const EditarComponentePage({super.key, required this.componente});

  @override
  State<EditarComponentePage> createState() => _EditarComponentePageState();
}

class _EditarComponentePageState extends State<EditarComponentePage> {
  //Variáveis para armazenar os valores dos campos do formulário
  final formKey = GlobalKey<FormState>();
  late final TextEditingController codigoController;
  late final TextEditingController nomeController;
  late final TextEditingController estoqueController;

  //Indica se os dados estão sendo enviados para a API
  bool salvando = false;

  //Variavel para armazenar a mensagem de erro
  String? erro;

  @override
  void initState(){
    super.initState();

    //inicializa os controladores de texto com os valores do MODELO
    codigoController = TextEditingController(
      text: widget.componente['CODIGO']
    );

    nomeController = TextEditingController(
      text: widget.componente['NOME']
    );
    
     estoqueController = TextEditingController(
      text: widget.componente['ESTOQUE']
    );
  
  }

  //Função para editar o componente na API
  Future<void>editarComponente()async{
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
    }

    //Montar o JSON com os dados do formulário
    final dadosComponente = {
      "CODIGO": codigoController.text.trim(),
      "NOME": nomeController.text.trim(),
      "ESTOQUE": int.tryParse(estoqueController.text.trim()) ?? 0,
    };

    //Indicar que os dados estão sendo salvos
    setState(() {
      salvando = true;
    });

    //Tentar enviar os dados para a API
    try{
      final id = widget.componente['ID'];

      //Faz uma requisição PUT na API
      final response = await http.put(
        Uri.parse(
          'http://desktop-cb35gig/industria_automotiva_api/public/api/componentes/$id'
        ),
        //Informar para a API que os dados são em JSON
        headers: {
          'Accept' : 'application/json',
          'Content-type': 'application/json'
        },
        body: jsonEncode(dadosComponente)
      );

      //Verifica se o resultado foi "sucesso"
      if(response.statusCode == 200 || response.statusCode == 204){
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Componente atualizado!')),
        );

        Navigator.pop(context, true);
      }
    }
    catch (e){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro ao acessar a API: $e')),
      );
    }
    finally {
      //Atualiza a tela para indicar que o envio terminou
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
          'Editar Componente',
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
                      'Dados do componente',
                      style: TextStyle(
                        color: textColor,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 24),
                    TextFormField(
                      controller: codigoController,
                      maxLength: 100,
                      decoration: const InputDecoration(
                        labelText: 'Código',
                        prefixIcon: Icon(Icons.directions_car_outlined),
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Informe o código';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
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
                    TextFormField(
                      controller: estoqueController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Estoque',
                        prefixIcon: Icon(Icons.calendar_month_outlined),
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Informe o estoque';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    const SizedBox(height: 24),
                    SizedBox(
                      height: 52,
                      child: FilledButton.icon(
                        onPressed: editarComponente,
                        style: FilledButton.styleFrom(
                          backgroundColor: primaryColor,
                        ),
                        icon: const Icon(Icons.save_outlined),
                        label: const Text(
                          'ATUALIZAR',
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