import 'package:flutter/material.dart';

class JoinRoomPage extends StatelessWidget {
  const JoinRoomPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController roomController = TextEditingController();

    return Scaffold(
      backgroundColor: const Color(0xFF0E1F2F),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Join Room'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Enter Room Code',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: roomController,
              textAlign: TextAlign.center,
              textCapitalization: TextCapitalization.characters,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                letterSpacing: 3,
              ),
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0xFF152A3A),
                hintText: 'ABC123',
                hintStyle: TextStyle(
                  color: Colors.white.withOpacity(0.4),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // Validate & join room later
              },
              child: const Text('Join Battle'),
            ),
          ],
        ),
      ),
    );
  }
}
