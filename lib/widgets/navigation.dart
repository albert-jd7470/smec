import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smec/screens/homepage.dart';
import 'package:smec/screens/profile.dart';

class BottomNavig extends StatefulWidget {
  const BottomNavig({super.key});

  @override
  State<BottomNavig> createState() => _BottomNavigState();
}

class _BottomNavigState extends State<BottomNavig> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    Homepage(),
    Homepage(),
    Homepage(),
    Homepage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal,
        onPressed: () {
          setState(() {
            _currentIndex = 2;
          });
        },
        child: const Icon(Icons.emoji_events, size: 30,color: Colors.white,),
      ),

      floatingActionButtonLocation:
      FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        color: Colors.white,
        child: SizedBox(
          height: 65,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _navItem(CupertinoIcons.home, " ", 0),
              _navItem(Icons.dashboard, " ", 1),
              const SizedBox(width: 40),
              _navItem(Icons.favorite_border, " ", 3),
              _navItem(Icons.person, " ", 4),
            ],
          ),
        ),
      ),
    );
  }

  Widget _navItem(IconData icon, String label, int index) {
    final bool isSelected = _currentIndex == index;

    return InkWell(
      onTap: () {
        setState(() {
          _currentIndex = index;
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isSelected ? Colors.teal : Colors.grey,
          ),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: isSelected ? Colors.teal : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
