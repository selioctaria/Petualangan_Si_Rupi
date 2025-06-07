import 'package:flutter/material.dart';

class SalahPage extends StatelessWidget {
  const SalahPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF5AA2D5), // Warna biru dari background
      body: Stack(
        children: [
          // Background awan
          Positioned.fill(
            child: Image.asset(
              'assets/images/pencapaian/background.png',
              fit: BoxFit.cover,
            ),
          ),

          // Konten utama
          SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 30),
                  // Tombol Selanjutnya di kanan atas
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: ElevatedButton(
                        onPressed: () {
                          // Ganti halaman sesuai kebutuhan
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFF7941F), // Oranye
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                            side: const BorderSide(color: Colors.black, width: 1.5),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                          elevation: 4,
                        ),
                        child: const Text(
                          'Selanjutnya',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            shadows: [
                              Shadow(
                                offset: Offset(1, 1),
                                color: Colors.black38,
                                blurRadius: 1,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 50),

                  // Gambar koin Si Rupi senang
                  Image.asset(
                    'assets/images/benar_salah/salah.png',
                    height: 400,
                  ),

                  const SizedBox(height: 0),

                  // Kotak notifikasi jawaban salah
                  Container(
                    width: 300, // Lebar kotak
                    height: 80, // Tinggi kotak
                    padding: const EdgeInsets.all(14),
                    margin: const EdgeInsets.symmetric(horizontal: 32),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFF0C2),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.black, width: 1.5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.cancel, color: Colors.red, size: 30),
                        SizedBox(width: 10),
                        Flexible(
                          child: Text(
                            'Jawaban kamu salah!',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),


                  const Spacer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
