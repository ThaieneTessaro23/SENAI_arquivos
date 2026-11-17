// =============================
// pagina_inicial.dart
// =============================
import 'package:flutter/material.dart';

class PaginaInicial extends StatelessWidget {
  const PaginaInicial({super.key});

  // PALETA
  static const Color fundoDocumento = Color(0xFFDED4BC);
  static const Color azulMarinha = Color(0xFF384552);
  static const Color carbono = Color(0xFF1A1A1A);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: fundoDocumento,

      // MENU LATERAL
      drawer: Drawer(
        backgroundColor: fundoDocumento,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            // CABEÇALHO
            DrawerHeader(
              decoration: const BoxDecoration(
                color: azulMarinha,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.menu_book,
                    size: 60,
                    color: Colors.white,
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Memórias da Segunda Guerra",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            // INÍCIO
            ListTile(
              leading: const Icon(Icons.home, color: carbono),
              title: const Text(
                "Página Inicial",
                style: TextStyle(color: carbono),
              ),
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/inicio',
                  (route) => false,
                );
              },
            ),

            // CONTEÚDOS
            ListTile(
              leading: const Icon(Icons.menu_book, color: carbono),
              title: const Text(
                "Conteúdos",
                style: TextStyle(color: carbono),
              ),
              onTap: () {
                Navigator.pushNamed(context, '/conteudos');
              },
            ),

            // QUIZ
            ListTile(
              leading: const Icon(Icons.quiz, color: carbono),
              title: const Text(
                "Atividades / Quiz",
                style: TextStyle(color: carbono),
              ),
              onTap: () {
                Navigator.pushNamed(context, '/quiz');
              },
            ),

            // SOBRE
            ListTile(
              leading: const Icon(Icons.info, color: carbono),
              title: const Text(
                "Sobre",
                style: TextStyle(color: carbono),
              ),
              onTap: () {
                Navigator.pushNamed(context, '/sobre');
              },
            ),
          ],
        ),
      ),

      // APPBAR
      appBar: AppBar(
        backgroundColor: azulMarinha,
        centerTitle: true,
        title: const Text(
          "História da Segunda Guerra",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      // CORPO
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // NOME
              const Text(
                "Time War",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: carbono,
                ),
              ),

              const SizedBox(height: 12),

              // DISCIPLINA
              const Text(
                "Disciplina: História",
                style: TextStyle(
                  fontSize: 22,
                  fontStyle: FontStyle.italic,
                  color: carbono,
                ),
              ),

              const SizedBox(height: 40),

              // IMAGEM PRINCIPAL
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  'assets/images/logo.png',
                  height: 260,
                  fit: BoxFit.cover,
                ),
              ),

              const SizedBox(height: 30),

              // FRASE TEMÁTICA
              const Text(
                "Explore os acontecimentos, batalhas e impactos de um dos maiores conflitos da história mundial.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: carbono,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}