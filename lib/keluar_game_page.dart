import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Tambahkan ini

class KeluarGamePage extends StatelessWidget {
  const KeluarGamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF77BDFC),
      body: Stack(
        children: [
          // Background
          Positioned.fill(
            child: Image.asset(
              'assets/images/konfirmasi_keluar/background.png',
              fit: BoxFit.cover,
            ),
          ),

          // Konten utama
          SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 70),

                // Gambar judul "KELUAR GAME?"
                Image.asset(
                  'assets/images/konfirmasi_keluar/teks.png',
                  height: 150,
                  fit: BoxFit.contain,
                ),

                const SizedBox(height: 0),

                // Stack: Rupi + teks + tombol
                Expanded(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // Maskot Rupi
                      Positioned.fill(
                        child: Image.asset(
                          'assets/images/konfirmasi_keluar/si_rupi_sad.png',
                          height: 1000,
                          width: 500,
                          fit: BoxFit.contain,
                        ),
                      ),

                      // Overlay teks + tombol
                      Positioned(
                        bottom: 110,
                        left: 0,
                        right: 0,
                        child: Column(
                          children: [
                            const Text(
                              "Apakah kamu yakin ingin keluar?",
                              style: TextStyle(
                                fontSize: 20,
                                color: Color(0xFF285185),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 30),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // Tombol BATAL
                                ElevatedButton(
                                  onPressed: () => Navigator.pop(context),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF7B4E3C),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 40,
                                      vertical: 15,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    elevation: 5,
                                  ),
                                  child: const Text(
                                    "BATAL",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 20),

                                // Tombol KELUAR
                                ElevatedButton(
                                  onPressed: () {
                                    SystemNavigator.pop(); // Tutup aplikasi
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFFE55C32),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 40,
                                      vertical: 15,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    elevation: 5,
                                  ),
                                  child: const Text(
                                    "KELUAR",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),

                const SizedBox(height: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
