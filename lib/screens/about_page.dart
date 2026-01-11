import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui';
import '../widgets/nav_item.dart';
import '../widgets/dashed_line_painter.dart';
import '../widgets/red_dashed_line_painter.dart';

// ================= ABOUT PAGE =================
class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: isMobile ? 20 : 30),

            // ================= NAVBAR =================
            Column(
              children: [
                CustomPaint(
                  painter: DashedLinePainter(),
                  child: const SizedBox(height: 1, width: double.infinity),
                ),
                SizedBox(height: isMobile ? 15 : 20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 40),
                  child: isMobile
                      ? SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              Text(
                                'JUST_K',
                                style: GoogleFonts.jersey10(
                                  color: Colors.white.withOpacity(0.45),
                                  fontSize: 35,
                                  letterSpacing: 2,
                                ),
                              ),
                              const SizedBox(width: 20),
                              NavItem(
                                text: 'HOME',
                                isMobile: true,
                                isActive: false,
                                onTap: () => Navigator.pushReplacementNamed(
                                  context,
                                  '/',
                                ),
                              ),
                              NavItem(
                                text: 'ABOUT',
                                isMobile: true,
                                isActive: true,
                                onTap: () {},
                              ),
                              NavItem(
                                text: 'PORTOFOLIO',
                                isMobile: true,
                                isActive: false,
                                onTap: () => Navigator.pushReplacementNamed(
                                  context,
                                  '/portfolio',
                                ),
                              ),
                              NavItem(
                                text: 'CONTACT',
                                isMobile: true,
                                isActive: false,
                                onTap: () => Navigator.pushReplacementNamed(
                                  context,
                                  '/contact',
                                ),
                              ),
                            ],
                          ),
                        )
                      : Row(
                          children: [
                            Text(
                              'JUST_K',
                              style: GoogleFonts.jersey10(
                                color: Colors.white.withOpacity(0.45),
                                fontSize: 50,
                                letterSpacing: 2,
                              ),
                            ),
                            const Spacer(),
                            Row(
                              children: [
                                NavItem(
                                  text: 'HOME',
                                  isActive: false,
                                  onTap: () => Navigator.pushReplacementNamed(
                                    context,
                                    '/',
                                  ),
                                ),
                                NavItem(
                                  text: 'ABOUT',
                                  isActive: true,
                                  onTap: () {},
                                ),
                                NavItem(
                                  text: 'PORTOFOLIO',
                                  isActive: false,
                                  onTap: () => Navigator.pushReplacementNamed(
                                    context,
                                    '/portfolio',
                                  ),
                                ),
                                NavItem(
                                  text: 'CONTACT',
                                  isActive: false,
                                  onTap: () => Navigator.pushReplacementNamed(
                                    context,
                                    '/contact',
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                          ],
                        ),
                ),
                SizedBox(height: isMobile ? 15 : 20),
                CustomPaint(
                  painter: DashedLinePainter(),
                  child: const SizedBox(height: 1, width: double.infinity),
                ),
              ],
            ),

            SizedBox(height: isMobile ? 30 : 50),

            // ================= ABOUT CONTENT =================
            Padding(
              padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 40),
              child: isMobile
                  ? _buildMobileLayout(context)
                  : _buildDesktopLayout(context),
            ),

            SizedBox(height: isMobile ? 30 : 50),
          ],
        ),
      ),
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Container(
      height: 450,
      child: Stack(
        children: [
          // Background images (about1.png blur di kiri, about2.png di kanan)
          Row(
            children: [
              // Left: Blur background
              Expanded(
                flex: 3,
                child: ImageFiltered(
                  imageFilter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                  child: Image.asset(
                    'assets/images/about1.png',
                    fit: BoxFit.cover,
                    height: double.infinity,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(color: Colors.grey[900]);
                    },
                  ),
                ),
              ),
              // Right: Person image
              Expanded(
                flex: 2,
                child: ClipRect(
                  child: Image.asset(
                    'assets/images/about2.png',
                    fit: BoxFit.cover,
                    height: double.infinity,
                    alignment: Alignment.topCenter,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey[900],
                        child: const Center(
                          child: Icon(
                            Icons.image,
                            color: Colors.white,
                            size: 80,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),

          // Text content overlay (di atas gambar blur kiri)
          Positioned(
            left: 15,
            top: 20,
            bottom: 20,
            right: MediaQuery.of(context).size.width * 0.45,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Title section
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'ABOUT',
                        style: GoogleFonts.jersey10(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        'JUST_K',
                        style: GoogleFonts.jersey10(
                          color: Colors.white,
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 6),
                      // Red dashed line
                      CustomPaint(
                        painter: RedDashedLinePainter(),
                        child: const SizedBox(height: 2, width: 100),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  // Text content
                  Text(
                    "It's an honor to have you visit my portfolio.\n"
                    "Curious about what I've been creating\n"
                    "over the past years?\n"
                    "On this website, you'll find a detailed\n"
                    "look at my creative process.",
                    style: GoogleFonts.jersey10(
                      color: Colors.white,
                      fontSize: 13,
                      height: 1.4,
                    ),
                  ),

                  const SizedBox(height: 12),

                  // Quote with red lines
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomPaint(
                        painter: RedDashedLinePainter(),
                        child: const SizedBox(height: 2, width: 90),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        '"MAKING REAL SOMETHING YOU IMAGINE"',
                        style: GoogleFonts.jersey10(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      CustomPaint(
                        painter: RedDashedLinePainter(),
                        child: const SizedBox(height: 2, width: 90),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  // Roles section
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'COSPLAYER |',
                        style: GoogleFonts.jersey10(
                          color: Colors.white.withOpacity(0.7),
                          fontSize: 13,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'PHOTOSHOP MANIPULATOR DESIGNER |',
                        style: GoogleFonts.jersey10(
                          color: Colors.white.withOpacity(0.7),
                          fontSize: 13,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        '3D ANIMATOR |',
                        style: GoogleFonts.jersey10(
                          color: Colors.white.withOpacity(0.7),
                          fontSize: 13,
                        ),
                      ),
                      const SizedBox(height: 8),
                      // Red dashed line terakhir
                      CustomPaint(
                        painter: RedDashedLinePainter(),
                        child: const SizedBox(height: 2, width: 100),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Container(
      height: 800,
      child: Stack(
        children: [
          // Background images (about1.png blur di kiri, about2.png di kanan)
          Row(
            children: [
              // Left: Blur background
              Expanded(
                flex: 3,
                child: ImageFiltered(
                  imageFilter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                  child: Image.asset(
                    'assets/images/about1.png',
                    fit: BoxFit.cover,
                    height: double.infinity,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(color: Colors.grey[900]);
                    },
                  ),
                ),
              ),
              // Right: Person image
              Expanded(
                flex: 2,
                child: ClipRect(
                  child: Image.asset(
                    'assets/images/about2.png',
                    fit: BoxFit.cover,
                    height: double.infinity,
                    alignment: Alignment.topCenter,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey[900],
                        child: const Center(
                          child: Icon(
                            Icons.image,
                            color: Colors.white,
                            size: 80,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),

          // Text content overlay (di atas gambar blur kiri)
          Positioned(
            left: 80,
            top: 60,
            bottom: 60,
            right: MediaQuery.of(context).size.width * 0.42,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Title section
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ABOUT',
                      style: GoogleFonts.jersey10(
                        color: Colors.white,
                        fontSize: 45,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'JUST_K',
                      style: GoogleFonts.jersey10(
                        color: Colors.white,
                        fontSize: 70,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    // Red dashed line
                    CustomPaint(
                      painter: RedDashedLinePainter(),
                      child: const SizedBox(height: 2, width: 400),
                    ),
                  ],
                ),

                // Text content
                Text(
                  "It's an honor to have you visit my portfolio.\n"
                  "Curious about what I've been creating\n"
                  "over the past years?\n"
                  " On this website, you'll find a detailed\n"
                  "look at my creative process.",
                  style: GoogleFonts.jersey10(
                    color: Colors.white,
                    fontSize: 26,
                    height: 1.5,
                  ),
                ),

                // Quote with red lines
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomPaint(
                      painter: RedDashedLinePainter(),
                      child: const SizedBox(height: 2, width: 400),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      '"MAKING REAL SOMETHING YOU IMAGINE"',
                      style: GoogleFonts.jersey10(
                        color: Colors.white,
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),
                    CustomPaint(
                      painter: RedDashedLinePainter(),
                      child: const SizedBox(height: 2, width: 400),
                    ),
                  ],
                ),

                // Roles section
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'COSPLAYER |',
                      style: GoogleFonts.jersey10(
                        color: Colors.white.withOpacity(0.7),
                        fontSize: 28,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'PHOTOSHOP MANIPULATOR DESIGNER |',
                      style: GoogleFonts.jersey10(
                        color: Colors.white.withOpacity(0.7),
                        fontSize: 28,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      '3D ANIMATOR |',
                      style: GoogleFonts.jersey10(
                        color: Colors.white.withOpacity(0.7),
                        fontSize: 28,
                      ),
                    ),
                    const SizedBox(height: 15),
                    CustomPaint(
                      painter: RedDashedLinePainter(),
                      child: const SizedBox(height: 2, width: 400),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
