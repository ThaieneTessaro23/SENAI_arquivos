import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; //biblioteca http
import 'dart:convert';

import 'package:industria_automobilistica/pages/editar_componentes.dart'; //pacote para gerar JSON

class RelatorioComponentesPage extends StatefulWidget {
  const RelatorioComponentesPage({super.key});

  @override
  State<RelatorioComponentesPage> createState() => _RelatorioComponentesPageState();
}

class _RelatorioComponentesPageState extends State<RelatorioComponentesPage> {
  final ScrollController horizontalController = ScrollController();

  //FIZEMOS COM O GABRIEL
  //Criar uma lista que armazenará os Componentes retornados da API
  List<dynamic> componentes = [];

  //Criar uma variável para indicar se os dados estão carregando
  bool carregando = true;

  //Armazenar uma possível mensagem de erro da API
  String? erro;

  //Criar uma função para rodar toda vez que abrir a página
  @override
  void initState(){
    super.initState();
    consultarComponentes();
  }

  Future<void> consultarComponentes() async {
    try{
      //Faz uma requisição HTTP do tipo GET para a API
      final resposta = await http.get(
        Uri.parse(
          'http://DESKTOP-CB35GIG/industria_automotiva_api/public/api/componentes'
        ),
        //Informar para a API que os dados são em JSON
        headers: {
          'Accept' : 'application/json',
        }
      );

      //Converter a resposta em JSON
      final resultado = jsonDecode(resposta.body);

      //Verifica se a requisição foi concluída com sucesso (200)
      if(resposta.statusCode == 200){
        setState((){
          //Salvar os Componentes em uma variável
          componentes = resultado['data'] ?? [];
          carregando = false;
        });
      }
      else{
        setState((){
          //Salva uma mensagem de erro
          componentes = resultado['message'] ?? 'Erro ao consultar Componentes';
          carregando = false;
        });
      }

    }
    catch(e){
      setState((){
        //Salva uma mensagem de erro
        erro = 'Erro: $e';
        carregando = false;
      });
    }
  }

  //Criar uma função assincrona para excluir um componente pela API
  Future<void> excluirComponente(dynamic componenteId) async{
    try{
      //Faz uma requisição HTTP do tipo DELETE para a API
      final resposta = await http.delete(
        Uri.parse(
          'http://DESKTOP-CB35GIG/industria_automotiva_api/public/api/componentes/$componenteId'
        ),
        //Informar para a API que os dados são em JSON
        headers: {
          'Accept' : 'application/json',
          'Content-Type': 'application/json'
        }
      );

      //Converter a resposta em JSON
      final resultado = jsonDecode(resposta.body);

      //Verificar se a exclusão foi concluída com sucesso
      if(resposta.statusCode == 200 || resposta.statusCode == 201){
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('componente excluído com sucesso!')),
        );

        await consultarComponentes(); //Atualiza a tela após excluir
      }
      else{
        //Exibe uma mensagem de erro
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erro ao excluir componente!')),
        );
      }
    }
    catch(e){
      //Exibe uma mensagem de erro na API
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro ao acessar API: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Relatório de Componentes'),
        //Adicionar um botão de atualização
        actions: [
          IconButton(
            onPressed: (){
              setState((){
                //Salva uma mensagem de erro
                carregando = true;
                erro = null;
              });
            },
            icon: const Icon(Icons.refresh),  
          ),
        ],
      ),
      body: 
      carregando
      ? const Center(
        child: CircularProgressIndicator(),
      )
      :
      Padding(
        padding: const EdgeInsets.all(24),
        child: Scrollbar(
          controller: horizontalController,
          thumbVisibility: true,
          trackVisibility: true,
          scrollbarOrientation: ScrollbarOrientation.bottom,
          child: SingleChildScrollView(
            controller: horizontalController,
            scrollDirection: Axis.horizontal,
            child: DataTable(
              headingRowColor: WidgetStateProperty.all(
                const Color(0xFFE7F0F2),
              ),
              border: TableBorder.all(
                color: const Color(0xFFE0E5E7),
                borderRadius: BorderRadius.circular(8),
              ),
              columns: const [
                DataColumn(
                  label: Text(
                    'Nome',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Codigo',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Estoque',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Ativo',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Ações',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
              //Criar uma lista de linhas da tabela a partir dos Componentes
              rows: componentes.map<DataRow>((componente) {
                final ativo = componente['ATIVO'].toString() == '1';

                return DataRow(
                  cells: [
                    DataCell(Text(componente['NOME'].toString())),
                    DataCell(Text(componente['CODIGO'].toString())),
                    DataCell(Text(componente['ESTOQUE'].toString())),
                    DataCell(Text(ativo ? 'Sim': 'Não')),
                    DataCell(
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: () async {
                              //Lógica para editar o modelo
                              //Salva o modelo em uma variável
                              final atualizado = await Navigator.push<bool>(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EditarComponentePage(
                                    componente: Map<String, dynamic>.from(componente), 
                                  )
                                ),
                              );

                              if(atualizado == true){
                                await consultarComponentes();
                              }
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red,),
                            onPressed: () async {
                              //Lógica para excluir o componente
                              final id = componente['ID'];

                              //Exibir uma mensagem de confirmação antes de excluir o componente
                              final confirmar = await showDialog<bool>(
                                context: context,
                                builder: (context){
                                  return AlertDialog(
                                    title: const Text("Excluir componente"),
                                    content: Text('Deseja excluir o componente ${componente['NOME']}?'),
                                    actions: [
                                      //Botão de cancelar a ação
                                      TextButton(
                                        onPressed: (){
                                          Navigator.pop(context, false);
                                        },
                                        child: Text("Cancelar")
                                      ),

                                      //Botão de excluir
                                      TextButton(
                                        onPressed: (){
                                          Navigator.pop(context, true);
                                        },
                                        child: Text("Excluir")
                                      ),
                                    ],
                                  );
                                }
                              );

                              //Se o usuário confirmar a exclusão , chama a função
                              if(confirmar == true){
                                await excluirComponente(id);
                              }

                            },
                          ),
                        ],
                      )
                    )
                  ],
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }

}