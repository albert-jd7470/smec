import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smec/screens/yziee/challenge_page.dart';
import 'package:smec/screens/jd/homepage.dart';
import 'package:smec/screens/yziee/profile.dart';
import '../screens/jd/favoritePage.dart';
import '../screens/yziee/leaderboard_page.dart';

class BottomNavig extends StatefulWidget {
  const BottomNavig({super.key});

  @override
  State<BottomNavig> createState() => _BottomNavigState();
}

class _BottomNavigState extends State<BottomNavig> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    Homepage(),
    LeaderboardPage(),
    ChallengePage(),
    FavoritePage(),
    ProfilePage(),
  ];

  void _onSwipe(DragEndDetails details) {
    if (details.primaryVelocity == null) return;

    // Swipe Left → Next Page
    if (details.primaryVelocity! < 0 && _currentIndex < _pages.length - 1) {
      setState(() {
        _currentIndex++;
      });
    }

    // Swipe Right → Previous Page
    if (details.primaryVelocity! > 0 && _currentIndex > 0) {
      setState(() {
        _currentIndex--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onHorizontalDragEnd: _onSwipe,
        behavior: HitTestBehavior.translucent,
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 350),
          transitionBuilder: (child, animation) {
            final slideAnimation = Tween<Offset>(
              begin: const Offset(0.15, 0),
              end: Offset.zero,
            ).animate(animation);

            return FadeTransition(
              opacity: animation,
              child: SlideTransition(
                position: slideAnimation,
                child: child,
              ),
            );
          },
          child: SizedBox(
            key: ValueKey(_currentIndex),
            child: _pages[_currentIndex],
          ),
        ),
      ),

      /// FAB
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal,
        onPressed: () {
          setState(() {
            _currentIndex = 2;
          });
        },
        child: const Icon(
          Icons.emoji_events,
          size: 30,
          color: Colors.white,
        ),
      ),

      floatingActionButtonLocation:
      FloatingActionButtonLocation.centerDocked,

      /// Bottom Bar
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        color: Colors.white,
        child: SizedBox(
          height: 65,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _navItem(CupertinoIcons.home, 0),
              _navItem(Icons.dashboard, 1),
              const SizedBox(width: 40),
              _navItem(Icons.favorite_border, 3),
              _navItem(Icons.person, 4),
            ],
          ),
        ),
      ),
    );
  }

  Widget _navItem(IconData icon, int index) {
    final bool isSelected = _currentIndex == index;

    return InkWell(
      onTap: () {
        setState(() {
          _currentIndex = index;
        });
      },
      child: Icon(
        icon,
        size: 26,
        color: isSelected ? Colors.teal : Colors.grey,
      ),
    );
  }
}
