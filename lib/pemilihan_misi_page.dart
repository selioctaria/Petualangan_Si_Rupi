import 'package:flutter/material.dart';
import 'main_menu_page.dart';

class PemilihanMisiPage extends StatelessWidget {
  const PemilihanMisiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
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

          // Background
          Positioned.fill(
            child: Image.asset(
              'assets/images/pemilihan-misi/misi_bg.png',
              fit: BoxFit.cover,
            ),
          ),

          // Konten
          Column(
            children: [
              const SizedBox(height: 80), // Jarak dari atas layar

              // Teks "PILIH DUNIA"
              Center(
                child: Image.asset(
                  'assets/images/pemilihan-misi/teks-pilih-dunia.png',
                  height: 60,
                ),
              ),

              const SizedBox(height: 40),

              // Dunia Cinta dan Bangga (Baris pertama)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    'assets/images/pemilihan-misi/dunia_cinta.png',
                    height: 160,
                  ),
                  Image.asset(
                    'assets/images/pemilihan-misi/dunia_bangga.png',
                    height: 160,
                  ),
                ],
              ),

              const SizedBox(height: 40),

              // Dunia Paham (Baris kedua)
              Center(
                child: Image.asset(
                  'assets/images/pemilihan-misi/dunia_paham.png',
                  height: 160,
                ),
              ),

              const SizedBox(height: 30),

              // Tombol Kembali
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const MainMenuPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1746A2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: const Text(
                      'KEMBALI',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30), // Jarak sedang dari tombol ke bawah layar
            ],
          ),
        ],
      ),
    );
  }
}
