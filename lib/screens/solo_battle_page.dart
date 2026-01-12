import 'dart:async';
import 'package:flutter/material.dart';
import 'solo_result_page.dart';

class SoloBattlePage extends StatefulWidget {
  const SoloBattlePage({super.key});

  @override
  State<SoloBattlePage> createState() => _SoloBattlePageState();
}

class _SoloBattlePageState extends State<SoloBattlePage> {
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
      backgroundColor: const Color(0xFF0E1F2F),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Solo Battle'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Question ${currentIndex + 1}/${questions.length}',
              style: const TextStyle(color: Colors.white70),
            ),
            const SizedBox(height: 10),

            LinearProgressIndicator(
              value: timeLeft / 15,
              color: Colors.redAccent,
              backgroundColor: Colors.white12,
            ),

            const SizedBox(height: 30),

            Text(
              q['question'],
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 30),

            ...q['options'].map<Widget>((opt) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF152A3A),
                    padding: const EdgeInsets.all(16),
                  ),
                  onPressed: () => _selectAnswer(opt),
                  child: Text(opt),
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
