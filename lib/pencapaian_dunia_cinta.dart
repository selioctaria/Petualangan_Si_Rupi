import 'package:flutter/material.dart';
import 'dunia_cinta_game.dart'; // untuk Main Ulang

class PencapaianDuniaCintaPage extends StatelessWidget {
  final int skor;

  const PencapaianDuniaCintaPage({super.key, required this.skor});

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
    final bool belumSelesai = medali == "Belum Dapat Medali";

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/pencapaianduniacinta/background.png',
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
                    'assets/images/pencapaianduniacinta/teks-dunia-cinta.png',
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
                              'assets/images/pencapaianduniacinta/lencana_cinta.png',
                              height: 120,
                            ),
                            const SizedBox(width: 40),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Icon(
                                        belumSelesai
                                            ? Icons.cancel
                                            : Icons.check_circle,
                                        color: belumSelesai
                                            ? Colors.red
                                            : Colors.green,
                                        size: 32,
                                      ),
                                      const SizedBox(width: 8),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            belumSelesai ? 'Belum' : 'Telah',
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                            ),
                                          ),
                                          const Text(
                                            'Diselesaikan',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 12),
                                  Text('Medali: $medali'),
                                  const SizedBox(height: 8),
                                  Text('Skor: $skor / 1000'),
                                ],
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 20),

                        if (!belumSelesai) ...[
                          const Text(
                            'Pelajaran yang dipelajari:',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            'Kamu berhasil mengenali ciri uang asli dan tahu cara membedakannya dari uang palsu',
                            textAlign: TextAlign.left,
                          ),
                          const SizedBox(height: 20),
                        ],

                        // Tombol MULAI BERMAIN / MAIN ULANG
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const DuniaCintaGamePage(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFF7941D),
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                                side: const BorderSide(
                                    color: Colors.black, width: 1.5),
                              ),
                              elevation: 3,
                            ),
                            child: Text(
                              belumSelesai ? 'MULAI BERMAIN' : 'MAIN ULANG',
                              style: const TextStyle(
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
