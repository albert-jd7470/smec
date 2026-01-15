import 'package:flutter/material.dart';
import 'package:smec/screens/yziee/settings.dart';
import 'loadingscreen.dart';
import 'onboard.dart';

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
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // ================= HEADER =================
              Container(
                padding: const EdgeInsets.fromLTRB(20, 24, 20, 30),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      primaryTeal,
                      primaryTeal.withOpacity(0.85),
                    ],
                  ),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(36),
                    bottomRight: Radius.circular(36),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.settings, color: Colors.white),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) =>
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
                      'Username',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'username@email.com',
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

              // ================= BASIC INFO =================
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    _infoTile(
                      icon: Icons.phone,
                      title: 'Phone',
                      value: '0000000000',
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

              // ================= RECENT MATCHES =================
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: _sectionTitle('Recent Matches'),
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 110,
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  separatorBuilder: (_, __) => const SizedBox(width: 14),
                  itemBuilder: (_, index) {
                    return _recentMatchCard(
                      match: 'Match ${index + 1}',
                      result: index.isEven ? 'Won' : 'Lost',
                    );
                  },
                ),
              ),

              const SizedBox(height: 30),

              // ================= PERFORMANCE OVERVIEW =================
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: _sectionTitle('Performance Overview'),
              ),
              const SizedBox(height: 12),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: _statCard(
                        title: 'Global Rank',
                        value: '#124',
                        icon: Icons.public,
                      ),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: _statCard(
                        title: 'Regional Rank',
                        value: '#8',
                        icon: Icons.location_on,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 14),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: _statCard(
                        title: 'Selected Study',
                        value: 'Flutter',
                        icon: Icons.school,
                      ),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: _statCard(
                        title: 'Total Points',
                        value: '3,450',
                        icon: Icons.star,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // ================= MATCH HISTORY =================
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: _sectionTitle('Match History'),
              ),
              const SizedBox(height: 12),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: List.generate(
                    5,
                        (index) => Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: _historyTile(
                        matchName: 'Solo Battle ${index + 1}',
                        date: '12 Jan 2026',
                        result: index.isEven ? 'Won' : 'Lost',
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              // ================= ACTION BUTTONS =================
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
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                                Loadingscreen(nextPage: Onboard()),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  // ================= SECTION TITLE =================
  Widget _sectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontFamily: 'Poppins',
        fontSize: 17,
        fontWeight: FontWeight.w600,
        color: primaryTeal,
      ),
    );
  }

  // ================= INFO TILE =================
  Widget _infoTile({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: _cardDecoration(),
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

  // ================= STAT CARD =================
  Widget _statCard({
    required String title,
    required String value,
    required IconData icon,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            primaryTeal.withOpacity(0.95),
            primaryTeal.withOpacity(0.8),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: primaryTeal.withOpacity(0.25),
            blurRadius: 14,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.white70),
          const SizedBox(height: 12),
          Text(
            title,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 12,
              color: Colors.white70,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  // ================= RECENT MATCH CARD =================
  Widget _recentMatchCard({
    required String match,
    required String result,
  }) {
    final isWon = result == 'Won';

    return Container(
      width: 150,
      padding: const EdgeInsets.all(14),
      decoration: _cardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            match,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
            ),
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: isWon
                  ? primaryTeal.withOpacity(0.15)
                  : Colors.red.withOpacity(0.15),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              result,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: isWon ? primaryTeal : Colors.red,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ================= HISTORY TILE =================
  Widget _historyTile({
    required String matchName,
    required String date,
    required String result,
  }) {
    final isWon = result == 'Won';

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: _cardDecoration(),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: primaryTeal.withOpacity(0.12),
            child: Icon(
              isWon ? Icons.emoji_events : Icons.close,
              color: primaryTeal,
            ),
          ),
          const SizedBox(width: 14),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                matchName,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                date,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          const Spacer(),
          Text(
            result,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              color: isWon ? primaryTeal : Colors.redAccent,
            ),
          ),
        ],
      ),
    );
  }

  // ================= ACTION BUTTON =================
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
        decoration: _cardDecoration(),
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
            const Icon(Icons.arrow_forward_ios,
                size: 14, color: Colors.grey),
          ],
        ),
      ),
    );
  }

  // ================= COMMON CARD DECORATION =================
  BoxDecoration _cardDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(18),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          blurRadius: 12,
          offset: const Offset(0, 6),
        ),
      ],
    );
  }
}
