import 'package:flutter/material.dart';

class RecentQuizz extends StatefulWidget {
  const RecentQuizz({super.key});

  @override
  State<RecentQuizz> createState() => _RecentQuizzState();
}

class _RecentQuizzState extends State<RecentQuizz> {

  final List<Map<String, String>> pythonQuestions = [
    {"q": "What is Python?", "a": "A high-level programming language"},
    {"q": "Who developed Python?", "a": "Guido van Rossum"},
    {"q": "What is PEP?", "a": "Python Enhancement Proposal"},
    {"q": "What is a virtual environment?", "a": "An isolated Python environment"},
    {"q": "Which keyword is used to define a function?", "a": "def"},
    {"q": "What data type is used to store text?", "a": "String"},
    {"q": "What does len() do?", "a": "Returns length of an object"},
    {"q": "Which symbol is used for comments?", "a": "#"},
    {"q": "What is a list?", "a": "Ordered and mutable collection"},
    {"q": "What is a tuple?", "a": "Ordered and immutable collection"},
    {"q": "What is a dictionary?", "a": "Key-value pair collection"},
    {"q": "What is None?", "a": "Represents no value"},
    {"q": "What is indentation?", "a": "Whitespace used to define blocks"},
    {"q": "What loop is used to iterate?", "a": "for loop"},
    {"q": "What does break do?", "a": "Stops loop execution"},
    {"q": "What does continue do?", "a": "Skips current iteration"},
    {"q": "What is Flask?", "a": "A lightweight web framework"},
    {"q": "What is Django?", "a": "A high-level web framework"},
    {"q": "What is ORM?", "a": "Object Relational Mapping"},
    {"q": "Which database Django uses by default?", "a": "SQLite"},
    {"q": "What is pip?", "a": "Python package manager"},
    {"q": "What is NumPy?", "a": "Numerical computing library"},
    {"q": "What is Pandas?", "a": "Data analysis library"},
    {"q": "What is Matplotlib?", "a": "Data visualization library"},
    {"q": "What is TensorFlow?", "a": "Machine learning library"},
    {"q": "What is exception handling?", "a": "Handling runtime errors"},
    {"q": "Which block handles errors?", "a": "try-except"},
    {"q": "What is API?", "a": "Application Programming Interface"},
    {"q": "What is JSON?", "a": "Data interchange format"},
    {"q": "What is REST?", "a": "Architectural style for APIs"},
  ];

  /// demo logic: first 28 correct, last 2 wrong
  bool isCorrectAnswer(int index) => index < 28;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_sharp, color: Colors.teal),
        ),
      ),

      body: Column(
        children: [

          const SizedBox(height: 20),

          Container(
            height: 50,
            width: 90,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/icons/python.png"),
              ),
            ),
          ),

          const SizedBox(height: 10),

          Column(
            children: const [
              Text(
                "Python Full Stack",
                style: TextStyle(
                  color: Colors.teal,
                  fontSize: 25,
                  fontFamily: 'Poppins',
                ),
              ),
              Text(
                "Played on 31-05-2026",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                  fontFamily: 'Poppins',
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          /// Stats Row
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                _StatItem(title: "30", subtitle: "Total Questions", color: Colors.teal),
                _StatItem(title: "28", subtitle: "Correct Answers", color: Colors.green),
                _StatItem(title: "2", subtitle: "Wrong Answers", color: Colors.red),
              ],
            ),
          ),

          const SizedBox(height: 10),

          /// QUESTIONS LIST
          Expanded(
            child: ListView.builder(
              itemCount: pythonQuestions.length,
              padding: const EdgeInsets.all(8),
              itemBuilder: (context, index) {
                final item = pythonQuestions[index];
                final isCorrect = isCorrectAnswer(index);

                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.12),
                          blurRadius: 10,
                          spreadRadius: 2,
                          offset: const Offset(0, 7),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        /// Question & Answer
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Q${index + 1}. ${item["q"]}",
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.teal,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                "Ans: ${item["a"]}",
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.black54,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Icon(
                          isCorrect ? Icons.check_circle : Icons.cancel,
                          color: isCorrect ? Colors.green : Colors.red,
                          size: 26,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color color;

  const _StatItem({
    required this.title,
    required this.subtitle,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
            color: color,
            fontSize: 25,
            fontWeight: FontWeight.w300,
            fontFamily: 'Kufam',
          ),
        ),
        Text(
          subtitle,
          style: const TextStyle(
            color: Colors.teal,
            fontSize: 14,
            fontWeight: FontWeight.w300,
            fontFamily: 'Kufam',
          ),
        ),
      ],
    );
  }
}
