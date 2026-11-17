import 'package:flutter/material.dart';

class Processo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
  title: const Text(
    'Processo Produtivo',
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
                "Como os produtos são fabricados",
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
                      "Os produtos da Elementra são fabricados por meio de processos químicos controlados, que envolvem a mistura de matérias-primas, reações químicas específicas e etapas de purificação. Todo o processo é monitorado para garantir eficiência, segurança e padronização dos resultados.",
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
                "Tecnologias utilizadas",
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
                      "A Elementra utiliza tecnologias modernas, como sistemas automatizados de produção, sensores de monitoramento em tempo real e softwares de gestão industrial. Essas ferramentas permitem maior controle dos processos, redução de erros e otimização dos recursos utilizados.",
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
                "Compromisso com qualidade e inovação",
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
                      "A empresa mantém um forte compromisso com a qualidade e a inovação, investindo constantemente em pesquisa, melhoria de processos e desenvolvimento de novos produtos. Além disso, busca adotar práticas sustentáveis e garantir a satisfação de seus clientes por meio de soluções eficientes e seguras.",
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