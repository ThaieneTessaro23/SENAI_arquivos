
import 'package:flutter/material.dart';
import 'training_details_page.dart';
import 'package:video_player/video_player.dart';

class TrainingCatalogPage extends StatelessWidget {
  const TrainingCatalogPage({super.key});

  static const Color navy = Color(0xFF0B1F33);
  static const Color orange = Color(0xFF74CFEC);
  static const Color card = Color(0xFF142D43);

  final List<Map<String, dynamic>> trainings = const [
    {
      'title': 'Operação Segura de Máquinas',
      'description': 'Aprenda a operar máquinas industriais com segurança.',
      'icon': Icons.precision_manufacturing_rounded,
      'duration': '15 minutos',
      'level': 'Intermediário',
      'video': 'assets/videos/maquinas.mp4',
    },
    {
      'title': 'Uso Correto de EPIs',
      'description': 'Conheça os equipamentos de proteção individual.',
      'icon': Icons.health_and_safety_rounded,
      'duration': '10 minutos',
      'level': 'Iniciante',
      'video': 'assets/videos/Uso_correto_EPI.mp4',
    },

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: navy,
      appBar: AppBar(
        backgroundColor: navy,
        foregroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Treinamentos',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(22),
          children: [
            const Text(
              'Aprenda na prática.',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Escolha um treinamento e prepare-se para uma experiência imersiva.',
              style: TextStyle(
                color: Colors.white60,
                fontSize: 14,
                height: 1.5,
              ),
            ),

            const SizedBox(height: 25),

            // Busca
            TextField(
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Buscar treinamento...',
                hintStyle: const TextStyle(color: Colors.white54),
                prefixIcon: const Icon(
                  Icons.search,
                  color: orange,
                ),
                filled: true,
                fillColor: card,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 25),

            const Text(
              'Todos os treinamentos',
              style: TextStyle(
                color: Colors.white,
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            ...trainings.map((training) {
              return Container(
                margin: const EdgeInsets.only(bottom: 15),
                padding: const EdgeInsets.all(17),
                decoration: BoxDecoration(
                  color: card,
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(color: Colors.white10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: TrainingVideoPlayer(
                            videoPath: training['video'] as String,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Align(
                          alignment: Alignment.centerRight,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.view_in_ar_rounded,
                                color: orange,
                                size: 23,
                              ),
                              SizedBox(width: 5),
                              Text(
                                'VR',
                                style: TextStyle(
                                  color: orange,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),


                    const SizedBox(height: 17),

                    Text(
                      training['title'] as String,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 7),

                    Text(
                      training['description'] as String,
                      style: const TextStyle(
                        color: Colors.white60,
                        fontSize: 13,
                        height: 1.4,
                      ),
                    ),

                    const SizedBox(height: 15),

                    Row(
                      children: [
                        const Icon(
                          Icons.access_time_rounded,
                          color: orange,
                          size: 16,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          training['duration'] as String,
                          style: const TextStyle(
                            color: Colors.white60,
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(width: 15),
                        const Icon(
                          Icons.signal_cellular_alt_rounded,
                          color: orange,
                          size: 16,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          training['level'] as String,
                          style: const TextStyle(
                            color: Colors.white60,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 17),

                    SizedBox(
                      width: double.infinity,
                      height: 45,
                      child: ElevatedButton(
                      onPressed: () {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => TrainingDetailsPage(
        title: training['title'] as String,
        description: training['description'] as String,
        duration: training['duration'] as String,
        level: training['level'] as String,
        icon: training['icon'] as IconData,
      ),
    ),
  );
},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: orange,
                          foregroundColor: navy,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(11),
                          ),
                        ),
                        child: const Text(
                          'Ver treinamento',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}


class TrainingVideoPlayer extends StatefulWidget {
  final String videoPath;

  const TrainingVideoPlayer({
    super.key,
    required this.videoPath,
  });

  @override
  State<TrainingVideoPlayer> createState() =>
      _TrainingVideoPlayerState();
}

class _TrainingVideoPlayerState extends State<TrainingVideoPlayer> {
  late VideoPlayerController _controller;
  bool _muted = false;
  bool _initialized = false;

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.asset(widget.videoPath)
      ..initialize().then((_) {
        if (!mounted) return;
        _controller.setVolume(1.0);
        setState(() {
          _initialized = true;
        });
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _togglePlay() {
    setState(() {
      if (_controller.value.isPlaying) {
        _controller.pause();
      } else {
        _controller.play();
      }
    });
  }

  void _toggleMute() {
    setState(() {
      _muted = !_muted;
    });
    _controller.setVolume(_muted ? 0.0 : 1.0);
  }

  @override
  Widget build(BuildContext context) {
    if (!_initialized) {
      return Container(
        height: 190,
        decoration: BoxDecoration(
          color: Colors.black26,
          borderRadius: BorderRadius.circular(14),
        ),
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(14),
      child: AspectRatio(
        aspectRatio: _controller.value.aspectRatio,
        child: Stack(
          alignment: Alignment.center,
          children: [
            VideoPlayer(_controller),

            Container(
              color: Colors.black.withOpacity(0.15),
            ),

            IconButton(
              onPressed: _togglePlay,
              icon: Icon(
                _controller.value.isPlaying
                    ? Icons.pause_circle_filled
                    : Icons.play_circle_fill,
                color: Colors.white,
                size: 55,
              ),
            ),

            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.black54,
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: _toggleMute,
                      icon: Icon(
                        _muted
                            ? Icons.volume_off
                            : Icons.volume_up,
                        color: Colors.white,
                      ),
                    ),
                    Expanded(
                      child: VideoProgressIndicator(
                        _controller,
                        allowScrubbing: true,
                        colors: const VideoProgressColors(
                          playedColor: Color(0xFFFF8733),
                          bufferedColor: Colors.white38,
                          backgroundColor: Colors.white24,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

