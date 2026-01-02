import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SocialMediaIcon extends StatelessWidget {
  final String imagePath;
  final String label;
  final bool isMobile;

  const SocialMediaIcon({
    super.key,
    required this.imagePath,
    required this.label,
    this.isMobile = false,
  });

  @override
  Widget build(BuildContext context) {
    final iconSize = isMobile ? 100.0 : 140.0;
    final fontSize = isMobile ? 18.0 : 24.0;

    return Column(
      children: [
        // Icon
        Container(
          width: iconSize,
          height: iconSize,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.image, color: Colors.white, size: 60),
              );
            },
          ),
        ),

        // Label (dengan tinggi tetap untuk alignment)
        SizedBox(
          height: isMobile ? 40 : 50,
          child: Center(
            child: label.isNotEmpty
                ? Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: Text(
                      label,
                      style: GoogleFonts.jersey10(
                        color: Colors.white,
                        fontSize: fontSize,
                        letterSpacing: 1,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  )
                : const SizedBox(),
          ),
        ),
      ],
    );
  }
}
