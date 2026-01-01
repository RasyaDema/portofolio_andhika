import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Portfolio Contact',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        textTheme: GoogleFonts.jersey10TextTheme(ThemeData.dark().textTheme),
      ),
      home: const ContactPage(),
    );
  }
}

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

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
                // Garis atas
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
                            // Logo untuk mobile
                            Text(
                              'JUST_K',
                              style: GoogleFonts.jersey10(
                                color: Colors.white.withOpacity(0.45),
                                fontSize: 35,
                                letterSpacing: 2,
                              ),
                            ),
                            const SizedBox(height: 15),
                            // Menu untuk mobile (wrap)
                            Wrap(
                              alignment: WrapAlignment.center,
                              spacing: 8,
                              runSpacing: 8,
                              children: const [
                                NavItem(text: 'HOME', isMobile: true),
                                NavItem(text: 'ABOUT', isMobile: true),
                                NavItem(text: 'PORTOFOLIO', isMobile: true),
                                NavItem(text: 'CONTACT', isMobile: true),
                              ],
                            ),
                          ],
                        )
                      : Row(
                          children: [
                            // Logo untuk desktop
                            Text(
                              'JUST_K',
                              style: GoogleFonts.jersey10(
                                color: Colors.white.withOpacity(0.45),
                                fontSize: 50,
                                letterSpacing: 2,
                              ),
                            ),

                            const Spacer(),

                            // Menu untuk desktop
                            Row(
                              children: const [
                                NavItem(text: 'HOME'),
                                NavItem(text: 'ABOUT'),
                                NavItem(text: 'PORTOFOLIO'),
                                NavItem(text: 'CONTACT'),
                              ],
                            ),

                            const Spacer(),
                          ],
                        ),
                ),

                SizedBox(height: isMobile ? 15 : 20),

                // Garis bawah
                CustomPaint(
                  painter: DashedLinePainter(),
                  child: const SizedBox(height: 1, width: double.infinity),
                ),
              ],
            ),

            // ================= CONTENT =================
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 20 : 40,
                vertical: isMobile ? 40 : 80,
              ),
              child: Column(
                children: [
                  // Text Info
                  Text(
                    'FOR YOUR MORE INFO.\n'
                    'YOU CAN GO AHEAD CONTACT ME\n'
                    'OR CHECK MY SOCIAL MEDIA BY\n'
                    'CLICKING DOWN BELOW!',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.jersey10(
                      color: Colors.white,
                      fontSize: isMobile ? 24 : 45,
                      height: 1.5,
                      letterSpacing: 1,
                    ),
                  ),

                  SizedBox(height: isMobile ? 40 : 80),

                  // Social Media Icons
                  isMobile
                      ? Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SocialMediaIcon(
                                  imagePath: 'images/instagram.png',
                                  label: 'JUST_K513',
                                  isMobile: true,
                                ),
                                const SizedBox(width: 30),
                                SocialMediaIcon(
                                  imagePath: 'images/gmail.png',
                                  label: '',
                                  isMobile: true,
                                ),
                              ],
                            ),
                            const SizedBox(height: 30),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SocialMediaIcon(
                                  imagePath: 'images/youtube.png',
                                  label: 'KEVIN ZONE',
                                  isMobile: true,
                                ),
                                const SizedBox(width: 30),
                                SocialMediaIcon(
                                  imagePath: 'images/whatsapp.png',
                                  label: '',
                                  isMobile: true,
                                ),
                              ],
                            ),
                          ],
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SocialMediaIcon(
                              imagePath: 'images/instagram.png',
                              label: 'JUST_K513',
                            ),
                            const SizedBox(width: 60),
                            SocialMediaIcon(
                              imagePath: 'images/gmail.png',
                              label: '',
                            ),
                            const SizedBox(width: 60),
                            SocialMediaIcon(
                              imagePath: 'images/youtube.png',
                              label: 'KEVIN ZONE',
                            ),
                            const SizedBox(width: 60),
                            SocialMediaIcon(
                              imagePath: 'images/whatsapp.png',
                              label: '',
                            ),
                          ],
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ================= NAV ITEM =================
class NavItem extends StatelessWidget {
  final String text;
  final bool isMobile;

  const NavItem({super.key, required this.text, this.isMobile = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 8 : 14),
      child: Text(
        '| $text',
        style: GoogleFonts.jersey10(
          color: Colors.white,
          fontSize: isMobile ? 22 : 40,
          letterSpacing: 1.5,
        ),
      ),
    );
  }
}

// ================= DASHED LINE =================
class DashedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFFF0000)
      ..strokeWidth = 1;

    const dashWidth = 6;
    const dashSpace = 4;
    double startX = 0;

    while (startX < size.width) {
      canvas.drawLine(Offset(startX, 0), Offset(startX + dashWidth, 0), paint);
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

// ================= SOCIAL MEDIA ICON =================
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
