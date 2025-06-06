import 'package:flutter/material.dart';
import 'pemilihan_misi_page.dart';
import 'pencapaian_page.dart';
import 'pengaturan_page.dart';
import 'keluar_game_page.dart';

class MainMenuPage extends StatelessWidget {
  const MainMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background gradient biru ke putih
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

          // Gambar background, bungkus dengan IgnorePointer agar tidak intercept tap
          Positioned.fill(
            child: IgnorePointer(
              child: Image.asset(
                'assets/images/main_menu_bg.png',
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Isi halaman dengan scroll
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 30),

                  // Judul Game (gambar PNG)
                  Image.asset(
                    'assets/images/judul_game.png',
                    height: 157,
                    fit: BoxFit.contain,
                  ),

                  const SizedBox(height: 0),

                  // Karakter Si Rupi
                  Image.asset(
                    'assets/si_rupi_waving.png',
                    height: 400,
                    fit: BoxFit.contain,
                  ),

                  const SizedBox(height: 0),

                  // Tombol MULAI - sudah diarahkan ke halaman pemilihan misi
                  _buildMenuButton(
                    context,
                    label: "MULAI",
                    color: const Color(0xFFFFD000),
                    textColor: Colors.black,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const PemilihanMisiPage(),
                        ),
                      );
                    },
                  ),

                  // Tombol PENCAPAIAN
                  _buildMenuButton(
                    context,
                    label: "PENCAPAIAN",
                    color: const Color(0xFF5DAFFF),
                    textColor: Colors.white,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const PencapaianPage(),
                        ),
                      );
                    },
                  ),

                  // Tombol PENGATURAN
                  _buildMenuButton(
                    context,
                    label: "PENGATURAN",
                    color: const Color(0xFF3B2B13),
                    textColor: Colors.white,
                    onPressed: () {
                      // TODO: Ganti ke halaman pengaturan
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const PengaturanPage(),
                        ),
                      );
                    },
                  ),

                  // Tombol KELUAR
                  _buildMenuButton(
                    context,
                    label: "KELUAR",
                    color: const Color(0xFFFF6868),
                    textColor: Colors.white,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const KeluarGamePage()),
                      );
                    },
                  ),

                  const SizedBox(height: 0),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuButton(
      BuildContext context, {
        required String label,
        required Color color,
        required Color textColor,
        required VoidCallback onPressed,
      }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 60),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          minimumSize: const Size.fromHeight(48),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(22),
          ),
          elevation: 5,
        ),
        onPressed: onPressed,
        child: Text(
          label,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
