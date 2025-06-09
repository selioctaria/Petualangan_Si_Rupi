import 'package:flutter/material.dart';
import '../controller/audio_controller.dart'; // Sesuaikan path jika perlu

class PengaturanPage extends StatefulWidget {
  const PengaturanPage({super.key});

  @override
  State<PengaturanPage> createState() => _PengaturanPageState();
}

class _PengaturanPageState extends State<PengaturanPage> {
  bool musikAktif = AudioController().isMusicEnabled;
  bool efekSuaraAktif = AudioController().isSfxEnabled;
  bool efekGetarAktif = true;
  bool showRupi = false;

  final AudioController _audioController = AudioController();

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 300), () {
      if (mounted) setState(() => showRupi = true);
    });
  }

  void _mainkanKlik() {
    _audioController.playClickSound();
  }

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

                Image.asset(
                  'assets/images/pengaturan/teks-pengaturan.png',
                  height: 50,
                ),

                const SizedBox(height: 0),

                AnimatedOpacity(
                  opacity: showRupi ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 800),
                  child: Image.asset(
                    'assets/images/pengaturan/si_rupi_waving.png',
                    height: 350,
                  ),
                ),

                const SizedBox(height: 0),

                Transform.translate(
                  offset: const Offset(0, -60),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFFB2E0FF), Color(0xFFE0F7FF)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.blueAccent, width: 2),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          pengaturanItem(
                            label: 'MUSIK',
                            icon: Icons.music_note,
                            trailing: Switch(
                              value: musikAktif,
                              activeColor: Colors.amber,
                              onChanged: (value) {
                                setState(() {
                                  musikAktif = value;
                                  _audioController.setMusicEnabled(value);
                                  _mainkanKlik();
                                });
                              },
                            ),
                          ),
                          pengaturanItem(
                            label: 'EFEK SUARA',
                            icon: Icons.volume_up,
                            trailing: Switch(
                              value: efekSuaraAktif,
                              activeColor: Colors.amber,
                              onChanged: (value) {
                                setState(() {
                                  efekSuaraAktif = value;
                                  _audioController.setSfxEnabled(value);
                                  _mainkanKlik();
                                });
                              },
                            ),
                          ),
                          pengaturanItem(
                            label: 'EFEK GETAR',
                            icon: Icons.vibration,
                            trailing: Switch(
                              value: efekGetarAktif,
                              activeColor: Colors.amber,
                              onChanged: (value) {
                                setState(() {
                                  efekGetarAktif = value;
                                  _mainkanKlik();
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                ElevatedButton(
                  onPressed: () {
                    _mainkanKlik();
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFE94E38),
                    padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                      side: const BorderSide(color: Colors.black, width: 2),
                    ),
                    elevation: 10,
                    shadowColor: Colors.black,
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

  Widget pengaturanItem({required String label, required Widget trailing, IconData? icon}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              if (icon != null) Icon(icon, color: Colors.brown),
              const SizedBox(width: 8),
              Text(
                label,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.brown),
              ),
            ],
          ),
          trailing,
        ],
      ),
    );
  }
}
