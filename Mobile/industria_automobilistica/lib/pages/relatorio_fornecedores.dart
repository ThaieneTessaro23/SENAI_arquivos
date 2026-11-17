import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; //biblioteca http
import 'dart:convert';

import 'package:industria_automobilistica/pages/editar_fornecedores.dart'; //pacote para gerar JSON

class RelatorioFornecedoresPage extends StatefulWidget {
  const RelatorioFornecedoresPage({super.key});

  @override
  State<RelatorioFornecedoresPage> createState() => _RelatorioFornecedoresPageState();
}

class _RelatorioFornecedoresPageState extends State<RelatorioFornecedoresPage> {
  final ScrollController horizontalController = ScrollController();

  //FIZEMOS COM O GABRIEL
  //Criar uma lista que armazenará os Fornecedores retornados da API
  List<dynamic> fornecedores = [];

  //Criar uma variável para indicar se os dados estão carregando
  bool carregando = true;

  //Armazenar uma possível mensagem de erro da API
  String? erro;

  //Criar uma função para rodar toda vez que abrir a página
  @override
  void initState(){
    super.initState();
    consultarFornecedores();
  }

  Future<void> consultarFornecedores() async {
    try{
      //Faz uma requisição HTTP do tipo GET para a API
      final resposta = await http.get(
        Uri.parse(
          'http://DESKTOP-CB35GIG/industria_automotiva_api/public/api/fornecedores'
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
          //Salvar os Fornecedores em uma variável
          fornecedores = resultado['data'] ?? [];
          carregando = false;
        });
      }
      else{
        setState((){
          //Salva uma mensagem de erro
          fornecedores = resultado['message'] ?? 'Erro ao consultar Fornecedores';
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

  //Criar uma função assincrona para excluir um fornecedores pela API
  Future<void> excluirFornecedor(dynamic fornecedorId) async{
    try{
      //Faz uma requisição HTTP do tipo DELETE para a API
      final resposta = await http.delete(
        Uri.parse(
          'http://DESKTOP-CB35GIG/industria_automotiva_api/public/api/fornecedores/$fornecedorId'
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
          SnackBar(content: Text('Fornecedor excluído com sucesso!')),
        );

        await consultarFornecedores(); //Atualiza a tela após excluir
      }
      else{
        //Exibe uma mensagem de erro
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erro ao excluir fornecedor!')),
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
        title: const Text('Relatório de Fornecedores'),
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
                    'CNPJ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Cidade',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Estado',
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
              //Criar uma lista de linhas da tabela a partir dos Fornecedores
              rows: fornecedores.map<DataRow>((fornecedor) {
                final ativo = fornecedor['ATIVO'].toString() == '1';

                return DataRow(
                  cells: [
                    DataCell(Text(fornecedor['NOME'].toString())),
                    DataCell(Text(fornecedor['CNPJ'].toString())),
                    DataCell(Text(fornecedor['CIDADE'].toString())),
                    DataCell(Text(fornecedor['ESTADO'].toString())),
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
                                  builder: (context) => EditarFornecedorPage(
                                    fornecedor: Map<String, dynamic>.from(fornecedor), 
                                  )
                                ),
                              );

                              if(atualizado == true){
                                await consultarFornecedores();
                              }
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red,),
                            onPressed: () async {
                              //Lógica para excluir o fornecedor
                              final id = fornecedor['ID'];

                              //Exibir uma mensagem de confirmação antes de excluir o fornecedor
                              final confirmar = await showDialog<bool>(
                                context: context,
                                builder: (context){
                                  return AlertDialog(
                                    title: const Text("Excluir Fornecedor"),
                                    content: Text('Deseja excluir o fornecedor ${fornecedor['NOME']}?'),
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
                                await excluirFornecedor(id);
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
