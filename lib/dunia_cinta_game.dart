import 'dart:async';
import 'package:flutter/material.dart';
import 'pencapaian_dunia_cinta.dart';

void main() {
  runApp(const MaterialApp(home: DuniaCintaGamePage()));
}

class Pertanyaan {
  final String gambarPath;
  final String pertanyaanText;
  final String jawabanBenar;

  Pertanyaan({
    required this.gambarPath,
    required this.pertanyaanText,
    required this.jawabanBenar,
  });
}

// Semua pertanyaan yang kamu berikan lengkap:
final List<Pertanyaan> daftarPertanyaan = [
  Pertanyaan(
    gambarPath: 'assets/images/game/dunia-cinta/asli-1.png',
    pertanyaanText: 'Apakah ini uang asli?',
    jawabanBenar: 'ya',
  ),
  Pertanyaan(
    gambarPath: 'assets/images/game/dunia-cinta/asli-2.png',
    pertanyaanText: 'Apakah ini uang asli?',
    jawabanBenar: 'ya',
  ),
  Pertanyaan(
    gambarPath: 'assets/images/game/dunia-cinta/asli-3.png',
    pertanyaanText: 'Apakah ini uang asli?',
    jawabanBenar: 'ya',
  ),
  Pertanyaan(
    gambarPath: 'assets/images/game/dunia-cinta/asli-4.png',
    pertanyaanText: 'Apakah ini uang asli?',
    jawabanBenar: 'ya',
  ),
  Pertanyaan(
    gambarPath: 'assets/images/game/dunia-cinta/asli-5.png',
    pertanyaanText: 'Apakah ini uang asli?',
    jawabanBenar: 'ya',
  ),
  Pertanyaan(
    gambarPath: 'assets/images/game/dunia-cinta/palsu-1.png',
    pertanyaanText: 'Apakah gambar ini palsu?',
    jawabanBenar: 'ya',
  ),
  Pertanyaan(
    gambarPath: 'assets/images/game/dunia-cinta/palsu-2.png',
    pertanyaanText: 'Apakah gambar ini palsu?',
    jawabanBenar: 'ya',
  ),
  Pertanyaan(
    gambarPath: 'assets/images/game/dunia-cinta/palsu-3.png',
    pertanyaanText: 'Apakah gambar ini palsu?',
    jawabanBenar: 'ya',
  ),
  Pertanyaan(
    gambarPath: 'assets/images/game/dunia-cinta/palsu-4.png',
    pertanyaanText: 'Apakah gambar ini palsu?',
    jawabanBenar: 'ya',
  ),
  Pertanyaan(
    gambarPath: 'assets/images/game/dunia-cinta/palsu-5.png',
    pertanyaanText: 'Apakah gambar ini palsu?',
    jawabanBenar: 'ya',
  ),
];

class DuniaCintaGamePage extends StatefulWidget {
  const DuniaCintaGamePage({super.key});

  @override
  State<DuniaCintaGamePage> createState() => _DuniaCintaGamePageState();
}

class _DuniaCintaGamePageState extends State<DuniaCintaGamePage> {
  int currentQuestionIndex = 0;
  String? _selectedAnswer;
  int score = 0;
  int lives = 3;
  int remainingSeconds = 180;
  Timer? _timer;
  bool _gameOver = false;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingSeconds == 0) {
        timer.cancel();
        _onGameOver();
      } else {
        setState(() {
          remainingSeconds--;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _onGameOver() {
    setState(() {
      _gameOver = true;
    });
    _showGameOverDialog();
  }

  void _showGameOverDialog() {
    showDialog(
      context: context,
      barrierDismissible: false, // agar tidak bisa dismiss sembarangan
      builder: (context) {
        return AlertDialog(
          title: const Text('Game Selesai!'),
          content: Text('Skor Anda: ${(score * 1000 ~/ daftarPertanyaan.length)}'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _resetGame();
              },
              child: const Text('Main Lagi'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop(); // keluar halaman game
              },
              child: const Text('Keluar'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                _goToPencapaianPage();
              },
              child: const Text('Lihat Pencapaian'),
            ),
          ],
        );
      },
    );
  }

  void _resetGame() {
    setState(() {
      currentQuestionIndex = 0;
      score = 0;
      lives = 3;
      remainingSeconds = 180;
      _selectedAnswer = null;
      _gameOver = false;
    });
    _startTimer();
  }

  void _goToPencapaianPage() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => PencapaianDuniaCintaPage(
          skor: (score * 1000 ~/ daftarPertanyaan.length),
        ),
      ),
    );
  }

  Widget _buildJawabanButton(String label, String value, Color bgColor, Color textColor) {
    final bool isSelected = _selectedAnswer == value;

    return ElevatedButton(
      onPressed: _gameOver
          ? null
          : () {
        setState(() {
          _selectedAnswer = value;
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor,
        foregroundColor: textColor,
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: const BorderSide(color: Colors.black),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 18,
            height: 18,
            margin: const EdgeInsets.only(right: 8),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.black, width: 2),
              color: isSelected ? Colors.black : Colors.transparent,
            ),
          ),
          Text(label),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = daftarPertanyaan[currentQuestionIndex];
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          Container(color: const Color(0xFF72B2F4)),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/images/game/dunia-cinta/karakter-rupi.png',
              fit: BoxFit.fitWidth,
              width: screenWidth,
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Timer
                      Row(
                        children: [
                          const Icon(Icons.timer, color: Colors.white, size: 18),
                          const SizedBox(width: 4),
                          Text(
                            "${(remainingSeconds ~/ 60).toString().padLeft(2, '0')}:${(remainingSeconds % 60).toString().padLeft(2, '0')}",
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),

                      // Nyawa
                      Row(
                        children: List.generate(3, (index) {
                          if (index < lives) {
                            return const Icon(Icons.favorite, color: Colors.red, size: 20);
                          } else {
                            return const Icon(Icons.favorite_border, color: Colors.red, size: 20);
                          }
                        }),
                      ),

                      // Nomor Soal
                      Text(
                        "${currentQuestionIndex + 1}/${daftarPertanyaan.length}",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 16),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 32),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFFB6E6FB),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Image.asset(
                        currentQuestion.gambarPath,
                        fit: BoxFit.contain,
                        width: double.infinity,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        currentQuestion.pertanyaanText,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildJawabanButton('YA', 'ya', Colors.lightGreenAccent, Colors.black),
                    _buildJawabanButton('TIDAK', 'tidak', Colors.redAccent, Colors.white),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 24.0),
                      child: ElevatedButton(
                        onPressed: (_selectedAnswer == null || _gameOver)
                            ? null
                            : () {
                          if (_selectedAnswer == currentQuestion.jawabanBenar) {
                            score++;
                          } else {
                            lives--;
                            if (lives == 0) {
                              _timer?.cancel();
                              _onGameOver();
                              return;
                            }
                          }

                          setState(() {
                            _selectedAnswer = null;
                            if (currentQuestionIndex < daftarPertanyaan.length - 1) {
                              currentQuestionIndex++;
                            } else {
                              _timer?.cancel();
                              _onGameOver();
                            }
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _selectedAnswer == null ? Colors.grey : const Color(0xFFE85B1B),
                          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                            side: const BorderSide(color: Colors.black),
                          ),
                        ),
                        child: const Text(
                          "Selanjutnya",
                          style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
