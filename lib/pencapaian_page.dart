import 'package:flutter/material.dart';
import 'pencapaian_dunia_cinta.dart';
import 'pencapaian_dunia_bangga.dart';
import 'pencapaian_dunia_paham.dart';

class PencapaianPage extends StatelessWidget {
  const PencapaianPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF5196D0),
      body: Stack(
        children: [
          // Background
          Positioned.fill(
            child: Image.asset(
              'assets/images/pencapaian/background.png',
              fit: BoxFit.cover,
            ),
          ),

          SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 50),

                // Judul "PENCAPAIAN"
                Image.asset(
                  'assets/images/pencapaian/teks.png',
                  height: 60,
                  width: 300,
                  fit: BoxFit.contain,
                ),

                const SizedBox(height: 10),

                // Karakter Si Rupi
                Image.asset(
                  'assets/si_rupi_waving.png',
                  height: 300,
                ),

                const SizedBox(height: 10),

                // Tiga dunia horizontal
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildDuniaItem(
                        iconPath: 'assets/images/pencapaian/dunia_cinta.png',
                        line1: 'DUNIA',
                        line2: 'CINTA',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const PencapaianDuniaCintaPage(
                                skor: 0,
                              ),
                            ),
                          );
                        },
                      ),
                      _buildDuniaItem(
                        iconPath: 'assets/images/pencapaian/dunia_bangga.png',
                        line1: 'DUNIA',
                        line2: 'BANGGA',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const PencapaianDuniaBanggaPage(
                                skorBenar: 0,
                                skorSalah: 0,
                              ),
                            ),
                          );
                        },
                      ),
                      _buildDuniaItem(
                        iconPath: 'assets/images/pencapaian/dunia_paham.png',
                        line1: 'DUNIA',
                        line2: 'PAHAM',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const PencapaianDuniaPahamPage(
                                skor: 0,
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 80),

                // Tombol Kembali
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFE94E38),
                    padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                      side: const BorderSide(color: Colors.black, width: 2),
                    ),
                    elevation: 5,
                  ),
                  child: const Text(
                    'KEMBALI',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.yellow,
                      letterSpacing: 1.2,
                    ),
                  ),
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDuniaItem({
    required String iconPath,
    required String line1,
    required String line2,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Image.asset(
            iconPath,
            height: 120,
            width: 120,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 12),
            decoration: BoxDecoration(
              color: const Color(0xFFF7941D),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.black, width: 1.5),
            ),
            child: Column(
              children: [
                Text(
                  line1,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                Text(
                  line2,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.white,
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