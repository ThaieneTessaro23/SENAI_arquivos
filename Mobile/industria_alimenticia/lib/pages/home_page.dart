import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const Text(
            'Resumo da Produção',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20,),
          Row(
            children: [
              Expanded(
                child: Card(
                  child:Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Icon(
                          Icons.inventory,
                          size: 40,
                          color: Colors.green,
                        ),
                        SizedBox(height: 8,),
                        Text("Produtos"),
                        Text("240", style: TextStyle(fontSize: 24)),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Card(
                  child:Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Icon(
                          Icons.factory,
                          size: 40,
                          color: Colors.green,
                        ),
                        SizedBox(height: 8,),
                        Text("Lotes"),
                        Text("879", style: TextStyle(fontSize: 24)),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}