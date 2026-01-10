import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/nav_item.dart';
import '../widgets/dashed_line_painter.dart';

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
                              children: [
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
                                  isActive: false,
                                  onTap: () => Navigator.pushReplacementNamed(
                                    context,
                                    '/about',
                                  ),
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
                                  isActive: true,
                                  onTap: () {},
                                ),
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
                                  isActive: false,
                                  onTap: () => Navigator.pushReplacementNamed(
                                    context,
                                    '/about',
                                  ),
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
                                  isActive: true,
                                  onTap: () {},
                                ),
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
                  // Header Text
                  Text(
                    'Feel free to contact me for any sort of\nproduction inquires.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.jersey10(
                      color: Colors.white,
                      fontSize: isMobile ? 28 : 48,
                      height: 1.5,
                      letterSpacing: 1,
                    ),
                  ),

                  SizedBox(height: isMobile ? 60 : 100),

                  // Gmail Section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Image.asset(
                          'assets/images/gmail.png',
                          width: isMobile ? 40 : 60,
                          height: isMobile ? 40 : 60,
                        ),
                      ),
                      const SizedBox(width: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Gmail:',
                            style: GoogleFonts.jersey10(
                              color: Colors.white,
                              fontSize: isMobile ? 32 : 48,
                            ),
                          ),
                          Text(
                            '...',
                            style: GoogleFonts.jersey10(
                              color: Colors.white,
                              fontSize: isMobile ? 28 : 40,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  SizedBox(height: isMobile ? 40 : 60),

                  // WhatsApp Section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Image.asset(
                          'assets/images/whatsapp.png',
                          width: isMobile ? 40 : 60,
                          height: isMobile ? 40 : 60,
                        ),
                      ),
                      const SizedBox(width: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Whatsapp:',
                            style: GoogleFonts.jersey10(
                              color: Colors.white,
                              fontSize: isMobile ? 32 : 48,
                            ),
                          ),
                          Text(
                            '...',
                            style: GoogleFonts.jersey10(
                              color: Colors.white,
                              fontSize: isMobile ? 28 : 40,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  SizedBox(height: isMobile ? 80 : 120),

                  // Social Media Text
                  Text(
                    'And you can chekc my social media on below',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.jersey10(
                      color: Colors.white,
                      fontSize: isMobile ? 24 : 36,
                      letterSpacing: 1,
                    ),
                  ),

                  SizedBox(height: isMobile ? 10 : 15),

                  // Social Media Icons
                  Wrap(
                    alignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: isMobile ? 20 : 40,
                    runSpacing: 20,
                    children: [
                      _buildSocialMediaIcon(
                        'assets/images/instagram.png',
                        isMobile,
                      ),
                      _buildSocialMediaIcon(
                        'assets/images/facebook.png',
                        isMobile,
                      ),
                      _buildSocialMediaIcon(
                        'assets/images/Twitter.png',
                        isMobile,
                        scale: 1.8,
                      ),
                      _buildSocialMediaIcon(
                        'assets/images/youtube.png',
                        isMobile,
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

  Widget _buildSocialMediaIcon(
    String imagePath,
    bool isMobile, {
    double scale = 1.0,
  }) {
    final size = (isMobile ? 60 : 80) * scale;
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
      child: Image.asset(imagePath, fit: BoxFit.contain),
    );
  }
}
