import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smec/screens/challenge_page.dart';
import 'package:smec/screens/homepage.dart';
import 'package:smec/screens/profile.dart';

class BottomNavig extends StatefulWidget {
  const BottomNavig({super.key});

  @override
  State<BottomNavig> createState() => _BottomNavigState();
}

class _BottomNavigState extends State<BottomNavig> {
  static const Color primaryTeal = Color(0xFF0FA3A9);

  int _currentIndex = 2;
  late final PageController _pageController;

  final List<Widget> _pages = const [
    Homepage(),
    Homepage(),
    ChallengePage(),
    Homepage(),
    ProfilePage(),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  // ===== TAP FROM BOTTOM NAV =====
  void _onTabTap(int index) {
    setState(() => _currentIndex = index);

    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeOutBack, // bounce animation
    );
  }

  // ===== SWIPE PAGE =====
  void _onPageChanged(int index) {
    setState(() => _currentIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4FAFA),

      // ===== PAGE VIEW (SWIPE ENABLED) =====
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged, // 👈 sync nav with swipe
        physics: const BouncingScrollPhysics(),
        children: _pages,
      ),

      // ===== CENTER TROPHY =====
      floatingActionButton: _buildNavItem(
        icon: Icons.emoji_events,
        index: 2,
        isCenter: true,
      ),

      floatingActionButtonLocation:
      FloatingActionButtonLocation.centerDocked,

      // ===== BOTTOM BAR =====
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        elevation: 12,
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: SizedBox(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(
                icon: CupertinoIcons.home,
                index: 0,
              ),
              _buildNavItem(
                icon: Icons.dashboard,
                index: 1,
              ),
              const SizedBox(width: 50),
              _buildNavItem(
                icon: Icons.favorite_border,
                index: 3,
              ),
              _buildNavItem(
                icon: Icons.person,
                index: 4,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ===== POP-OUT NAV ITEM =====
  Widget _buildNavItem({
    required IconData icon,
    required int index,
    bool isCenter = false,
  }) {
    final bool isSelected = _currentIndex == index;

    return GestureDetector(
      onTap: () => _onTabTap(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOutBack,
        transform:
        Matrix4.translationValues(0, isSelected ? -20 : 0, 0),
        child: AnimatedScale(
          scale: isSelected ? 1.15 : 1.0,
          duration: const Duration(milliseconds: 250),
          child: Container(
            width: isCenter ? 58 : 50,
            height: isCenter ? 58 : 50,
            decoration: BoxDecoration(
              color: isSelected ? primaryTeal : Colors.transparent,
              shape: BoxShape.circle,
              boxShadow: isSelected
                  ? [
                BoxShadow(
                  color: primaryTeal.withOpacity(0.35),
                  blurRadius: 14,
                  offset: const Offset(0, 6),
                ),
              ]
                  : [],
            ),
            child: Icon(
              icon,
              size: isCenter ? 30 : 24,
              color: isSelected ? Colors.white : Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
