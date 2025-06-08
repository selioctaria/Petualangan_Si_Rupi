import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: DuniaCintaGamePage()));
}

class Pertanyaan {
  final String gambarPath;
  final String pertanyaanText;
  final String jawabanBenar; // 'ya' atau 'tidak'

  Pertanyaan({
    required this.gambarPath,
    required this.pertanyaanText,
    required this.jawabanBenar,
  });
}

final List<Pertanyaan> daftarPertanyaan = [
  Pertanyaan(
    gambarPath: 'assets/images/game/dunia-cinta/asli-1.png',
    pertanyaanText: 'Apakah ini uang asli?',
    jawabanBenar: 'ya',
  ),
  Pertanyaan(
    gambarPath: 'assets/images/game/dunia-cinta/asli-2.png',
    pertanyaanText: 'Apakah ini uang palsu?',
    jawabanBenar: 'tidak',
  ),
  // Tambah hingga 25 pertanyaan sesuai kebutuhan...
  Pertanyaan(
    gambarPath: 'assets/images/game/dunia-cinta/asli-3.png',
    pertanyaanText: 'Apakah gambar ini asli?',
    jawabanBenar: 'ya',
  ),
  Pertanyaan(
    gambarPath: 'assets/images/game/dunia-cinta/asli-4.png',
    pertanyaanText: 'Apakah gambar ini palsu?',
    jawabanBenar: 'tidak',
  ),
  // ... dst
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

  @override
  Widget build(BuildContext context) {
    final currentQuestion = daftarPertanyaan[currentQuestionIndex];
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          // Background biru langit
          Container(color: const Color(0xFF72B2F4)),

          // Gambar Rupi di bawah full lebar
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Timer dan Nyawa
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Timer
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.black),
                        ),
                        child: Row(
                          children: const [
                            Icon(Icons.access_alarm, size: 16),
                            SizedBox(width: 4),
                            Text("03:00"),
                          ],
                        ),
                      ),

                      // Nyawa (contoh 3 hati)
                      Row(
                        children: const [
                          Icon(Icons.favorite, color: Colors.red),
                          Icon(Icons.favorite, color: Colors.red),
                          Icon(Icons.favorite, color: Colors.red),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 16),

                // Soal gambar dan teks
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 32),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFFB6E6FB),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
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

                // Tombol YA / TIDAK
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildJawabanButton('YA', 'ya', Colors.lightGreenAccent, Colors.black),
                    _buildJawabanButton('TIDAK', 'tidak', Colors.redAccent, Colors.white),
                  ],
                ),

                const SizedBox(height: 20),

                // Tombol Selanjutnya
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 24.0),
                      child: ElevatedButton(
                        onPressed: _selectedAnswer == null
                            ? null
                            : () {
                          if (_selectedAnswer == currentQuestion.jawabanBenar) {
                            score++;
                          }

                          setState(() {
                            _selectedAnswer = null;

                            if (currentQuestionIndex < daftarPertanyaan.length - 1) {
                              currentQuestionIndex++;
                            } else {
                              _showResultDialog();
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
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
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

  Widget _buildJawabanButton(String label, String value, Color bgColor, Color textColor) {
    final bool isSelected = _selectedAnswer == value;

    return ElevatedButton(
      onPressed: () {
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

  void _showResultDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
        title: const Text('Hasil Game'),
        content: Text('Skor kamu: $score dari ${daftarPertanyaan.length}'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              setState(() {
                currentQuestionIndex = 0;
                score = 0;
                _selectedAnswer = null;
              });
            },
            child: const Text('Main Lagi'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              // Bisa tambah navigasi ke halaman lain jika perlu
            },
            child: const Text('Keluar'),
          ),
        ],
      ),
    );
  }
}
