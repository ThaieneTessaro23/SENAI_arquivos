import 'package:flutter/material.dart';
import 'package:industria_alimenticia/pages/cadastro_page.dart';
import 'package:industria_alimenticia/pages/home_page.dart';
import 'package:industria_alimenticia/widgets/app_drawer.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // Armazenar o índice da página atual
  int indiceAtual = 0;

  // Vetor com as duas páginas
  final paginas = const [
    HomePage(),
    CadastroPage()
  ];

  final titulos = const [
    "Início",
    "Cadastro de Produtos"
  ];

  //Atualizar a página depois que o usuário clicar
  void selecionarPagina(int indice){
    setState(() {
      indiceAtual = indice;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Menu superior
      appBar: AppBar(
        title: Text(titulos[indiceAtual]),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),

      //Menu Lateral (sanduíche)
      drawer: AppDrawer(
        // onSelecionar: selecionarPagina
      ),

      body: paginas[indiceAtual],

      //Menu Inferior
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: indiceAtual,
        onTap: selecionarPagina,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Início'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.edit),
            label: 'Cadastro'
          ),
        ]
      ),
    );
  }
}