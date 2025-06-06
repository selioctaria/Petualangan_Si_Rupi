import 'package:flutter/material.dart';
import 'main_menu_page.dart';

class PengaturanPage extends StatefulWidget {
  const PengaturanPage({super.key});

  @override
  State<PengaturanPage> createState() => _PengaturanPageState();
}

class _PengaturanPageState extends State<PengaturanPage> {
  bool musikAktif = true;
  bool efekSuaraAktif = true;
  String bahasa = 'Indonesia';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background penuh
          Positioned.fill(
            child: Image.asset(
              'assets/images/pengaturan/background-pengaturan.png',
              fit: BoxFit.cover,
            ),
          ),

          // Konten halaman
          SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 50),

                // Gambar teks "PENGATURAN"
                Image.asset(
                  'assets/images/pengaturan/teks-pengaturan.png',
                  height: 50,
                ),

                const SizedBox(height: 0),

                // Gambar Si Rupi melambai
                Image.asset(
                  'assets/images/pengaturan/si_rupi_waving.png',
                  height: 350,
                ),

                const SizedBox(height: 0),

                // Kotak pengaturan
                Transform.translate(
                  offset: const Offset(0, -60), // geser ke atas 30 piksel
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xFFB2E0FF),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.blueAccent, width: 2),
                      ),
                      child: Column(
                        children: [
                          pengaturanItem(
                            label: 'MUSIK',
                            trailing: Switch(
                              value: musikAktif,
                              activeColor: Colors.amber,
                              onChanged: (value) {
                                setState(() => musikAktif = value);
                              },
                            ),
                          ),
                          pengaturanItem(
                            label: 'EFEK SUARA',
                            trailing: Switch(
                              value: efekSuaraAktif,
                              activeColor: Colors.amber,
                              onChanged: (value) {
                                setState(() => efekSuaraAktif = value);
                              },
                            ),
                          ),
                          pengaturanItem(
                            label: 'BAHASA',
                            trailing: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: Colors.blueGrey),
                              ),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  value: bahasa,
                                  items: const [
                                    DropdownMenuItem(value: 'Indonesia', child: Text('Indonesia')),
                                    DropdownMenuItem(value: 'English', child: Text('English')),
                                  ],
                                  onChanged: (value) {
                                    if (value != null) {
                                      setState(() => bahasa = value);
                                    }
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),


                const SizedBox(height: 24),

                // Tombol kembali
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


  Widget pengaturanItem({required String label, required Widget trailing}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.brown),
          ),
          trailing,
        ],
      ),
    );
  }
}