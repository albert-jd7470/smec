import 'package:flutter/material.dart';

class ScoreUIPage extends StatefulWidget {
  const ScoreUIPage({super.key});

  @override
  State<ScoreUIPage> createState() => _ScoreUIPageState();
}

class _ScoreUIPageState extends State<ScoreUIPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Container(
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              children: [
                SizedBox(height: 40),

                // Score Circle
                Container(
                  width: 160,
                  height: 160,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.teal,
                    border: Border.all(color: Colors.teal, width: 8),
                  ),
                  child: const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Your Score",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "29/30",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 30),

                // Title
                Text(
                  "Congratulation",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: Colors.teal,
                  ),
                ),

                SizedBox(height: 10),

                // Subtitle
                Text(
                  "Great job, Rumi Aktar! You Did It",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    color: Colors.black54,
                  ),
                  textAlign: TextAlign.center,
                ),

                Spacer(),

                // Share Button
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      "Share",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 15),

                // Back Button
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      "Back to Home",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
