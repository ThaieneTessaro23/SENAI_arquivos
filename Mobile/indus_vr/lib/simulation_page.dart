
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:sensors_plus/sensors_plus.dart';

class SimulationPage extends StatefulWidget {
  final String title;

  const SimulationPage({
    super.key,
    required this.title,
  });

  @override
  State<SimulationPage> createState() => _SimulationPageState();
}

class _SimulationPageState extends State<SimulationPage> {
  static const Color navy = Color(0xFF0B1F33);
  static const Color orange =  const Color(0xFF74CFEC);
  static const Color card = Color(0xFF142D43);

  final FlutterTts _tts = FlutterTts();

  StreamSubscription<AccelerometerEvent>? _sensorSubscription;

  double _x = 0;
  double _y = 0;

  int _step = 0;
  int _score = 0;
  int? _selectedOption;

  bool _finished = false;

  // Estados da simulação de máquinas
  bool _machineInspected = false;
  bool _machineRunning = false;

  // Estados da simulação de EPIs
  final Set<String> _selectedEpis = {};

  bool get _isEpi =>
      widget.title.toLowerCase().contains('epi');

  List<Map<String, dynamic>> get _questions {
    if (_isEpi) {
      return [
        {
          'title': 'Identificação dos EPIs',
          'question':
              'Você vai trabalhar em uma área com risco de queda de objetos. Qual equipamento protege sua cabeça?',
          'options': [
            'Capacete de segurança.',
            'Óculos de proteção.',
            'Protetor auricular.',
          ],
          'correct': 0,
          'explanation':
              'Correto! O capacete de segurança protege a cabeça contra impactos e objetos que possam cair.',
        },
        {
          'title': 'Proteção dos olhos',
          'question':
              'Durante uma atividade com partículas que podem atingir os olhos, qual equipamento deve ser utilizado?',
          'options': [
            'Luvas de segurança.',
            'Óculos de proteção.',
            'Botas de segurança.',
          ],
          'correct': 1,
          'explanation':
              'Muito bem! Os óculos de proteção ajudam a proteger os olhos contra partículas e outros riscos.',
        },
        {
          'title': 'Conservação dos equipamentos',
          'question':
              'Você percebe que suas luvas estão rasgadas antes de iniciar a atividade. O que deve fazer?',
          'options': [
            'Continuar utilizando as luvas.',
            'Utilizar as luvas somente em atividades rápidas.',
            'Solicitar a substituição das luvas danificadas.',
          ],
          'correct': 2,
          'explanation':
              'Correto! Equipamentos danificados não devem ser utilizados. Solicite a substituição antes de começar.',
        },
      ];
    }

    return [
      {
        'title': 'Inspeção da máquina',
        'question':
            'Antes de ligar uma máquina industrial, qual procedimento deve ser realizado?',
        'options': [
          'Verificar as condições do equipamento e suas proteções.',
          'Ligar a máquina imediatamente.',
          'Retirar as proteções para facilitar o trabalho.',
        ],
        'correct': 0,
        'explanation':
            'Muito bem! A inspeção inicial ajuda a identificar problemas e verificar se as proteções estão instaladas.',
      },
      {
        'title': 'Identificação de riscos',
        'question':
            'Durante a inspeção, você percebe que a proteção de uma parte móvel está solta. O que fazer?',
        'options': [
          'Continuar trabalhando com atenção.',
          'Interromper a operação e comunicar o responsável.',
          'Tentar ajustar a proteção com a máquina ligada.',
        ],
        'correct': 1,
        'explanation':
            'Correto! Interrompa a operação diante de uma condição insegura e comunique o responsável.',
      },
      {
        'title': 'Operação segura',
        'question':
            'Durante o funcionamento da máquina, qual atitude é segura?',
        'options': [
          'Aproximar as mãos das partes móveis.',
          'Ignorar ruídos diferentes.',
          'Manter distância das partes móveis e observar o funcionamento.',
        ],
        'correct': 2,
        'explanation':
            'Muito bem! Mantenha distância das partes móveis e interrompa a operação se perceber alguma anormalidade.',
      },
    ];
  }

  @override
  void initState() {
    super.initState();
    _initializeAudio();
    _initializeSensors();
  }

  Future<void> _initializeAudio() async {
    await _tts.setLanguage('pt-BR');
    await _tts.setSpeechRate(0.48);
    await _tts.setVolume(1.0);
    await _tts.setPitch(1.0);
  }

