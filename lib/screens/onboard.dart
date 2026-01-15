import 'dart:async';
import 'package:flutter/material.dart';
import 'package:smec/screens/jd/homepage.dart';
import 'package:smec/screens/loadingscreen.dart';
import 'package:smec/widgets/navigation.dart';

class Onboard extends StatefulWidget {
  const Onboard({super.key});

  @override
  State<Onboard> createState() => _OnboardState();
}

class _OnboardState extends State<Onboard> with SingleTickerProviderStateMixin {
  final PageController _controller = PageController();
  int _currentIndex = 0;

  late AnimationController animController;
  late Animation<double> _fadeAnim;
  late Animation<Offset> _slideAnim;
  late Animation<double> _scaleAnim;

  final List<Map<String, String>> _pages = [
    {
      "image": "assets/onboard1.jpg",
      "title": "Master Industry-Level Concepts",
      "subtitle":
      "Build a strong foundation with carefully structured IT concepts aligned with real interview expectations.",
    },
    {
      "image": "assets/onboard2.jpg",
      "title": "Prepare with Real Interview Questions",
      "subtitle":
      "Practice curated questions and assessments designed to reflect actual technical interview scenarios",
    },
    {
      "image": "assets/onboard3.jpg",
      "title": "Measure Progress. Improve Performance",
      "subtitle":
      "Track accuracy, identify knowledge gaps, and refine your preparation with data-driven insights",
    },
  ];

  @override
  void initState() {
    super.initState();

    animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );

    _fadeAnim = CurvedAnimation(
      parent: animController,
      curve: Curves.easeInOut,
    );

    _slideAnim = Tween<Offset>(begin: const Offset(0, 0.25), end: Offset.zero)
        .animate(
      CurvedAnimation(parent: animController, curve: Curves.easeOutCubic),
    );

    _scaleAnim = Tween<double>(
      begin: 1.05,
      end: 1.0,
    ).animate(CurvedAnimation(parent: animController, curve: Curves.easeOut));

    animController.forward();
  }

  @override
  void dispose() {
    animController.dispose();
    _controller.dispose();
    super.dispose();
  }

  void nextpage() {
    if (_currentIndex < _pages.length - 1) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) =>  Loadingscreen(nextPage: BottomNavig())),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // PAGE VIEW
          PageView.builder(
            controller: _controller,
            itemCount: _pages.length,
            onPageChanged: (index) {
              setState(() => _currentIndex = index);
              animController
                ..reset()
                ..forward();
            },
            itemBuilder: (context, index) {
              final page = _pages[index];
              return Stack(
                fit: StackFit.expand,
                children: [
                  AnimatedBuilder(
                    animation: _scaleAnim,
                    builder: (_, child) {
                      return Transform.scale(
                        scale: _scaleAnim.value,
                        child: Image.asset(page["image"]!, fit: BoxFit.cover),
                      );
                    },
                  ),

                  // DYNAMIC GRADIENT
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.black.withOpacity(0.85),
                          Colors.black.withOpacity(0.2),
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),

                  // TEXT CONTENT
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24, 0, 24, 120),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FadeTransition(
                          opacity: _fadeAnim,
                          child: SlideTransition(
                            position: _slideAnim,
                            child: Text(
                              page["title"]!,
                              style: const TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.w700,
                                // or w800 for extra impact
                                color: Colors.white,
                                letterSpacing: 0.3,
                                fontFamily: 'Poppins',
                                height: 1.2,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 14),
                        FadeTransition(
                          opacity: _fadeAnim,
                          child: SlideTransition(
                            position: _slideAnim,
                            child: Text(
                              page["subtitle"]!,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.white70,
                                fontFamily: 'Poppins',
                                height: 1.5,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),

          // SKIP BUTTON
          if (_currentIndex != _pages.length - 1)
            Positioned(
              top: 44,
              right: 20,
              child: TextButton(
                onPressed: () => _controller.jumpToPage(_pages.length - 1),
                child: const Text(
                  "Skip",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    fontFamily: "Poppins",
                  ),
                ),
              ),
            ),

          // BOTTOM CONTROLS
          Positioned(
            bottom: 30,
            left: 24,
            right: 24,
            child: Column(
              children: [
                // INDICATORS
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    _pages.length,
                        (index) => AnimatedContainer(
                      duration: const Duration(milliseconds: 350),
                      curve: Curves.easeInOut,
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      width: _currentIndex == index ? 26 : 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: _currentIndex == index
                            ? Colors.white
                            : Colors.white38,
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 22),

                // BUTTON WITH MICRO INTERACTION
                GestureDetector(
                  onTap: nextpage,
                  child: AnimatedScale(
                    duration: const Duration(milliseconds: 150),
                    scale: 1,
                    child: Container(
                      height: 54,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.25),
                            blurRadius: 12,
                            offset: const Offset(0, 6),
                          ),
                        ],
                      ),
                      child: Text(
                        _currentIndex == _pages.length - 1
                            ? "Get Started"
                            : "Next",
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600, // SemiBold
                          fontSize: 14,
                          letterSpacing: 1.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
