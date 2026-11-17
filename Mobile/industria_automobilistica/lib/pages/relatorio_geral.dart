import 'package:flutter/material.dart';

class RelatorioGeralPage extends StatelessWidget {
  const RelatorioGeralPage({super.key});

  final List<Map<String, dynamic>> indicadores = const [
    {
      'titulo': 'Modelos',
      'valor': '18',
      'icone': Icons.directions_car,
    },
    {
      'titulo': 'Componentes',
      'valor': '240',
      'icone': Icons.settings,
    },
    {
      'titulo': 'Fornecedores',
      'valor': '12',
      'icone': Icons.local_shipping,
    },
    {
      'titulo': 'Estoque baixo',
      'valor': '7',
      'icone': Icons.warning_amber,
    },
  ];

  final List<Map<String, String>> atividades = const [
    {
      'titulo': 'Motor elétrico',
      'descricao': 'Estoque atual: 8 unidades',
    },
    {
      'titulo': 'Modelo Sedan X',
      'descricao': 'Modelo ativo desde 2024',
    },
    {
      'titulo': 'Fornecedor Auto Peças Brasil',
      'descricao': 'Localização: Curitiba - PR',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6F8),
      appBar: AppBar(
        title: const Text('Relatório Geral'),
        backgroundColor: const Color(0xFF164E63),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Visão geral',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: indicadores.length,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 300,
                mainAxisExtent: 160,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemBuilder: (context, index) {
                final item = indicadores[index];

                return Card(
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(18),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          item['icone'],
                          size: 32,
                          color: const Color(0xFF0E7490),
                        ),
                        const Spacer(),
                        Text(
                          item['valor'],
                          style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          item['titulo'],
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}