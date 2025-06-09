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
                const SizedBox(height: 30),

                // Judul Dunia Bangga
                Image.asset(
                  'assets/images/pencapaianduniabangga/teks-dunia-bangga.png',
                  width: 220,
                ),

                const SizedBox(height: 20),

                // Container Putih Tengah
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFF4DA),
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.black, width: 2),
                  ),
                  child: Column(
                    children: [
                      // Badge Dunia Bangga
                      Image.asset(
                        'assets/images/pencapaianduniabangga/lencana_bangga.png',
                        width: 80,
                      ),

                      const SizedBox(height: 10),

                      // Status
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.check_circle, color: Colors.green),
                          SizedBox(width: 8),
                          Text(
                            'Telah Diselesaikan',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 10),

                      // Medali dan Skor
                      Text(
                        'Medali: $medali',
                        style: const TextStyle(fontSize: 16),
                      ),
                      Text(
                        'Skor: $skorTotal / 1000',
                        style: const TextStyle(fontSize: 16),
                      ),

                      const SizedBox(height: 10),

                      // Pelajaran yang Dipelajari
                      const Text(
                        'Pelajaran yang dipelajari:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 6),
                      const Text(
                        'Kini kamu tahu bahwa setiap lembar Rupiah menyimpan kisah perjuangan dan kebanggaan bangsa.',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14),
                      ),

                      const SizedBox(height: 20),

                      // Tombol Main Ulang
                      ElevatedButton(
                        onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (_) => const DuniaBanggaGamePage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: const BorderSide(color: Colors.black, width: 2),
                        ),
                      ),
                        child: const Text(
                          'MAIN ULANG',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // Tombol Kembali
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