import 'package:flutter/material.dart';
import 'package:industria_quimica/sobre_nos.dart';
import 'package:industria_quimica/produtos_serviços.dart';
import 'package:industria_quimica/processo_produtivo.dart';
import 'package:industria_quimica/sustentabilidade_segurança.dart';
import 'package:industria_quimica/clientes_parcerias.dart';
import 'package:industria_quimica/trabalhe_conosco.dart';
import 'package:industria_quimica/contato.dart';

class PaginaInicial extends StatelessWidget {
  const PaginaInicial({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 242, 242, 244),
        iconTheme: const IconThemeData(color: Colors.black),
        title: Row(
          children: [
            Image.network(
              'assets/images/logo_elementra.png',
              height: 150,
            ),
            const SizedBox(width: 30),
          ],
        ),
      ),

      drawer: Drawer(
        backgroundColor: const Color.fromARGB(255, 142, 98, 189),
        child: ListTileTheme(
          iconColor: Colors.white, 
          textColor: Colors.white, 
          child: ListView(
            children: [

              DrawerHeader(
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 142, 98, 189),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(
                      'assets/images/logo_elementra.png',
                      height: 60,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Elementra',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ],
                ),
              ),

              ListTile(
                leading: Icon(Icons.business),
                title: Text("Sobre a Empresa"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SobreNos()),
                  );
                },
              ),

              ListTile(
                leading: Icon(Icons.phone),
                title: Text("Contato"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Contato(
                      ),
                    ),
                  );
                },
              ),

              ListTile(
                leading: Icon(Icons.people),
                title: Text("Clientes/Parcerias"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Clientes(
                      ),
                    ),
                  );
                },
              ),

              ListTile(
                leading: Icon(Icons.settings),
                title: Text("Processo Produtivo"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Processo()),
                  );
                },
              ),

              ListTile(
                leading: Icon(Icons.science),
                title: Text("Produtos/Serviços"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Produtos(),),);
                },
              ),

              ListTile(
                leading: Icon(Icons.work),
                title: Text("Trabalhe Conosco"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Trabalhe()),
                  );
                },
              ),

              ListTile(
                leading: Icon(Icons.eco),
                title: Text("Sustentabilidade e Segurança"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Sustentabilidade()),
                  );
                },
              ),
            ],
          ),
        ),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Química inteligente para um futuro sustentável 🧪🌱",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 25),
            Image.network(
              'assets/images/Paleta.png',
              width: 600,
            ),
          ],
        ),
      ),
    );
  }
}