import 'package:flutter/material.dart';
import 'pemilihan_misi_page.dart';
import 'pencapaian_page.dart';
import 'pengaturan_page.dart';
import 'keluar_game_page.dart';
import '../controller/audio_controller.dart'; // pastikan path ini sesuai

class MainMenuPage extends StatefulWidget {
  const MainMenuPage({super.key});

  @override
  State<MainMenuPage> createState() => _MainMenuPageState();
}

class _MainMenuPageState extends State<MainMenuPage> {
  final AudioController _audioController = AudioController();

  @override
  void initState() {
    super.initState();
    _audioController.playBackgroundMusic(); // Mainkan musik hanya dari main menu
  }

  void _navigateTo(BuildContext context, Widget page) {
    _audioController.playClickSound(); // Suara klik saat tombol ditekan
    Navigator.push(context, MaterialPageRoute(builder: (_) => page));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background gradient
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

          // Background image
          Positioned.fill(
            child: IgnorePointer(
              child: Image.asset(
                'assets/images/main_menu_bg.png',
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Main content
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  Image.asset(
                    'assets/images/judul_game.png',
                    height: 157,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 0),
                  Image.asset(
                    'assets/si_rupi_waving.png',
                    height: 400,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 0),

                  _buildMenuButton(
                    label: "MULAI",
                    color: const Color(0xFFFFD000),
                    textColor: Colors.black,
                    onPressed: () {
                      _navigateTo(context, const PemilihanMisiPage());
                    },
                  ),
                  _buildMenuButton(
                    label: "PENCAPAIAN",
                    color: const Color(0xFF5DAFFF),
                    textColor: Colors.white,
                    onPressed: () {
                      _navigateTo(context, const PencapaianPage());
                    },
                  ),
                  _buildMenuButton(
                    label: "PENGATURAN",
                    color: const Color(0xFF3B2B13),
                    textColor: Colors.white,
                    onPressed: () {
                      _navigateTo(context, const PengaturanPage());
                    },
                  ),
                  _buildMenuButton(
                    label: "KELUAR",
                    color: const Color(0xFFFF6868),
                    textColor: Colors.white,
                    onPressed: () {
                      _navigateTo(context, const KeluarGamePage());
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

  Widget _buildMenuButton({
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
