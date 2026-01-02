import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NavItem extends StatelessWidget {
  final String text;
  final bool isMobile;
  final VoidCallback onTap;

  const NavItem({
    super.key,
    required this.text,
    this.isMobile = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: isMobile ? 8 : 14),
        child: Text(
          '| $text',
          style: GoogleFonts.jersey10(
            color: Colors.white,
            fontSize: isMobile ? 22 : 40,
            letterSpacing: 1.5,
          ),
        ),
      ),
    );
  }
}
