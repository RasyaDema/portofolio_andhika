import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NavItem extends StatelessWidget {
  final String text;
  final bool isMobile;
  final VoidCallback onTap;
  final bool isActive;

  const NavItem({
    super.key,
    required this.text,
    this.isMobile = false,
    required this.onTap,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: isMobile ? 8 : 6),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '| ',
              style: GoogleFonts.jersey10(
                color: Colors.white,
                fontSize: isMobile ? 22 : 40,
                letterSpacing: 1.5,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 8 : 12,
                vertical: isMobile ? 4 : 6,
              ),
              decoration: BoxDecoration(
                color: isActive ? const Color(0xFFFF0000) : Colors.transparent,
                borderRadius: BorderRadius.circular(2),
              ),
              child: Text(
                text,
                style: GoogleFonts.jersey10(
                  color: Colors.white,
                  fontSize: isMobile ? 22 : 40,
                  letterSpacing: 1.5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
