import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class Cadastro extends StatefulWidget{
  const Cadastro({super.key});

  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro>{
  //Chave global para validar o formulário
  final _chaveForm = GlobalKey<FormState>();

  //Controladores dos campos
  final nomeController = TextEditingController();
  final cpfController = TextEditingController();
  final emailController = TextEditingController();
  final telefoneController = TextEditingController();
  final cepController = TextEditingController();
  final numeroController = TextEditingController();
  final logradouroController = TextEditingController();
  final bairroController = TextEditingController();
  final cidadeController = TextEditingController();
  final estadoController = TextEditingController();

  //Widget para criação de campos padronizados (inputs)
  Widget _campo({
    required String label, //nome em cima do campo
    required TextEditingController controller, //controlador do campo
    List<TextInputFormatter>? mask, //máscara opcional
    TextInputType tipo = TextInputType.text, //tipo do teclado
    String? Function(String?)? validador, //função de validação
    bool bloqueado = false, //permitir bloquear o campo
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextFormField(
        controller: controller,
        keyboardType: tipo,
        inputFormatters: mask,
        validator: validador,
        readOnly: bloqueado,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
          filled: bloqueado,
          fillColor: bloqueado ? Colors.lightGreenAccent : null,
        ),
      ),
    );
  }

  //Máscaras 
  final cpfMask = MaskTextInputFormatter(mask: "###.###.###-##");
  final telMask = MaskTextInputFormatter(mask: "(##) #####-####");
  final cepMask = MaskTextInputFormatter(mask: "#####-###");

  //Função para buscar os dados do CEP via API ViaCEP
  void _buscarCEP() async {
    //validar CEP
    if(cepController.text.isEmpty || cepController.text.length < 9){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Cadastro enviado!"))
      );
      return;
    }

    try{
      Dio dio = Dio();
      //URL da API
      String url = "https://viacep.com.br/ws/${cepController.text}/json/";
      Response response = await dio.get(url); //Chamada GET

      //Se retornar sucesso
      if(response.statusCode == 200 && response.data["erro"] != true){
        setState(() {
          //Preencher os campos automaticamente
          logradouroController.text = response.data["logradouro"] ?? "";
          bairroController.text = response.data["bairro"] ?? "";
          cidadeController.text = response.data["localidade"] ?? "";
          estadoController.text = response.data["uf"] ?? "";
        });
      }
      else{
        //Caso o CEP não seja encontrado
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("CEP não encontrado!")),
        );
      }

    } catch (e) {
      //Se houver erro
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Erro ao buscar CEP!")),
      );
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _chaveForm,
            child: ListView(
              children: [
                //Campo Nome
                _campo(
                  label: "Nome Completo",
                  controller: nomeController,
                  validador: (value) =>
                    value!.isEmpty ? "Informe o nome!" : null,
                ),
                //Campo CPF
                _campo(
                  label: "CPF",
                  controller: cpfController,
                  mask: [cpfMask],
                  validador: (value) =>
                    value!.length < 14 ? "CPF inválido!" : null,
                ),
                //Campo Email
                _campo(
                  label: "E-mail",
                  controller: emailController,
                  validador: (value) =>
                    value!.contains("@") ? null : "E-mail inválido!",
                ),
                //Campo Telefone
                _campo(
                  label: "Telefone",
                  controller: telefoneController,
                  mask: [telMask],
                  validador: (value) =>
                    value!.length < 15 ? "Telefone inválido!" : null,
                ),
                //Campo CEP + Botão Buscar
                Row(
                  children: [
                    Expanded(
                      child: _campo(
                        label: "CEP",
                        controller: cepController,
                        mask: [cepMask],
                        tipo: TextInputType.number,
                        validador: (value) =>
                          value!.length < 9 ? "CEP inválido" : null
                      ),
                    ),
                    const SizedBox(width: 10,),
                    ElevatedButton(
                      onPressed: _buscarCEP,
                      child: Text("Buscar"),
                    )
                  ],
                ),
                //Campo Logradouro (bloqueado)
                _campo(
                  label: "Logradouro",
                  controller: logradouroController,
                  bloqueado: true,
                  validador: (value) =>
                    value!.isEmpty ? "Campo obrigatório!" : null,
                ),
                //Campo Número (editável)
                _campo(
                  label: "Número",
                  controller: numeroController,
                  tipo: TextInputType.number,
                  validador: (value) =>
                    value!.isEmpty ? "Campo obrigatório!" : null,
                ),
                //Campo Bairro (bloqueado)
                _campo(
                  label: "Bairro",
                  controller: bairroController,
                  bloqueado: true,
                  validador: (value) =>
                    value!.isEmpty ? "Campo obrigatório!" : null,
                ),
                //Campo Cidade (bloqueado)
                _campo(
                  label: "Cidade",
                  controller: cidadeController,
                  bloqueado: true,
                  validador: (value) =>
                    value!.isEmpty ? "Campo obrigatório!" : null,
                ),
                //Campo Estado (bloqueado)
                _campo(
                  label: "Estado",
                  controller: estadoController,
                  bloqueado: true,
                  validador: (value) =>
                    value!.isEmpty ? "Campo obrigatório!" : null,
                ),
                //Botão final
                ElevatedButton(
                  //Botão grande
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50),
                  ),
                  onPressed: () {
                    //validar a chave do form
                    if(_chaveForm.currentState!.validate()){
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Cadastro enviado!"))
                      );
                    }
                  },
                  child: Text("Cadastrar!"),
                ),
              ],
            ),
          ),
        ),
      );
  }
}