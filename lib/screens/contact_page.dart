import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/nav_item.dart';
import '../widgets/dashed_line_painter.dart';
import '../widgets/social_media_icon.dart';

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
                                  imagePath: 'assets/images/instagram.png',
                                  label: 'JUST_K513',
                                  isMobile: true,
                                ),
                                const SizedBox(width: 30),
                                SocialMediaIcon(
                                  imagePath: 'assets/images/gmail.png',
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
                                  imagePath: 'assets/images/youtube.png',
                                  label: 'KEVIN ZONE',
                                  isMobile: true,
                                ),
                                const SizedBox(width: 30),
                                SocialMediaIcon(
                                  imagePath: 'assets/images/whatsapp.png',
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
                              imagePath: 'assets/images/instagram.png',
                              label: 'JUST_K513',
                            ),
                            const SizedBox(width: 60),
                            SocialMediaIcon(
                              imagePath: 'assets/images/gmail.png',
                              label: '',
                            ),
                            const SizedBox(width: 60),
                            SocialMediaIcon(
                              imagePath: 'assets/images/youtube.png',
                              label: 'KEVIN ZONE',
                            ),
                            const SizedBox(width: 60),
                            SocialMediaIcon(
                              imagePath: 'assets/images/whatsapp.png',
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
