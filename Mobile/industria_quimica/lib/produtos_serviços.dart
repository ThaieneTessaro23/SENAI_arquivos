import 'package:flutter/material.dart';

class Produtos extends StatelessWidget {
  const Produtos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Produtos ou Serviços',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color(0xFF7B4FA3),
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          Card(
            color: const Color.fromARGB(255, 185, 163, 208),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: const ListTile(
              leading: Icon(Icons.factory, color: Colors.white),
              title: Text(
                "Produção de insumos industriais",
                style: TextStyle(color: Colors.white),
              ),
              subtitle: Text(
                "Fabricação de matérias-primas químicas.",
                style: TextStyle(color: Colors.white70),
              ),
            ),
          ),

          const SizedBox(height: 10),

          Card(
            color: const Color.fromARGB(255, 185, 163, 208),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: const ListTile(
              leading: Icon(Icons.analytics, color: Colors.white),
              title: Text(
                "Consultoria em processos químicos",
                style: TextStyle(color: Colors.white),
              ),
              subtitle: Text(
                "Otimização de processos industriais.",
                style: TextStyle(color: Colors.white70),
              ),
            ),
          ),

          const SizedBox(height: 10),

          Card(
            color: const Color.fromARGB(255, 185, 163, 208),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: const ListTile(
              leading: Icon(Icons.eco, color: Colors.white),
              title: Text(
                "Tratamento de resíduos",
                style: TextStyle(color: Colors.white),
              ),
              subtitle: Text(
                "Soluções sustentáveis para descarte industrial.",
                style: TextStyle(color: Colors.white70),
              ),
            ),
          ),

          const SizedBox(height: 50),

         
          Center(
            child: SizedBox(
              width: 500, 
              height: 450, 
              child: _buildImageCard('assets/images/residuos_industriais.jpg'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImageCard(String path) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Container(
        decoration: BoxDecoration(
        ),
        child: Image.asset(
          path,
          fit: BoxFit.contain, // mantém a imagem inteira
        ),
      ),
    );
  }
}