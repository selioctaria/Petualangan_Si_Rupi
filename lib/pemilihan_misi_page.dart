import 'package:flutter/material.dart';
import 'main_menu_page.dart';
import 'dunia_cinta_game.dart'; // Tambahkan import halaman game Dunia Cinta
import 'dunia_bangga_game.dart';
import 'dunia_paham_game.dart';

class PemilihanMisiPage extends StatelessWidget {
  const PemilihanMisiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Latar belakang gradasi biru ke putih
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF4A90E2),
                  Color(0xFFFFFFFF),
                ],
              ),
            ),
          ),

          // Background gambar
          Positioned.fill(
            child: IgnorePointer(
              child: Image.asset(
                'assets/images/pemilihan-misi/misi_bg.png',
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Konten utama
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 40),

                  // Judul "PILIH DUNIA"
                  Center(
                    child: Image.asset(
                      'assets/images/pemilihan-misi/teks-pilih-dunia.png',
                      height: 60,
                    ),
                  ),

                  const SizedBox(height: 30),

                  // Dunia Cinta dan Bangga dalam satu baris
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Flexible(
                        child: _buildDuniaItem(
                          context: context,
                          iconPath: 'assets/images/pemilihan-misi/dunia_cinta.png',
                          line1: 'DUNIA',
                          line2: 'CINTA',
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const DuniaCintaGamePage(),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(width: 16),
                      Flexible(
                        child: _buildDuniaItem(
                          context: context,
                          iconPath: 'assets/images/pemilihan-misi/dunia_bangga.png',
                          line1: 'DUNIA',
                          line2: 'BANGGA',
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const DuniaBanggaGamePage(),
                              ),
                            );// Tambahkan navigasi ke halaman Dunia Bangga jika sudah ada
                          },
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 30),

                  // Dunia Paham di tengah
                  Center(
                    child: _buildDuniaItem(
                      context: context,
                      iconPath: 'assets/images/pemilihan-misi/dunia_paham.png',
                      line1: 'DUNIA',
                      line2: 'PAHAM',
                      onTap: () {
                        Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const DuniaPahamGamePage(),
                              ),
                            );// Tambahkan navigasi ke halaman Dunia Paham jika sudah ada
                      },
                    ),
                  ),

                  const SizedBox(height: 40),

                  // Tombol Kembali
                  ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 28, 59, 184),
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
          ),
        ],
      ),
    );
  }

  Widget _buildDuniaItem({
    required BuildContext context,
    required String iconPath,
    required String line1,
    required String line2,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            iconPath,
            height: 160,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            decoration: BoxDecoration(
              color: const Color(0xFFF7941D),
              borderRadius: BorderRadius.circular(10),
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
