import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'pemilihan_misi_page.dart';
import 'pencapaian_dunia_bangga.dart'; // Tambahkan halaman pencapaian

class DuniaBanggaGamePage extends StatefulWidget {
  const DuniaBanggaGamePage({super.key});

  @override
  State<DuniaBanggaGamePage> createState() => _DuniaBanggaGamePageState();
}

class _DuniaBanggaGamePageState extends State<DuniaBanggaGamePage> {
  int currentQuestion = 0;
  int score = 0;
  int correctAnswers = 0;
  int wrongAnswers = 0;
  int selectedAnswerIndex = -1;
  int lives = 3;
  late Timer timer;
  int timeLeft = 180;

  final List<Map<String, dynamic>> questions = [];

  final List<Map<String, dynamic>> questionData = [
    {
      'image': 'assets/images/game/dunia-bangga/asli-5.jpeg',
      'question': 'Siapa pahlawan yang ada di uang Rp. 100.000?',
      'answers': [
        'Megawati & Jokowi',
        'Prabowo & Gibran',
        'Ir. Soekarno & Moh. Hatta',
        'Jokowi & Jusuf Kalla',
      ],
      'correct': 2,
    },
    {
      'image': 'assets/images/game/dunia-bangga/asli-6.jpeg',
      'question': 'Siapa pahlawan di uang Rp. 50.000?',
      'answers': [
        'I Gusti Ngurah Rai',
        'Tuanku Imam Bonjol',
        'Ir. Soekarno',
        'Djuanda Kartawidjaja',
      ],
      'correct': 3,
    },
    {
      'image': 'assets/images/game/dunia-bangga/asli-7.png',
      'question': 'Siapa pahlawan di uang Rp. 2.000?',
      'answers': [
        'Moh. Hatta',
        'Moh. Yamin',
        'M. Husni Thamrin',
        'Tjut Meutia',
      ],
      'correct': 2,
    },
    {
      'image': 'assets/images/game/dunia-bangga/asli-3.jpeg',
      'question': 'Siapa pahlawan di uang Rp. 1.000?',
      'answers': [
        'R.A. Kartini',
        'Pattimura',
        'Cut Nyak Dien',
        'Tjut Meutia',
      ],
      'correct': 3,
    },
    {
      'image': 'assets/images/game/dunia-bangga/asli-1.png',
      'question': 'Siapa pahlawan di uang Rp. 5.000?',
      'answers': [
        'Dr. K.H. Idham Chalid',
        'Dr. Soetomo',
        'Ki Hajar Dewantara',
        'Raden Saleh',
      ],
      'correct': 0,
    },
    {
      'image': 'assets/images/game/dunia-bangga/asli-2.png',
      'question': 'Siapa pahlawan di uang Rp. 10.000?',
      'answers': [
        'Frans Kaisiepo',
        'Sam Ratulangi',
        'Wage Rudolf Soepratman',
        'Cut Nyak Meutia',
      ],
      'correct': 0,
    },
    {
      'image': 'assets/images/game/dunia-bangga/asli-4.jpeg',
      'question': 'Siapa pahlawan di uang Rp. 20.000?',
      'answers': [
        'Oto Iskandar Di Nata',
        'Dr. G.S.S.J. Ratulangi',
        'Sultan Hasanuddin',
        'Ir. Soekarno',
      ],
      'correct': 1,
    },
    {
      'image': 'assets/images/game/dunia-bangga/asli-7.png',
      'question': 'Siapa pahlawan di uang Rp. 2.000?',
      'answers': [
        'Tjut Nyak Dhien',
        'M. Husni Thamrin',
        'R.A. Kartini',
        'Martha Christina Tiahahu',
      ],
      'correct': 1,
    },
    {
      'image': 'assets/images/game/dunia-bangga/asli-6.jpeg',
      'question': 'Siapa pahlawan di uang Rp. 50.000?',
      'answers': [
        'Djuanda Kartawidjaja',
        'M. Husni Thamrin',
        'Sultan Hasanuddin',
        'Ir. Soekarno',
      ],
      'correct': 0,
    },
    {
      'image': 'assets/images/game/dunia-bangga/asli-5.jpeg',
      'question': 'Siapa pahlawan di uang Rp. 100.000?',
      'answers': [
        'Ir. Soekarno & Moh. Hatta',
        'Ir. Soekarno & Jenderal Soedirman',
        'Moh. Hatta & Ki Hajar Dewantara',
        'Moh. Yamin & R.A. Kartini',
      ],
      'correct': 0,
    },
  ];

