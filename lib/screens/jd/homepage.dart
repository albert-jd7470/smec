import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smec/screens/jd/choosePage.dart';
import 'package:smec/screens/jd/recentQuizz.dart';
import '../yziee/profile.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final PageController _pageController =
  PageController(viewportFraction: 0.9);
  int _currentBanner = 0;

  final List<Map<String, String>> banners = [
    {
      "title": "Boost your skills with daily quizzes",
      "image": "assets/carousel/carousel1.jpg",
    },
    {
      "title": "Track your progress & rank",
      "image": "assets/carousel/carousel2.jpg",
    },
    {
      "title": "Compete globally and win points",
      "image":"assets/carousel/carousel3.jpg",
    },
  ];

  final List<String> courses = [
    "UI/UX",
    "Software Testing",
    "Python Full Stack",
    "Full Stack",
    "Flutter",
    "Networking",
    "Graphics Designing",
    "MERN Stack",
  ];

  final List<String> courseimg = [
    "assets/icons/ui-ux.png",
    "assets/icons/software-test.png",
    "assets/icons/python.png",
    "assets/icons/full-stack.png",
    "assets/icons/flutter.png",
    "assets/icons/networking.png",
    "assets/icons/designer.png",
    "assets/icons/mern.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // ================= APP BAR =================
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.teal,
              borderRadius: BorderRadius.circular(30),
            ),
            child: const Row(
              children: [
                Icon(Icons.token, color: Colors.orange),
                SizedBox(width: 6),
                Text(
                  "3000",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          )
        ],
      ),

      // ================= BODY =================
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // ===== GREETING =====
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Row(
                        children: [
                          Icon(Icons.sunny, color: Colors.orange),
                          SizedBox(width: 6),
                          Text(
                            "Good Morning",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.teal,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 4),
                      Text(
                        "User Name",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Poppins",
                        ),
                      ),
                    ],
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(50),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const ProfilePage(),
                        ),
                      );
                    },
                    child: const CircleAvatar(
                      radius: 28,
                      backgroundColor: Colors.teal,
                      child: Icon(Icons.person, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // ================= CAROUSEL WITH IMAGES =================
            SizedBox(
              height: 170,
              child: PageView.builder(
                controller: _pageController,
                itemCount: banners.length,
                onPageChanged: (index) {
                  setState(() => _currentBanner = index);
                },
                itemBuilder: (_, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      image: DecorationImage(
                        image:
                        AssetImage(banners[index]["image"]!),
                        fit: BoxFit.cover,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.15),
                          blurRadius: 12,
                          offset: const Offset(0, 6),
                        ),
                      ],
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Colors.teal.withOpacity(0.85),
                            Colors.transparent,
                          ],
                        ),
                      ),
                      padding: const EdgeInsets.all(20),
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        banners[index]["title"]!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontFamily: "Poppins",
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 12),

            // ===== DOT INDICATOR =====
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                banners.length,
                    (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  height: 8,
                  width: _currentBanner == index ? 20 : 8,
                  decoration: BoxDecoration(
                    color: _currentBanner == index
                        ? Colors.teal
                        : Colors.teal.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 24),

            // ================= CATEGORIES =================
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Categories",
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w600,
                  color: Colors.teal,
                ),
              ),
            ),

            const SizedBox(height: 12),

            SizedBox(
              height: 130,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding:
                const EdgeInsets.symmetric(horizontal: 16),
                itemCount: courses.length,
                itemBuilder: (_, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ChoosePage(
                            course: courses[index],
                            courseicon: courseimg[index],
                          ),
                        ),
                      );
                    },
                    child: Container(
                      width: 120,
                      margin: const EdgeInsets.only(right: 12),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(18),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.08),
                            blurRadius: 10,
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Image.asset(courseimg[index], height: 48),
                          const SizedBox(height: 10),
                          Text(
                            courses[index],
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            style: const TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 12,
                              color: Colors.teal,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 24),

            // ================= RECENT ACTIVITY =================
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: const [
                  Text(
                    "Recent Activity",
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600,
                      color: Colors.teal,
                    ),
                  ),
                  Spacer(),
                  Icon(Icons.arrow_forward_ios,
                      size: 16, color: Colors.teal),
                ],
              ),
            ),

            const SizedBox(height: 16),

            _recentCard(
              context,
              title: "Python Full Stack",
              score: "28/30",
              color: Colors.green,
              icon: "assets/icons/python.png",
            ),
            _recentCard(
              context,
              title: "Flutter",
              score: "9/30",
              color: Colors.red,
              icon: "assets/icons/flutter.png",
            ),
            _recentCard(
              context,
              title: "Dart",
              score: "18/30",
              color: Colors.orange,
              icon: "assets/icons/dart.png",
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  // ================= RECENT CARD =================
  Widget _recentCard(
      BuildContext context, {
        required String title,
        required String score,
        required Color color,
        required String icon,
      }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => RecentQuizz()),
        );
      },
      child: Container(
        margin:
        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Row(
          children: [
            Image.asset(icon, height: 48),
            const SizedBox(width: 14),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  "30 questions",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
            const Spacer(),
            Container(
              height: 48,
              width: 48,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: color, width: 4),
              ),
              child: Center(
                child: Text(
                  score,
                  style: const TextStyle(
                    fontSize: 12,
                    fontFamily: "Poppins",
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
