import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; //biblioteca http
import 'dart:convert'; //pacote para gerar JSON

class EditarModeloPage extends StatefulWidget {
  //Variável para armazenar o modelo que será editado
  final Map<String, dynamic> modelo;

  const EditarModeloPage({super.key, required this.modelo});

  @override
  State<EditarModeloPage> createState() => _EditarModeloPageState();
}

class _EditarModeloPageState extends State<EditarModeloPage> {
  //Variáveis para armazenar os valores dos campos do formulário
  final formKey = GlobalKey<FormState>();
  late final TextEditingController nomeController;
  late final TextEditingController anoController;

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

  //Variável para armazenar a mensagem de erro
  String? erro;

  @override
  void initState(){
    super.initState();

    //Inicializa os controladores de texto com os valores do MODELO
    nomeController = TextEditingController(
      text: widget.modelo['NOME']
    );

    anoController = TextEditingController(
      text: widget.modelo['ANO_MODELO']
    );

    categoria = widget.modelo['CATEGORIA'];

    ativo = widget.modelo['ATIVO'].toString() == '1';
  }

  //Função para editar o modelo na API
  Future<void> editarModelo() async{
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
      final id = widget.modelo['ID'];

      //Faz uma requisição PUT na API
      final response = await http.put(
        Uri.parse(
          'http://desktop-cb35gig/industria_automotiva_api/public/api/modelos/$id'
        ),
        //informaq para a API que os dados são em JSON
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json'
        },
        body: jsonEncode(dadosModelo)
      );

        //verificar se o resultado foi sucesso 
      if(response.statusCode == 200 || response.statusCode == 204){
        ScaffoldMessenger.of(context).showSnackBar(
           SnackBar(content: Text('Modelo Atualizado!')),
        );

        Navigator.pop(context, true);
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
          'Editar Modelo',
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
                        onPressed: editarModelo,
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