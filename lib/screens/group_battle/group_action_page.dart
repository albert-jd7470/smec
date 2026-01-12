import 'package:flutter/material.dart';
import 'create_room.dart';
import 'group_card.dart';
import 'join_room.dart';

class GroupActionPage extends StatelessWidget {
  const GroupActionPage({super.key});

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
        title: const Text(
          'Group Battle',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
              subtitle: 'Start a new battle',
              icon: Icons.add_circle_outline,
              iconColor: teal,
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
              subtitle: 'Enter a room code',
              icon: Icons.meeting_room_outlined,
              iconColor: teal,
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
