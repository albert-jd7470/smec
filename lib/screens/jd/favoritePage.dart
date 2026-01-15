import 'package:flutter/material.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  int selectedIndex = 0;

  final List<String> categories = [
    "Flutter",
    "MERN",
    "UI/UX",
    "Python",
  ];

  /// Category-wise demo questions (5 each)
  final Map<String, List<Map<String, String>>> favoriteQuestions = {
    "Flutter": [
      {"q": "What is Flutter?", "a": "UI toolkit by Google"},
      {"q": "Which language Flutter uses?", "a": "Dart"},
      {"q": "What is Widget?", "a": "Basic UI building block"},
      {"q": "What is StatefulWidget?", "a": "Widget with mutable state"},
      {"q": "What is Hot Reload?", "a": "Quick UI update feature"},
    ],
    "MERN": [
      {"q": "What does MERN stand for?", "a": "MongoDB, Express, React, Node"},
      {"q": "What is MongoDB?", "a": "NoSQL database"},
      {"q": "What is Express?", "a": "Node.js framework"},
      {"q": "What is React?", "a": "Frontend JavaScript library"},
      {"q": "What is Node.js?", "a": "JavaScript runtime"},
    ],
    "UI/UX": [
      {"q": "What is UI?", "a": "User Interface"},
      {"q": "What is UX?", "a": "User Experience"},
      {"q": "What is wireframe?", "a": "Basic design layout"},
      {"q": "What is prototype?", "a": "Interactive design model"},
      {"q": "What is usability?", "a": "Ease of use"},
    ],
    "Python": [
      {"q": "What is Python?", "a": "High-level programming language"},
      {"q": "Who created Python?", "a": "Guido van Rossum"},
      {"q": "What is list?", "a": "Ordered mutable collection"},
      {"q": "What is tuple?", "a": "Ordered immutable collection"},
      {"q": "What is dictionary?", "a": "Key-value pair structure"},
    ],
  };
  Widget item(String course, int index) {
    final bool isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Container(
          height: 45,
          padding: const EdgeInsets.symmetric(horizontal: 18),
          decoration: BoxDecoration(
            color: isSelected ? Colors.teal : Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.teal),
          ),
          child: Center(
            child: Text(
              course,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.teal,
                fontSize: 14,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final String selectedCategory = categories[selectedIndex];
    final List<Map<String, String>> questions =
    favoriteQuestions[selectedCategory]!;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Favorite Questions",
          style: TextStyle(
            color: Colors.teal,
            fontSize: 18,
            fontFamily: 'Poppins',
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(height: 45),

          //-------Category
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                categories.length,
                    (index) => item(categories[index], index),
              ),
            ),
          ),

          const SizedBox(height: 25),

          //---------FavoriteQuestionsList
          Expanded(
            child: ListView.builder(
              itemCount: questions.length,
              padding: const EdgeInsets.all(8),
              itemBuilder: (context, index) {
                final item = questions[index];

                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Container(
                    height: 100,
                    width: double.infinity,
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
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  item["q"]!,
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
                                    color: Colors.black38,
                                    fontFamily: "Poppins",
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Icon(
                            Icons.favorite,
                            color: Colors.teal,
                          ),
                        ],
                      ),
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