  void _initializeSensors() {
    _sensorSubscription =
        accelerometerEventStream().listen(
      (event) {
        if (!mounted) return;

        setState(() {
          _x = event.x;
          _y = event.y;
        });
      },
      onError: (error) {
        // Alguns computadores e navegadores não disponibilizam
        // os sensores de movimento.
      },
    );
  }

  Future<void> _speak(String message) async {
    await _tts.stop();
    await _tts.speak(message);
  }

  String get _movement {
    if (_x > 3) return 'Inclinação para a direita';
    if (_x < -3) return 'Inclinação para a esquerda';
    if (_y > 3) return 'Inclinação para frente';
    if (_y < -3) return 'Inclinação para trás';

    return 'Dispositivo estabilizado';
  }

  void _answer(int index) {
    if (_selectedOption != null) return;

    final question = _questions[_step];
    final correct = question['correct'] as int;
    final isCorrect = index == correct;

    setState(() {
      _selectedOption = index;

      if (isCorrect) {
        _score++;
      }
    });

    final explanation = question['explanation'] as String;

    _speak(
      isCorrect
          ? explanation
          : 'Resposta incorreta. $explanation',
    );
  }

  void _nextStep() {
    if (_step < _questions.length - 1) {
      setState(() {
        _step++;
        _selectedOption = null;
      });

      _speak(_questions[_step]['question'] as String);
    } else {
      setState(() {
        _finished = true;
      });

      _speak(
        'Treinamento concluído! Você acertou $_score de ${_questions.length} questões.',
      );
    }
  }

  // ==========================================
  // SIMULAÇÃO 1: OPERAÇÃO DE MÁQUINAS
  // ==========================================

