import 'package:flutter/material.dart';
import 'dunia_paham_game.dart'; // untuk Main Ulang

class PencapaianDuniaPahamPage extends StatelessWidget {
  final int skor;

  const PencapaianDuniaPahamPage({super.key, required this.skor});

  String getMedali(int skor) {
    if (skor >= 900) {
      return 'Emas';
    } else if (skor >= 700) {
      return 'Perak';
    } else if (skor >= 500) {
      return 'Perunggu';
    } else {
      return "Belum Dapat Medali";
    }
  }

  @override
  Widget build(BuildContext context) {
    final String medali = getMedali(skor);

    return Scaffold(
      body: Stack(
        children: [
          // Background
          Positioned.fill(
            child: Image.asset(
              'assets/images/pencapaianduniapaham/background.png',
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 50),

                // Judul
                Center(
                  child: Image.asset(
                    'assets/images/pencapaianduniapaham/teks-dunia-paham.png',
                    height: 140,
                    fit: BoxFit.contain,
                  ),
                ),

                const SizedBox(height: 50),

                // Box isi pencapaian
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFF4DA),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.black, width: 1),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 6,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Lencana dan status
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              'assets/images/pencapaianduniapaham/lencana_paham.png',
                              height: 120,
                            ),
                            const SizedBox(width: 40),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: const [
                                      Icon(Icons.check_circle, color: Colors.green),
                                      SizedBox(width: 8),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Telah',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                            ),
                                          ),
                                          Text(
                                            'Diselesaikan',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  Text('Medali: $medali'),
                                  const SizedBox(height: 8),
                                  Text('Skor: $skor / 1000'),
                                ],
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 20),

                        const Text(
                          'Pelajaran yang dipelajari:',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          'Kamu berhasil mengenali nilai uang dan menghitung dengan tepat saat bertransaksi.',
                          textAlign: TextAlign.left,
                        ),

                        const SizedBox(height: 20),

                        // Tombol MAIN ULANG
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (_) => const DuniaPahamGamePage()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFF7941D),
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                                side: const BorderSide(color: Colors.black, width: 1.5),
                              ),
                              elevation: 3,
                            ),
                            child: const Text(
                              'MAIN ULANG',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.2,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 50),

                // Tombol KEMBALI
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFE94E38),
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                      side: const BorderSide(color: Colors.black, width: 2),
                    ),
                  ),
                  child: const Text(
                    'KEMBALI',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.yellow,
                    ),
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
