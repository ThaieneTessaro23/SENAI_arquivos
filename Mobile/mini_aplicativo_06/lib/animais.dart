import 'package:flutter/material.dart';

class Animais extends StatelessWidget {
  const Animais({super.key});

  @override
  Widget build(BuildContext context) {
    final animais = [
      {
        'imagem' : 'assets/images/cachorro.jpg',
        'pt' : 'Cachorro',
        'en' : 'Dog',
        'frase' : 'The dog is happy',
        'cor' : Colors.orange,
      },
      {
        'imagem' : 'assets/images/coelho.jpg',
        'pt' : 'Coelho',
        'en' : 'Rabbit',
        'frase' : 'The rabbit is fast',
        'cor' : Colors.purple,
      },
      {
        'imagem' : 'assets/images/elefante.jpg',
        'pt' : 'Elefante',
        'en' : 'Elephant',
        'frase' : 'The elephant is big',
        'cor' : Colors.blueGrey,
      },
      {
        'imagem' : 'assets/images/gato.jpg',
        'pt' : 'Gato',
        'en' : 'Cat',
        'frase' : 'The cat is sleeping',
        'cor' : Colors.pink,
      },
      {
        'imagem' : 'assets/images/leao.jpg',
        'pt' : 'Leão',
        'en' : 'Lion',
        'frase' : 'The lion is strong',
        'cor' : Colors.amber,
      },
      {
        'imagem' : 'assets/images/macaco.jpg',
        'pt' : 'Macaco',
        'en' : 'Monkey',
        'frase' : 'The monkey likes bananas',
        'cor' : Colors.brown,
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF4F1FF),
      appBar: AppBar(
        title: const Text(
          'Inglês com Animais',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: Column( 
        children: [
          Container(
            width: double.infinity,
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.deepPurple,
              borderRadius: BorderRadius.circular(24),
            ),
            child: const Column(
              children: [
                Text(
                  'Aprenda nomes de animais em inglês',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 26,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 8,),

                Text(
                  'Toque em um card para ver o nome em inglês',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: animais.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
              ),
              itemBuilder: (context, index){
                final animal = animais[index];

                return InkWell(
                  borderRadius: BorderRadius.circular(24),
                  onTap: (){

                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 86,
                          height: 86,
                          decoration: BoxDecoration(
                            color: animal['cor'] as Color,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Image.asset(
                              animal['imagem'] as String,
                              width: 58,
                              height: 58,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        SizedBox(height: 14,),
                        Text(
                          animal['pt'] as String,
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        SizedBox(height: 6,),

                        Text(
                          animal['en'] as String,
                          style: TextStyle(
                            fontSize: 16                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}