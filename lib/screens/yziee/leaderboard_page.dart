import 'package:flutter/material.dart';

class LeaderboardPage extends StatefulWidget {
  const LeaderboardPage({super.key});

  @override
  State<LeaderboardPage> createState() => _LeaderboardPageState();
}

class _LeaderboardPageState extends State<LeaderboardPage> {
  int selectedIndex = 0;

  final List<String> subjects = [
    "Flutter",
    "Python",
    "Java",
    "UI/UX",
    "Aptitude",
  ];

  final List<Map<String, dynamic>> leaderboardData = [
    {"rank": 1, "name": "Yazi", "score": 980, "accuracy": "98%"},
    {"rank": 2, "name": "Vinayak", "score": 950, "accuracy": "95%"},
    {"rank": 3, "name": "Razeen", "score": 920, "accuracy": "92%"},
    {"rank": 4, "name": "Govind", "score": 890, "accuracy": "89%"},
    {"rank": 5, "name": "Nihala", "score": 860, "accuracy": "86%"},
  ];

  Color rankColor(int rank) {
    if (rank == 1) return Colors.amber; // Gold
    if (rank == 2) return Colors.grey; // Silver
    if (rank == 3) return const Color(0xffCD7F32); // Bronze
    return Colors.teal;
  }

  IconData? rankIcon(int rank) {
    if (rank <= 3) return Icons.emoji_events;
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title:  Text(
          "LeaderBoard",
          style: TextStyle(
            color: Colors.teal,
            fontSize: 18,
            fontFamily: 'Poppins',
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 45),
          SizedBox(
            height: 45,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: subjects.length,
              separatorBuilder: (_, __) => const SizedBox(width: 12),
              itemBuilder: (context, index) {
                final isSelected = selectedIndex == index;

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
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
                        subjects[index],
                        style: TextStyle(
                          color: isSelected ? Colors.white : Colors.teal,
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 16),

          /// LEADERBOARD LIST
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: leaderboardData.length,
              itemBuilder: (context, index) {
                final data = leaderboardData[index];
                final rank = data["rank"];

                return Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  padding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.08),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [

                      /// RANK BADGE
                      Container(
                        height: 42,
                        width: 42,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: rankColor(rank),
                        ),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Text(
                              "$rank",
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Poppins",
                              ),
                            ),
                            if (rankIcon(rank) != null)
                              Positioned(
                                top: -4,
                                child: Icon(
                                  rankIcon(rank),
                                  size: 14,
                                  color: Colors.white,
                                ),
                              ),
                          ],
                        ),
                      ),

                      const SizedBox(width: 14),

                      /// STUDENT INFO
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              data["name"],
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                fontFamily: "Poppins",
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              "Accuracy • ${data["accuracy"]}",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey.shade600,
                                fontFamily: "Poppins",
                              ),
                            ),
                          ],
                        ),
                      ),

                      /// SCORE
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text(
                            "Score",
                            style: TextStyle(
                              fontSize: 11,
                              color: Colors.grey,
                              fontFamily: "Poppins",
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            data["score"].toString(),
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.teal,
                              fontFamily: "Poppins",
                            ),
                          ),
                        ],
                      ),
                    ],
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
