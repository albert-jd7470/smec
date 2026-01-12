import 'package:flutter/material.dart';
import 'dart:math';

class CreateRoomPage extends StatelessWidget {
  const CreateRoomPage({super.key});

  String _generateRoomCode() {
    const chars = 'ABCDEFGHJKLMNPQRSTUVWXYZ23456789';
    final rand = Random();
    return List.generate(6, (index) => chars[rand.nextInt(chars.length)])
        .join();
  }

  @override
  Widget build(BuildContext context) {
    final roomCode = _generateRoomCode();

    return Scaffold(
      backgroundColor: const Color(0xFF0E1F2F),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Create Room'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Room Created',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              decoration: BoxDecoration(
                color: const Color(0xFF152A3A),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                roomCode,
                style: const TextStyle(
                  color: Colors.greenAccent,
                  fontSize: 32,
                  letterSpacing: 4,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // Navigate to waiting lobby later
              },
              child: const Text('Start Battle'),
            ),
          ],
        ),
      ),
    );
  }
}
