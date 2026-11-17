import 'package:flutter/material.dart';

class SobreNos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sobre Nós',
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
                "História da Empresa📌",
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
                      "A Elementra nasceu da união entre ciência e inovação.\n\n"
                      "Fundada por jovens pesquisadores, a empresa surgiu com o objetivo de transformar processos químicos em soluções mais eficientes e sustentáveis.\n\n"
                      "Com foco em tecnologia e qualidade, a Elementra desenvolve soluções inteligentes para diferentes setores da indústria.\n\n"
                      "Ao longo do tempo, conquistou parcerias importantes e expandiu sua atuação no mercado.\n\n"
                      "Hoje, a Elementra é referência em inovação, responsabilidade ambiental e desenvolvimento industrial.",
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
                "Missão",
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
                      "Desenvolver soluções químicas inovadoras com qualidade, segurança e responsabilidade ambiental, contribuindo para o avanço sustentável da indústria.",
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

              // Visão
              Text(
                "Visão",
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
                      "Ser referência no setor químico, destacando-se pela inovação, excelência tecnológica e compromisso com o meio ambiente.",
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

              // Valores
              Text(
                "Valores",
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
                      "Inovação.\n"
                      "Qualidade.\n"
                      "Sustentabilidade.\n"
                      "Ética.\n"
                      "Segurança.\n"
                      "Compromisso com o cliente",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        height: 1.3,
                      ),
                    ),
                  ),
                ),
              ),

              // Nova seção: Área de Atuação
              Text(
                "Área de Atuação",
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
                      "A Elementra atua no setor químico, desenvolvendo soluções para indústria de produtos químicos, farmacêutica, cosmética e ambiental. "
                      "Nosso foco está na inovação de processos, otimização de recursos e sustentabilidade em todos os projetos.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        height: 1.3,
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