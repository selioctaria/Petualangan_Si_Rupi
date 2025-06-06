import 'package:flutter/material.dart';
import 'main_menu_page.dart';

class MenangPage extends StatelessWidget {
  const MenangPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Warna latar belakang biru langit
      backgroundColor: const Color(0xFF77BDFC),
      body: Stack(
        children: [
          // Background
          Positioned.fill(
            child: Image.asset(
              'assets/images/pencapaian/background.png',
              fit: BoxFit.cover,
            ),
          ),

          // Isi halaman
          SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 40),

                // Teks HORE!! MENANG
                const Text(
                  "HORE!!",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFFFD000),
                    shadows: [
                      Shadow(
                        offset: Offset(1.5, 1.5),
                        color: Colors.black26,
                      )
                    ],
                  ),
                ),
                const Text(
                  "MENANG",
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFFFD000),
                    shadows: [
                      Shadow(
                        offset: Offset(1.5, 1.5),
                        color: Colors.black26,
                      )
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // Maskot menang
                Image.asset(
                  'assets/images/menang/si_rupi_menang.png', // pastikan file ini ada
                  height: 330,
                  fit: BoxFit.contain,
                ),

                const SizedBox(height: 30),

                // Tombol "MAIN LAGI"
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 8),
                  child: ElevatedButton(
                    onPressed: () {
                      // TODO: Aksi main ulang
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF5DAFFF),
                      minimumSize: const Size.fromHeight(48),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 5,
                    ),
                    child: const Text(
                      "MAIN LAGI",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

                // Tombol "MENU UTAMA"
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 4),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (_) => const MainMenuPage()),
                            (route) => false,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF3B2B13),
                      minimumSize: const Size.fromHeight(48),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 5,
                    ),
                    child: const Text(
                      "MENU UTAMA",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.white,
                      ),
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