  @override
  void initState() {
    super.initState();
    questionData.shuffle();
    questions.addAll(questionData.take(10));
    startTimer();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (timeLeft > 0) {
        setState(() {
          timeLeft--;
        });
      } else {
        t.cancel();
        endGame();
      }
    });
  }

  void checkAnswer(int index) {
    if (selectedAnswerIndex != -1) return;

    setState(() {
      selectedAnswerIndex = index;
      if (index == questions[currentQuestion]['correct']) {
        score += 100;
        correctAnswers++;
      } else {
        wrongAnswers++;
        lives -= 1;
        if (lives <= 0) {
          timer.cancel();
          endGame();
        }
      }
    });
  }

  void nextQuestion() {
    if (currentQuestion < questions.length - 1) {
      setState(() {
        currentQuestion++;
        selectedAnswerIndex = -1;
      });
    } else {
      timer.cancel();
      endGame();
    }
  }

  void endGame() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Permainan Selesai'),
        content: Text('Jawaban Benar: $correctAnswers\nJawaban Salah: $wrongAnswers'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => PencapaianDuniaBanggaPage(
                  skorBenar: correctAnswers,
                  skorSalah: wrongAnswers,
                ),
              ),
            ),
            child: const Text('Lihat Pencapaian'),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final q = questions[currentQuestion];
    return Scaffold(
    body: Stack(
      children: [
        // Background gambar
        Positioned.fill(
          child: Image.asset(
            'assets/images/game/dunia-bangga/background.png',
            fit: BoxFit.cover,
          ),
        ),

        // Konten utama game
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '⏰ ${Duration(seconds: timeLeft).inMinutes}:${(timeLeft % 60).toString().padLeft(2, '0')}',
                      style: const TextStyle(fontSize: 16),
                    ),
                    Row(
                      children: List.generate(
                        3,
                        (index) => Icon(
                          Icons.favorite,
                          color: index < lives ? Colors.red : Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.lightBlue.shade100,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    children: [
                      Image.asset(
                        q['image'],
                        height: 120,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        q['question'],
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                ...List.generate(q['answers'].length, (i) {
                  final isSelected = i == selectedAnswerIndex;
                  final isCorrect = q['correct'] == i;
                  Color? fillColor;
                  if (selectedAnswerIndex != -1) {
                    if (isCorrect) fillColor = Colors.green;
                    else if (isSelected) fillColor = Colors.red;
                 }
                  return GestureDetector(
                    onTap: () => checkAnswer(i),
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 6),
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                      decoration: BoxDecoration(
                        color: fillColor ?? Colors.white,
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(color: Colors.black),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            isSelected
                                ? Icons.radio_button_checked
                                : Icons.radio_button_off,
                            color: Colors.black,
                          ),
                          const SizedBox(width: 12),
                          Expanded(child: Text(q['answers'][i])),
                        ],
                      ),
                    ),
                  );
                }),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: selectedAnswerIndex != -1 ? nextQuestion : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFE94E38),
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                      side: const BorderSide(color: Colors.black, width: 2),
                    ),
                  ),
                  child: const Text(
                    'Selanjutnya',
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
                const Spacer(),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Image.asset(
                    'assets/images/game/dunia-bangga/si_rupi_waving.png',
                    height: 250,
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    ),
  );

}
}
