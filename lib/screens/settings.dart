import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  static const Color bgColor = Color(0xFFF4FAFA);
  static const Color cardColor = Colors.white;
  static const Color accentTeal = Color(0xFF1ECAD3);
  static const Color textPrimary = Color(0xFF1F2937);
  static const Color textSecondary = Color(0xFF6B7280);

  bool soundEnabled = true;
  bool hintsEnabled = true;
  bool adaptiveDifficulty = false;
  bool practiceReminder = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_sharp,
            color: Colors.teal,
          ),
        ),
        backgroundColor: bgColor,
        elevation: 0,
        iconTheme: const IconThemeData(color: textPrimary),
        title: const Text(
          'Settings',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
            color: textPrimary,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _profileCard(),
            const SizedBox(height: 20),

            _sectionTitle('Learning Preferences'),
            _switchTile(
              title: 'Enable Sound',
              subtitle: 'Quiz sounds and feedback tones',
              value: soundEnabled,
              onChanged: (v) => setState(() => soundEnabled = v),
            ),
            _switchTile(
              title: 'Show Hints',
              subtitle: 'Helpful hints across all courses',
              value: hintsEnabled,
              onChanged: (v) => setState(() => hintsEnabled = v),
            ),
            _switchTile(
              title: 'Adaptive Difficulty',
              subtitle: 'Automatically adjust question difficulty',
              value: adaptiveDifficulty,
              onChanged: (v) => setState(() => adaptiveDifficulty = v),
            ),

            const SizedBox(height: 20),

            _sectionTitle('Practice & Progress'),
            _switchTile(
              title: 'Practice Reminders',
              subtitle: 'Daily reminders to continue learning',
              value: practiceReminder,
              onChanged: (v) => setState(() => practiceReminder = v),
            ),
            _navTile(
              title: 'Course Progress',
              subtitle: 'View progress for all enrolled courses',
              icon: Icons.bar_chart_rounded,
            ),

            const SizedBox(height: 20),

            _sectionTitle('Courses'),
            _navTile(
              title: 'Manage Courses',
              subtitle: 'Flutter, Dart, Python, and more',
              icon: Icons.school_rounded,
            ),
            _navTile(
              title: 'Reset Course Settings',
              subtitle: 'Restore default settings for all courses',
              icon: Icons.refresh_rounded,
            ),

            const SizedBox(height: 20),

            _sectionTitle('Support & Legal'),
            _navTile(
              title: 'Help & Support',
              subtitle: 'Contact or report an issue',
              icon: Icons.support_agent,
            ),
            _navTile(
              title: 'Privacy Policy',
              subtitle: 'Read how your data is handled',
              icon: Icons.privacy_tip_outlined,
            ),
            _navTile(
              title: 'Terms & Conditions',
              subtitle: 'Platform usage terms',
              icon: Icons.description_outlined,
            ),

            const SizedBox(height: 30),

            const Text(
              'App Version 1.0.0',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 12,
                color: textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ===== Profile Card =====
  Widget _profileCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 28,
            backgroundColor: accentTeal.withOpacity(0.15),
            child: const Icon(Icons.person, color: accentTeal, size: 28),
          ),
          const SizedBox(width: 14),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Yasi',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: textPrimary,
                ),
              ),
              SizedBox(height: 4),
              Text(
                'Learning Path: Flutter • Dart • Python',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 12,
                  color: textSecondary,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  // ===== Section Title =====
  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: const TextStyle(
            fontFamily: 'Poppins',
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: accentTeal,
          ),
        ),
      ),
    );
  }

  // ===== Switch Tile =====
  Widget _switchTile({
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: SwitchListTile(
        activeColor: accentTeal,
        value: value,
        onChanged: onChanged,
        title: Text(
          title,
          style: const TextStyle(
            fontFamily: 'Poppins',
            color: textPrimary,
            fontSize: 14,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(
            fontFamily: 'Poppins',
            color: textSecondary,
            fontSize: 12,
          ),
        ),
      ),
    );
  }

  // ===== Navigation Tile =====
  Widget _navTile({
    required String title,
    required String subtitle,
    required IconData icon,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ListTile(
        leading: Icon(icon, color: accentTeal),
        title: Text(
          title,
          style: const TextStyle(
            fontFamily: 'Poppins',
            color: textPrimary,
            fontSize: 14,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(
            fontFamily: 'Poppins',
            color: textSecondary,
            fontSize: 12,
          ),
        ),
        trailing: const Icon(Icons.chevron_right, color: textSecondary),
        onTap: () {},
      ),
    );
  }
}
