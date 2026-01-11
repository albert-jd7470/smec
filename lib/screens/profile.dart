import 'package:flutter/material.dart';
import 'package:smec/screens/loadingscreen.dart';
import 'package:smec/screens/settings.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  static const Color primaryTeal = Color(0xFF0FA3A9);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4FAFA),
      body: SafeArea(
        child: Column(
          children: [
            // ===== HEADER =====
            Container(
              padding: const EdgeInsets.fromLTRB(20, 24, 20, 30),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [primaryTeal, primaryTeal.withOpacity(0.85)],
                ),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(36),
                  bottomRight: Radius.circular(36),
                ),
              ),
              child: Column(
                children: [
                  // Top Row (Settings)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.settings, color: Colors.white),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  Loadingscreen(nextPage: SettingsPage()),
                            ),
                          );
                        },
                      ),
                    ],
                  ),

                  const SizedBox(height: 8),

                  CircleAvatar(
                    radius: 46,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 42,
                      backgroundColor: primaryTeal.withOpacity(0.15),
                      child: const Icon(
                        Icons.person,
                        size: 46,
                        color: primaryTeal,
                      ),
                    ),
                  ),

                  const SizedBox(height: 14),

                  const Text(
                    'Apple Kadiyan',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),

                  const SizedBox(height: 4),

                  const Text(
                    'applekadiyan@email.com',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 13,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // ===== INFO CARDS =====
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  _infoTile(
                    icon: Icons.phone,
                    title: 'Phone',
                    value: '000000000',
                  ),
                  const SizedBox(height: 14),
                  _infoTile(
                    icon: Icons.location_on,
                    title: 'Location',
                    value: 'Kerala, India',
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // ===== ACTION BUTTONS =====
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  _actionButton(
                    icon: Icons.edit,
                    label: 'Edit Profile',
                    onTap: () {},
                  ),
                  const SizedBox(height: 14),
                  _actionButton(
                    icon: Icons.security,
                    label: 'Privacy & Security',
                    onTap: () {},
                  ),
                  const SizedBox(height: 14),
                  _actionButton(
                    icon: Icons.logout,
                    label: 'Logout',
                    color: Colors.redAccent,
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ===== INFO TILE =====
  Widget _infoTile({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
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
            backgroundColor: primaryTeal.withOpacity(0.12),
            child: Icon(icon, color: primaryTeal),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ===== ACTION BUTTON =====
  Widget _actionButton({
    required IconData icon,
    required String label,
    Color color = primaryTeal,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 18),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
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
            Icon(icon, color: color),
            const SizedBox(width: 16),
            Text(
              label,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: color,
              ),
            ),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
