import 'package:flutter/material.dart';
import 'dunia_bangga_game.dart';

class PencapaianDuniaBanggaPage extends StatelessWidget {
  final int skorBenar;
  final int skorSalah;

  const PencapaianDuniaBanggaPage({
    super.key,
    required this.skorBenar,
    required this.skorSalah,
  });

  @override
  Widget build(BuildContext context) {
    int skorTotal = skorBenar * 100;
    String medali;
    if (skorBenar >= 9) {
      medali = "Emas";
    } else if (skorBenar >= 6) {
      medali = "Perak";
    } else if (skorBenar >= 3) {
      medali = "Perunggu";
    } else {
      medali = "Belum Dapat Medali";
    }

    final bool belumSelesai = medali == "Belum Dapat Medali";

    return Scaffold(
      body: Stack(
        children: [
          // Background
          Positioned.fill(
            child: Image.asset(
              'assets/images/pencapaianduniabangga/background.png',
              fit: BoxFit.cover,
            ),
          ),

          SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 50),

                // Judul Dunia Bangga
                Image.asset(
                  'assets/images/pencapaianduniabangga/teks-dunia-bangga.png',
                  width: 220,
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
                              'assets/images/pencapaianduniabangga/lencana_bangga.png',
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
                                          Text(
                                            'Diselesaikan',
                                            style: const TextStyle(
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
                                  Text('Skor: $skorTotal / 1000'),
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
                            'Kini kamu tahu bahwa setiap lembar Rupiah menyimpan kisah perjuangan dan kebanggaan bangsa.',
                            textAlign: TextAlign.left,
                          ),
                          const SizedBox(height: 20),
                        ],

                        // Tombol MAIN ULANG / MULAI BERMAIN
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const DuniaBanggaGamePage(),
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

                // Tombol Kembali
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFE94E38),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 12),
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
