import 'package:flutter/material.dart';
import 'main_menu_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Delay 10 detik lalu pindah ke main menu
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MainMenuPage()),
      );
    });
  }

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

          // Background awan (jika ada)
          Positioned.fill(
            child: Image.asset(
              'assets/images/splash_screen/background.png',
              fit: BoxFit.cover,
            ),
          ),

          // Konten splash
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 150),
                // Judul Game (gambar PNG)
                Image.asset(
                  'assets/images/judul_game.png',
                  height: 157,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 30),

                // Maskot si Rupi (di bawah judul)
                Image.asset(
                  'assets/si_rupi_waving.png',
                  height: 400,
                ),

                const SizedBox(height: 0),

                // Loading Text
                const Text(
                  "Memuat...",
                  style: TextStyle(color: Colors.black45, fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
