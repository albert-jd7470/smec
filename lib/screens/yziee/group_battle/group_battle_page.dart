import 'package:flutter/material.dart';

import 'create_room.dart';
import 'join_room.dart';
import 'group_card.dart';

class GroupBattlePage extends StatelessWidget {
  const GroupBattlePage({super.key});

  static const Color bgColor = Color(0xFFF5F9FA); // light background
  static const Color primaryTeal = Color(0xFF0AA6A6);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: bgColor,
        foregroundColor: Colors.black,
        title: const Text(
          'Group Battle',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),

            const Text(
              'Choose an action',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 14,
                color: Colors.black54,
              ),
            ),

            const SizedBox(height: 30),

            GroupActionCard(
              title: 'Create Room',
              subtitle: 'Start a new group battle',
              icon: Icons.add_circle_outline,
              iconColor: primaryTeal,
              cardColor: Colors.white,
              textColor: Colors.black,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const CreateRoomPage(),
                  ),
                );
              },
            ),

            const SizedBox(height: 20),

            GroupActionCard(
              title: 'Join Room',
              subtitle: 'Enter an existing room code',
              icon: Icons.meeting_room_outlined,
              iconColor: primaryTeal,
              cardColor: Colors.white,
              textColor: Colors.black,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const JoinRoomPage(),
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
