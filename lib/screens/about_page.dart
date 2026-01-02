import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui';
import '../widgets/nav_item.dart';
import '../widgets/dashed_line_painter.dart';
import 'portfolio_page.dart';

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
                      ? Column(
                          children: [
                            Text(
                              'JUST_K',
                              style: GoogleFonts.jersey10(
                                color: Colors.white.withOpacity(0.45),
                                fontSize: 35,
                                letterSpacing: 2,
                              ),
                            ),
                            const SizedBox(height: 15),
                            Wrap(
                              alignment: WrapAlignment.center,
                              spacing: 8,
                              runSpacing: 8,
                              children: [
                                NavItem(
                                  text: 'HOME',
                                  isMobile: true,
                                  onTap: () => Navigator.pop(context),
                                ),
                                NavItem(
                                  text: 'ABOUT',
                                  isMobile: true,
                                  onTap: () {},
                                ),
                                NavItem(
                                  text: 'PORTOFOLIO',
                                  isMobile: true,
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const PortfolioPage(),
                                      ),
                                    );
                                  },
                                ),
                                NavItem(
                                  text: 'CONTACT',
                                  isMobile: true,
                                  onTap: () => Navigator.pop(context),
                                ),
                              ],
                            ),
                          ],
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
                                  onTap: () => Navigator.pop(context),
                                ),
                                NavItem(text: 'ABOUT', onTap: () {}),
                                NavItem(
                                  text: 'PORTOFOLIO',
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const PortfolioPage(),
                                      ),
                                    );
                                  },
                                ),
                                NavItem(
                                  text: 'CONTACT',
                                  onTap: () => Navigator.pop(context),
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title
        Text(
          'ABOUT',
          style: GoogleFonts.jersey10(
            color: Colors.white,
            fontSize: 45,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          'JUST_K',
          style: GoogleFonts.jersey10(
            color: Colors.white,
            fontSize: 60,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        // Red line
        Container(height: 2, width: 200, color: const Color(0xFFFF0000)),
        const SizedBox(height: 30),

        // Text content
        Text(
          "It's an honor to have you visit my portfolio.\n"
          "Curious about what I've been creating\n"
          "over the past years?\n"
          "On this website, you'll find a detailed\n"
          "look at my creative process.",
          style: GoogleFonts.jersey10(
            color: Colors.white,
            fontSize: 20,
            height: 1.5,
          ),
        ),
        const SizedBox(height: 30),

        // Quote with red lines
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(height: 2, width: 150, color: const Color(0xFFFF0000)),
            const SizedBox(height: 10),
            Text(
              '"MAKING REAL SOMETHING YOU IMAGINE"',
              style: GoogleFonts.jersey10(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Container(height: 2, width: 150, color: const Color(0xFFFF0000)),
          ],
        ),
        const SizedBox(height: 30),

        // Roles
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'COSPLAYER |',
              style: GoogleFonts.jersey10(
                color: Colors.white.withOpacity(0.7),
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'PHOTOSHOP MANIPULATOR DESIGNER |',
              style: GoogleFonts.jersey10(
                color: Colors.white.withOpacity(0.7),
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              '3D ANIMATOR |',
              style: GoogleFonts.jersey10(
                color: Colors.white.withOpacity(0.7),
                fontSize: 24,
              ),
            ),
          ],
        ),
        const SizedBox(height: 30),

        // Images
        ClipRect(
          child: Image.asset(
            'images/about2.png',
            width: double.infinity,
            height: 400,
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                width: double.infinity,
                height: 400,
                color: Colors.grey[900],
                child: const Center(
                  child: Icon(Icons.image, color: Colors.white, size: 80),
                ),
              );
            },
          ),
        ),
      ],
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
                    'images/about1.png',
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
                    'images/about2.png',
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
            left: 40,
            top: 40,
            bottom: 40,
            width: MediaQuery.of(context).size.width * 0.4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Title
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
                // Red line
                Container(
                  height: 2,
                  width: 300,
                  color: const Color(0xFFFF0000),
                ),
                const SizedBox(height: 30),

                // Text content
                Text(
                  "It's an honor to have you visit my portfolio.\n"
                  "Curious about what I've been creating\n"
                  "over the past years?\n"
                  "On this website, you'll find a detailed\n"
                  "look at my creative process.",
                  style: GoogleFonts.jersey10(
                    color: Colors.white,
                    fontSize: 24,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 35),

                // Quote with red lines
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 2,
                      width: 300,
                      color: const Color(0xFFFF0000),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      '"MAKING REAL SOMETHING YOU IMAGINE"',
                      style: GoogleFonts.jersey10(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Container(
                      height: 2,
                      width: 300,
                      color: const Color(0xFFFF0000),
                    ),
                  ],
                ),
                const SizedBox(height: 35),

                // Roles
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'COSPLAYER |',
                      style: GoogleFonts.jersey10(
                        color: Colors.white.withOpacity(0.7),
                        fontSize: 26,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'PHOTOSHOP MANIPULATOR DESIGNER |',
                      style: GoogleFonts.jersey10(
                        color: Colors.white.withOpacity(0.7),
                        fontSize: 26,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '3D ANIMATOR |',
                      style: GoogleFonts.jersey10(
                        color: Colors.white.withOpacity(0.7),
                        fontSize: 26,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Container(
                      height: 2,
                      width: 300,
                      color: const Color(0xFFFF0000),
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
