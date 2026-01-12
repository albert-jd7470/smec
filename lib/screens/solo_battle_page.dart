import 'dart:async';
import 'package:flutter/material.dart';
import 'solo_result_page.dart';

class SoloBattlePage extends StatefulWidget {
  const SoloBattlePage({super.key});

  @override
  State<SoloBattlePage> createState() => _SoloBattlePageState();
}

class _SoloBattlePageState extends State<SoloBattlePage> {
  static const Color primaryTeal = Color(0xFF0FA3A9);

  int currentIndex = 0;
  int score = 0;
  int timeLeft = 15;
  Timer? timer;

  final List<Map<String, dynamic>> questions = [
    {
      'question': 'What is Flutter?',
      'options': ['SDK', 'IDE', 'Language', 'Framework'],
      'answer': 'SDK',
    },
    {
      'question': 'Flutter uses which language?',
      'options': ['Java', 'Kotlin', 'Dart', 'Swift'],
      'answer': 'Dart',
    },
    {
      'question': 'Who developed Flutter?',
      'options': ['Apple', 'Microsoft', 'Google', 'Meta'],
      'answer': 'Google',
    },
  ];

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    timer?.cancel();
    timeLeft = 15;
    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (timeLeft == 0) {
        _nextQuestion();
      } else {
        setState(() => timeLeft--);
      }
    });
  }

  void _selectAnswer(String option) {
    if (option == questions[currentIndex]['answer']) {
      score++;
    }
    _nextQuestion();
  }

  void _nextQuestion() {
    timer?.cancel();
    if (currentIndex < questions.length - 1) {
      setState(() => currentIndex++);
      _startTimer();
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => SoloResultPage(),
        ),
      );
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final q = questions[currentIndex];

    return Scaffold(
      backgroundColor: const Color(0xFFF4FAFA),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          'Solo Battle',
          style: TextStyle(
            fontFamily: 'Poppins',
            color: primaryTeal,
            fontWeight: FontWeight.w600,
          ),
        ),
        iconTheme: const IconThemeData(color: primaryTeal),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ===== QUESTION COUNT =====
            Text(
              'Question ${currentIndex + 1} / ${questions.length}',
              style: const TextStyle(
                fontFamily: 'Poppins',
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 10),

            // ===== TIMER BAR =====
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: LinearProgressIndicator(
                value: timeLeft / 15,
                minHeight: 8,
                color: primaryTeal,
                backgroundColor: primaryTeal.withOpacity(0.2),
              ),
            ),

            const SizedBox(height: 30),

            // ===== QUESTION =====
            Text(
              q['question'],
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: Color(0xFF102A43),
              ),
            ),

            const SizedBox(height: 30),

            // ===== OPTIONS =====
            ...q['options'].map<Widget>((opt) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 14),
                child: InkWell(
                  borderRadius: BorderRadius.circular(18),
                  onTap: () => _selectAnswer(opt),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 12,
                          offset: const Offset(0, 6),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 18,
                          backgroundColor:
                          primaryTeal.withOpacity(0.15),
                          child: const Icon(
                            Icons.circle,
                            size: 10,
                            color: primaryTeal,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Text(
                          opt,
                          style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF102A43),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
