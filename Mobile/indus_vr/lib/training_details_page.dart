
import 'package:flutter/material.dart';
import 'simulation_page.dart';



class TrainingDetailsPage extends StatelessWidget {
  final String title;
  final String description;
  final String duration;
  final String level;
  final IconData icon;

  const TrainingDetailsPage({
    super.key,
    required this.title,
    required this.description,
    required this.duration,
    required this.level,
    required this.icon,
  });

  static const Color navy = Color(0xFF0B1F33);
  static const Color orange =  Color(0xFF74CFEC);
  static const Color card = Color(0xFF142D43);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: navy,
      appBar: AppBar(
        backgroundColor: navy,
        foregroundColor: Colors.white,
        elevation: 0,
        title: const Text('Detalhes do treinamento'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Imagem ilustrativa
              Container(
                height: 190,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF203F55),
                      Color(0xFF142D43),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Icon(
                  icon,
                  color: orange,
                  size: 85,
                ),
              ),

              const SizedBox(height: 25),

              // Categoria
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 7,
                ),
                decoration: BoxDecoration(
                  color: orange.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  'TREINAMENTO IMERSIVO • VR',
                  style: TextStyle(
                    color: orange,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
                ),
              ),

              const SizedBox(height: 15),

              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 12),

              Text(
                description,
                style: const TextStyle(
                  color: Colors.white60,
                  fontSize: 14,
                  height: 1.6,
                ),
              ),

              const SizedBox(height: 22),

              // Informações
              Row(
                children: [
                  Expanded(
                    child: _infoCard(
                      Icons.access_time_rounded,
                      'Duração',
                      duration,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _infoCard(
                      Icons.signal_cellular_alt_rounded,
                      'Dificuldade',
                      level,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 28),

              const Text(
                'Objetivos do treinamento',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 15),

              _objective('Identificar situações de risco no ambiente industrial.'),
              _objective('Aprender os procedimentos corretos de segurança.'),
              _objective('Tomar decisões diante de situações simuladas.'),

              const SizedBox(height: 25),

              const Text(
                'Como será a experiência?',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 15),

              _feature(
                Icons.view_in_ar_rounded,
                'Ambiente imersivo',
                'Explore uma simulação industrial em primeira pessoa.',
              ),

              _feature(
                Icons.headphones_rounded,
                'Instruções em áudio',
                'Receba orientações e alertas sonoros durante a atividade.',
              ),

              _feature(
                Icons.screen_rotation_rounded,
                'Movimentos do dispositivo',
                'Utilize os movimentos do celular para interagir com o ambiente.',
              ),

              const SizedBox(height: 30),

              // Aviso
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: card,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: Colors.white10),
                ),
                child: const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.info_outline_rounded,
                      color: orange,
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'Para uma experiência mais imersiva, utilize fones de ouvido. Óculos VR compatíveis poderão ser utilizados nas simulações.',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 12,
                          height: 1.5,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              // Iniciar
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton.icon(
                 onPressed: () {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => SimulationPage(
        title: title,
      ),
    ),
  );
},
                  icon: const Icon(Icons.play_arrow_rounded),
                  label: const Text(
                    'INICIAR TREINAMENTO',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: orange,
                    foregroundColor: navy,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }

  Widget _infoCard(IconData icon, String label, String value) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: card,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: orange, size: 23),
          const SizedBox(height: 10),
          Text(
            label,
            style: const TextStyle(
              color: Colors.white54,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _objective(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 13),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.check_circle_rounded,
            color: orange,
            size: 20,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 14,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _feature(IconData icon, String title, String description) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 17),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: orange, size: 27),
          const SizedBox(width: 13),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  description,
                  style: const TextStyle(
                    color: Colors.white60,
                    fontSize: 13,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