  Widget _buildMachineScene() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: const Color(0xFF203F55),
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: Colors.white12),
          ),
          child: Column(
            children: [
              const Icon(
                Icons.precision_manufacturing_rounded,
                size: 95,
                color: orange,
              ),
              const SizedBox(height: 12),
              const Text(
                'PAINEL DE OPERAÇÃO INDUSTRIAL',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  letterSpacing: 1,
                ),
              ),
              const SizedBox(height: 18),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _statusIndicator(
                    'Inspeção',
                    _machineInspected,
                  ),
                  const SizedBox(width: 18),
                  _statusIndicator(
                    'Operação',
                    _machineRunning,
                  ),
                ],
              ),

              const SizedBox(height: 15),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(13),
                decoration: BoxDecoration(
                  color: navy,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  _machineRunning
                      ? 'MÁQUINA EM FUNCIONAMENTO'
                      : 'MÁQUINA PARADA',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: _machineRunning
                        ? Colors.orangeAccent
                        : Colors.greenAccent,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 15),

        const Text(
          'CONTROLES DA SIMULAÇÃO',
          style: TextStyle(
            color: orange,
            fontSize: 12,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),

        const SizedBox(height: 12),

        _actionButton(
          icon: Icons.search_rounded,
          title: 'Inspecionar equipamento',
          description: 'Verificar as proteções da máquina',
          onPressed: () {
            setState(() {
              _machineInspected = true;
            });

            _speak(
              'Inspeção realizada. Verifique as proteções e as condições do equipamento antes de iniciar a operação.',
            );
          },
        ),

        const SizedBox(height: 10),

        _actionButton(
          icon: Icons.play_circle_fill_rounded,
          title: 'Simular acionamento',
          description: 'Iniciar a operação após a inspeção',
          enabled: _machineInspected && !_machineRunning,
          onPressed: () {
            setState(() {
              _machineRunning = true;
            });

            _speak(
              'A máquina foi acionada na simulação. Mantenha distância das partes móveis e observe o funcionamento.',
            );
          },
        ),

        const SizedBox(height: 10),

        _actionButton(
          icon: Icons.stop_circle_rounded,
          title: 'Parada de emergência',
          description: 'Interromper o funcionamento simulado',
          enabled: _machineRunning,
          onPressed: () {
            setState(() {
              _machineRunning = false;
            });

            _speak(
              'Parada de emergência acionada. A máquina foi interrompida na simulação.',
            );
          },
        ),

        const SizedBox(height: 12),

        const Text(
          'Esta é uma simulação educativa. Não controla máquinas reais.',
          style: TextStyle(
            color: Colors.white54,
            fontSize: 11,
          ),
        ),
      ],
    );
  }

  Widget _statusIndicator(String label, bool active) {
    return Row(
      children: [
        Icon(
          Icons.circle,
          size: 10,
          color: active ? Colors.greenAccent : Colors.white30,
        ),
        const SizedBox(width: 6),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  Widget _actionButton({
    required IconData icon,
    required String title,
    required String description,
    required VoidCallback onPressed,
    bool enabled = true,
  }) {
    return Opacity(
      opacity: enabled ? 1 : 0.4,
      child: Material(
        color: card,
        borderRadius: BorderRadius.circular(13),
        child: InkWell(
          onTap: enabled ? onPressed : null,
          borderRadius: BorderRadius.circular(13),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              children: [
                Icon(icon, color: orange, size: 29),
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
                      const SizedBox(height: 4),
                      Text(
                        description,
                        style: const TextStyle(
                          color: Colors.white60,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                ),
                const Icon(
                  Icons.chevron_right,
                  color: Colors.white54,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ==========================================
  // SIMULAÇÃO 2: USO CORRETO DE EPIs
  // ==========================================

  Widget _buildEpiScene() {
    final epis = [
      {
        'name': 'Capacete',
        'icon': Icons.engineering_rounded,
      },
      {
        'name': 'Óculos',
        'icon': Icons.visibility_rounded,
      },
      {
        'name': 'Luvas',
        'icon': Icons.back_hand_rounded,
      },
      {
        'name': 'Botas',
        'icon': Icons.hiking_rounded,
      },
      {
        'name': 'Protetor auricular',
        'icon': Icons.hearing_rounded,
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: const Color(0xFF203F55),
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: Colors.white12),
          ),
          child: Column(
            children: [
              const Icon(
                Icons.health_and_safety_rounded,
                size: 90,
                color: orange,
              ),
              const SizedBox(height: 12),
              const Text(
                'ÁREA DE PREPARAÇÃO DO TRABALHADOR',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  letterSpacing: 1,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Escolha os equipamentos para montar seu kit de proteção.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white60,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 20),

        const Text(
          'SELECIONE OS EQUIPAMENTOS',
          style: TextStyle(
            color: orange,
            fontSize: 12,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),

        const SizedBox(height: 8),

        ...epis.map((epi) {
          final name = epi['name'] as String;
          final selected = _selectedEpis.contains(name);

          return Container(
            margin: const EdgeInsets.only(bottom: 9),
            decoration: BoxDecoration(
              color: card,
              borderRadius: BorderRadius.circular(13),
              border: Border.all(
                color: selected ? orange : Colors.white12,
              ),
            ),
            child: CheckboxListTile(
              value: selected,
              activeColor: orange,
              checkColor: navy,
              controlAffinity: ListTileControlAffinity.trailing,
              title: Text(
                name,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              secondary: Icon(
                epi['icon'] as IconData,
                color: orange,
              ),
              onChanged: (value) {
                setState(() {
                  if (value == true) {
                    _selectedEpis.add(name);
                  } else {
                    _selectedEpis.remove(name);
                  }
                });
              },
            ),
          );
        }),

        const SizedBox(height: 12),

        SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton.icon(
            onPressed: () {
              final selected = _selectedEpis.toList();

              if (selected.isEmpty) {
                _speak(
                  'Selecione os equipamentos para montar seu kit de proteção.',
                );
                return;
              }

              _speak(
                'Você selecionou: ${selected.join(', ')}. Confira se todos os equipamentos são adequados aos riscos da atividade e se estão em boas condições.',
              );

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    '${selected.length} equipamentos selecionados.',
                  ),
                  backgroundColor: card,
                ),
              );
            },
            icon: const Icon(Icons.fact_check_rounded),
            label: const Text('CONFERIR MEU KIT'),
            style: ElevatedButton.styleFrom(
              backgroundColor: orange,
              foregroundColor: navy,
            ),
          ),
        ),

        const SizedBox(height: 12),

        const Text(
          'Os EPIs necessários devem ser definidos conforme os riscos da atividade.',
          style: TextStyle(
            color: Colors.white54,
            fontSize: 11,
          ),
        ),
      ],
    );
  }

  // ==========================================
  // TELA PRINCIPAL
  // ==========================================

  Widget _buildSimulation() {
    final question = _questions[_step];

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'TREINAMENTO EM ANDAMENTO',
                style: TextStyle(
                  color: orange,
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
              Text(
                '${_step + 1}/${_questions.length}',
                style: const TextStyle(color: Colors.white70),
              ),
            ],
          ),

          const SizedBox(height: 12),

          LinearProgressIndicator(
            value: (_step + 1) / _questions.length,
            minHeight: 7,
            backgroundColor: Colors.white12,
            valueColor:
                const AlwaysStoppedAnimation<Color>(orange),
          ),

          const SizedBox(height: 25),

          Text(
            widget.title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 20),

          // Cada treinamento carrega uma simulação diferente.
          if (_isEpi)
            _buildEpiScene()
          else
            _buildMachineScene(),

          const SizedBox(height: 22),

          // Sensor de movimento
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: card,
              borderRadius: BorderRadius.circular(13),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.screen_rotation_rounded,
                  color: orange,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Movimentação do dispositivo',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        _movement,
                        style: const TextStyle(
                          color: Colors.white60,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                const Icon(
                  Icons.sensors_rounded,
                  color: Colors.greenAccent,
                ),
              ],
            ),
          ),

          const SizedBox(height: 22),

          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: () {
                _speak(question['question'] as String);
              },
              icon: const Icon(Icons.volume_up_rounded),
              label: const Text('OUVIR INSTRUÇÃO'),
              style: OutlinedButton.styleFrom(
                foregroundColor: orange,
                side: const BorderSide(color: orange),
                padding: const EdgeInsets.all(15),
              ),
            ),
          ),

          const SizedBox(height: 22),

          Text(
            'ETAPA ${_step + 1}: ${question['title']}',
            style: const TextStyle(
              color: orange,
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          Text(
            question['question'] as String,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              height: 1.4,
            ),
          ),

          const SizedBox(height: 18),

          ...List.generate(
            (question['options'] as List<String>).length,
            (index) {
              final selected = _selectedOption == index;
              final correct = question['correct'] == index;

              Color borderColor = Colors.white12;
              Color backgroundColor = card;

              if (_selectedOption != null && correct) {
                borderColor = Colors.greenAccent;
                backgroundColor = Colors.green.withOpacity(0.12);
              } else if (selected && !correct) {
                borderColor = Colors.redAccent;
                backgroundColor = Colors.red.withOpacity(0.12);
              }

              return GestureDetector(
                onTap: () => _answer(index),
                child: Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(bottom: 10),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: backgroundColor,
                    borderRadius: BorderRadius.circular(13),
                    border: Border.all(color: borderColor),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          (question['options'] as List<String>)[index],
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            height: 1.4,
                          ),
                        ),
                      ),
                      if (_selectedOption != null && correct)
                        const Icon(
                          Icons.check_circle,
                          color: Colors.greenAccent,
                        ),
                      if (selected && !correct)
                        const Icon(
                          Icons.cancel,
                          color: Colors.redAccent,
                        ),
                    ],
                  ),
                ),
              );
            },
          ),

          if (_selectedOption != null) ...[
            const SizedBox(height: 8),

            Text(
              _selectedOption == question['correct']
                  ? 'Resposta correta!'
                  : 'Resposta incorreta. Confira a orientação.',
              style: TextStyle(
                color: _selectedOption == question['correct']
                    ? Colors.greenAccent
                    : Colors.orangeAccent,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: _nextStep,
                style: ElevatedButton.styleFrom(
                  backgroundColor: orange,
                  foregroundColor: navy,
                ),
                child: Text(
                  _step == _questions.length - 1
                      ? 'FINALIZAR TREINAMENTO'
                      : 'PRÓXIMA ETAPA',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  // ==========================================
  // RESULTADO
  // ==========================================

  Widget _buildResult() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.workspace_premium_rounded,
              color: orange,
              size: 85,
            ),
            const SizedBox(height: 20),
            const Text(
              'Treinamento concluído!',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              widget.title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white60,
              ),
            ),
            const SizedBox(height: 25),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                color: card,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Column(
                children: [
                  const Text(
                    'SEU RESULTADO',
                    style: TextStyle(
                      color: Colors.white60,
                      letterSpacing: 1,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    '$_score/${_questions.length}',
                    style: const TextStyle(
                      color: orange,
                      fontSize: 42,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    'Respostas corretas',
                    style: TextStyle(
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: orange,
                  foregroundColor: navy,
                ),
                child: const Text(
                  'VOLTAR AO TREINAMENTO',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _sensorSubscription?.cancel();
    _tts.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: navy,
      appBar: AppBar(
        backgroundColor: navy,
        foregroundColor: Colors.white,
        elevation: 0,
        title: const Text('Simulação imersiva'),
      ),
      body: SafeArea(
        child: _finished ? _buildResult() : _buildSimulation(),
      ),
    );
  }
}
