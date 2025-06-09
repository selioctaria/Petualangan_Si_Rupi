import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'main_menu_page.dart';
import 'pencapaian_dunia_paham.dart';

class DuniaPahamGamePage extends StatefulWidget {
  const DuniaPahamGamePage({super.key});

  @override
  State<DuniaPahamGamePage> createState() => _DuniaPahamGamePageState();
}

class _DuniaPahamGamePageState extends State<DuniaPahamGamePage> {
  final List<String> itemList = ['buku', 'parfum', 'mainan', 'tas', 'sepatu'];
  final List<int> nominalList = [1000, 2000, 5000, 10000, 20000, 50000];
  int harga = 0;
  String item = '';
  List<Map<String, dynamic>> pilihanUang = [];
  Set<String> selectedIds = {};
  int currentSoal = 1;
  int nyawa = 3;
  int skor = 0;

  Timer? timer;
  Duration remaining = const Duration(minutes: 3);

  @override
  void initState() {
    super.initState();
    generateSoal();
    startTimer();
  }

  void startTimer() {
    timer?.cancel();
    remaining = const Duration(minutes: 3);
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() {
        if (remaining.inSeconds > 0) {
          remaining -= const Duration(seconds: 1);
        } else {
          timer?.cancel();
          showGameOverOptions();
        }
      });
    });
  }

  void generateSoal() {
    final rand = Random();
    item = itemList[rand.nextInt(itemList.length)];
    pilihanUang.clear();
    selectedIds.clear();
    harga = 0;

    int count = rand.nextInt(2) + 2;
    List<int> kombinasi = [];

    for (int i = 0; i < count; i++) {
      int nominal = nominalList[rand.nextInt(nominalList.length)];
      kombinasi.add(nominal);
      harga += nominal;
    }

    for (var nominal in kombinasi) {
      pilihanUang.add({'id': UniqueKey().toString(), 'value': nominal});
    }

    while (pilihanUang.length < 4) {
      int extra = nominalList[rand.nextInt(nominalList.length)];
      if (!kombinasi.contains(extra)) {
        pilihanUang.add({'id': UniqueKey().toString(), 'value': extra});
      }
    }

    pilihanUang.shuffle();
  }

  String formatRupiah(int value) {
    return "Rp${value.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (m) => '${m[1]}.',
    )}";
  }

  void bayar() {
    int total = 0;
    for (var uang in pilihanUang) {
      if (selectedIds.contains(uang['id'])) {
        total += uang['value'] as int;
      }
    }

    bool benar = total == harga;
    if (benar) {
      skor += 100;
    } else {
      nyawa--;
    }

    if (nyawa <= 0 || currentSoal >= 10) {
      timer?.cancel();
      showGameOverOptions();
    } else {
      setState(() {
        currentSoal++;
        generateSoal();
      });
    }
  }

  void resetGame() {
    setState(() {
      skor = 0;
      nyawa = 3;
      currentSoal = 1;
      selectedIds.clear();
      generateSoal();
      startTimer();
    });
  }

  void showGameOverOptions() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        backgroundColor: const Color(0xFFF1EAF8),
        title: const Text(
          'Game Selesai!',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black87),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Skor Anda: $skor',
              style: const TextStyle(fontSize: 16, color: Colors.black87),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    resetGame();
                  },
                  child: const Text('Main Lagi', style: TextStyle(color: Colors.deepPurple)),
                ),
                const SizedBox(width: 8),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => const MainMenuPage()),
                    );
                  },
                  child: const Text('Keluar', style: TextStyle(color: Colors.deepPurple)),
                ),
              ],
            ),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => PencapaianDuniaPahamPage(skor: skor),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.deepPurple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                    side: const BorderSide(color: Colors.deepPurple),
                  ),
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                ),
                child: const Text(
                  'Lihat Pencapaian',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final minutes = remaining.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = remaining.inSeconds.remainder(60).toString().padLeft(2, '0');

    return Scaffold(
      backgroundColor: const Color(0xFF5AA2D5),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/game/dunia-paham/background.png',
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("⏱ $minutes:$seconds",
                          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                      Row(
                        children: List.generate(3, (index) {
                          return Icon(
                            index < nyawa ? Icons.favorite : Icons.favorite_border,
                            color: Colors.red,
                          );
                        }),
                      ),
                      Text(
                        "$currentSoal/10",
                        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      "Kamu membeli sebuah $item seharga ${formatRupiah(harga)}. Ambil uang yang sesuai dari dompetmu!",
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: GridView.count(
                      crossAxisCount: 2,
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12,
                      children: pilihanUang.map((uang) {
                        final id = uang['id'];
                        final nominal = uang['value'] as int;
                        final isSelected = selectedIds.contains(id);
                        final ext = [2000, 5000, 10000].contains(nominal) ? 'png' : 'jpeg';

                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              if (isSelected) {
                                selectedIds.remove(id);
                              } else {
                                selectedIds.add(id);
                              }
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: const [
                                BoxShadow(color: Colors.black26, blurRadius: 4, offset: Offset(2, 2)),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Image.asset(
                                      'assets/images/game/dunia-paham/uang_$nominal.$ext',
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                Icon(
                                  isSelected ? Icons.radio_button_checked : Icons.radio_button_off,
                                  color: isSelected ? Colors.green : Colors.grey,
                                ),
                                const SizedBox(height: 6),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      onPressed: () {
                        resetGame();
                      },
                      child: const Text("Reset", style: TextStyle(color: Colors.white)),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      onPressed: bayar,
                      child: const Text("Bayar", style: TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Image.asset(
                  'assets/images/game/dunia-paham/coin_mascot.png',
                  height: 200,
                  width: 900,
                  alignment: Alignment.topRight,
                ),
                const SizedBox(height: 10),
              ],
            ),
          )
        ],
      ),
    );
  }
}
