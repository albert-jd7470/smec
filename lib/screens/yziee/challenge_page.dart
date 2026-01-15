import 'package:flutter/material.dart';
import 'battle_card.dart';
import 'group_battle/group_battle_page.dart';
import 'solo_battle_page.dart';

class ChallengePage extends StatelessWidget {
  const ChallengePage({super.key});

  static const Color bgColor = Color(0xFFF4F9F9);
  static const Color teal = Color(0xFF0AA6A6);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: bgColor,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            const Text(
              'Choose Your Battle',
              style: TextStyle(
                fontFamily: 'Poppins',
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              'Select how you want to play',
              style: TextStyle(
                fontFamily: 'Poppins',
                color: Colors.black54,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 30),

            BattleCard(
              title: 'Solo Battle',
              subtitle: 'Challenge yourself',
              icon: Icons.person,
              cardColor: Colors.white,
              iconColor: teal,
              textColor: Colors.black,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const SoloBattlePage(),
                  ),
                );
              },
            ),

            const SizedBox(height: 20),

            BattleCard(
              title: 'Group Battle',
              subtitle: 'Play with friends',
              icon: Icons.groups,
              cardColor: Colors.white,
              iconColor: teal,
              textColor: Colors.black,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const GroupBattlePage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
