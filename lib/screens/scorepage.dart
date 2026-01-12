import 'package:flutter/material.dart';
import 'package:smec/widgets/navigation.dart';

class ScorePage extends StatefulWidget {
  const ScorePage({super.key});

  @override
  State<ScorePage> createState() => _ScorePageState();
}

class _ScorePageState extends State<ScorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 350,
              width: 350,
              decoration: BoxDecoration(
                color: Colors.teal,
                borderRadius: BorderRadius.circular(200),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Congratulations!",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
                  fontFamily: "Kufam"

              ),
            ),
            const Text(
              "Great Job,Username! You Did It",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
                  fontFamily: "Kufam"
              ),
            ),

            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 65,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: Colors.teal,
                  borderRadius: BorderRadius.circular(15),
                ),
                child:  Center(
                  child: Text(
                    "Share Score!",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: "Kufam"
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            GestureDetector(
              onTap: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const BottomNavig()),
                      (route) => false,
                );
              },
              child: Padding(
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
                      "Back To Home",
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
            ),

          ],
        ),
      ),
    );
  }
}
