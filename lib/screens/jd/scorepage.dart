import 'package:flutter/material.dart';
import 'package:smec/widgets/navigation.dart';

class ScorePage extends StatefulWidget {
  const ScorePage({super.key});

  @override
  State<ScorePage> createState() => _ScorePageState();
}

class _ScorePageState extends State<ScorePage> {
  // 🔹 Demo values
  final int score = 28;
  final int total = 30;
  final String username = "JD";

  @override
  Widget build(BuildContext context) {
    final int percentage = ((score / total) * 100).round();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            /// 🔹 SCORE CIRCLE
            Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                color: Colors.teal,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.teal.withOpacity(0.4),
                    blurRadius: 25,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "$score / $total",
                    style: const TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: "Kufam",
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "$percentage%",
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white70,
                      fontFamily: "Kufam",
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            /// 🔹 TEXT
            const Text(
              "Congratulations!",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
                fontFamily: "Kufam",
              ),
            ),

            const SizedBox(height: 6),

            Text(
              "Great Job, $username! You Did It 🎉",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
                fontFamily: "Kufam",
              ),
            ),

            const SizedBox(height: 25),

            /// 🔹 SHARE SCORE
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 65,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.teal,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Center(
                  child: Text(
                    "Share Score!",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: "Kufam",
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 15),

            /// 🔹 BACK TO HOME
            GestureDetector(
              onTap: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => const BottomNavig()),
                      (route) => false,
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 65,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.teal),
                  ),
                  child: const Center(
                    child: Text(
                      "Back To Home",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal,
                        fontFamily: "Kufam",
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
