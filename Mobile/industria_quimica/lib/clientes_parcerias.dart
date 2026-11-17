import 'package:flutter/material.dart';

class Clientes extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Clientes e Parcerias',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white), 
        backgroundColor: Color(0xFF7B4FA3),
      ),
      body: SingleChildScrollView( 
        child: Center(
          child: Column(
            children: [

              const SizedBox(height: 20),

              Text(
                "Tipos de clientes atendidos",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 54, 2, 110),
                ),
              ),

              SizedBox(height: 10),

              Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 185, 163, 208),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      "Atendemos indústrias dos setores agrícola, farmacêutico, alimentício e de saneamento, oferecendo soluções químicas personalizadas para diferentes necessidades produtivas.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        height: 1.2,
                      ),
                    ),
                  ),
                ),
              ),

              // Missão
              Text(
                "Parcerias estratégicas",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 54, 2, 110),
                ),
              ),

              SizedBox(height: 10),

              Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 185, 163, 208),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      "Mantemos parcerias com centros de pesquisa, universidades e empresas do setor industrial, promovendo inovação, desenvolvimento tecnológico e melhoria contínua dos processos.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        height: 1.2,
                      ),
                    ),
                  ),
                ),
              ),

              Text(
                "Projetos",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 54, 2, 110),
                ),
              ),

              SizedBox(height: 10),

              Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 185, 163, 208),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      "• Desenvolvimento de um fertilizante de liberação controlada que reduziu o consumo de água em plantações.\n\n"
                      "• Criação de um produto biodegradável para tratamento de efluentes industriais.\n\n"
                      "• Implementação de soluções químicas que aumentaram a eficiência produtiva de uma indústria alimentícia.\n\n",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        height: 1.2,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

            ],
          ),
        ),
      ),
    );
  }
}