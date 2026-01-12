import 'package:flutter/material.dart';

class BattleCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color cardColor;
  final Color iconColor;
  final Color textColor;
  final VoidCallback onTap;

  const BattleCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.cardColor,
    required this.iconColor,
    required this.textColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 10,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 26,
              backgroundColor: iconColor.withOpacity(0.15),
              child: Icon(
                icon,
                color: iconColor,
                size: 26,
              ),
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: textColor,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 13,
                    color: textColor.withOpacity(0.65),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
