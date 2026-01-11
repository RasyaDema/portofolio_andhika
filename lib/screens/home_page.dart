import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui';
import '../widgets/nav_item.dart';
import '../widgets/dashed_line_painter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int? _hoveredSection; // null, 2, 3, or 4

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // ================= SECTION 1: NAVBAR + WELCOME + SERVICES =================
            _buildSection1(context, isMobile),

            // ================= SECTION 2: MANIPULATION DESIGN =================
            _buildSection2(context, isMobile),

            // ================= SECTION 3: COSPLAY PARTS COMMISIONS =================
            _buildSection3(context, isMobile),

            // ================= SECTION 4: COMMERCIAL WORK =================
            _buildSection4(context, isMobile),

            // ================= SECTION 5: MORE COMING SOON + FOOTER =================
            _buildSection5(context, isMobile),
          ],
        ),
      ),
    );
  }

  // Section 1: Navbar + Welcome + Services (HomeBG1.png with blur)
  Widget _buildSection1(BuildContext context, bool isMobile) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: const AssetImage('assets/images/HomeBG1.png'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.5),
            BlendMode.darken,
          ),
        ),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Column(
          children: [
            SizedBox(height: isMobile ? 20 : 30),

            // Red dashed line above navbar
            CustomPaint(
              painter: DashedLinePainter(),
              child: const SizedBox(height: 1, width: double.infinity),
            ),

            SizedBox(height: isMobile ? 15 : 20),

            // Navbar
            Padding(
              padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 40),
              child: isMobile
                  ? _buildMobileNavbar(context)
                  : _buildDesktopNavbar(context),
            ),

            SizedBox(height: isMobile ? 15 : 20),

            // Red dashed line below navbar
            CustomPaint(
              painter: DashedLinePainter(),
              child: const SizedBox(height: 1, width: double.infinity),
            ),

            SizedBox(height: isMobile ? 60 : 100),

            // Welcome Text
            Text(
              'WELCOME TO',
              style: GoogleFonts.jersey10(
                color: Colors.white,
                fontSize: isMobile ? 24 : 32,
                letterSpacing: 2,
              ),
            ),

            const SizedBox(height: 10),

            // Main Title
            Text(
              'JUST_K',
              style: GoogleFonts.jersey10(
                color: Colors.white,
                fontSize: isMobile ? 60 : 120,
                letterSpacing: 3,
              ),
            ),

            SizedBox(height: isMobile ? 60 : 80),

            // Red dashed line before services
            CustomPaint(
              painter: DashedLinePainter(),
              child: const SizedBox(height: 1, width: double.infinity),
            ),

            SizedBox(height: isMobile ? 12 : 20),

            // Services Text
            Padding(
              padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 0),
              child: Text(
                'WHAT SERVICES THAT I DO?',
                textAlign: TextAlign.center,
                style: GoogleFonts.jersey10(
                  color: Colors.white,
                  fontSize: isMobile ? 32 : 64,
                  letterSpacing: 2,
                ),
              ),
            ),

            SizedBox(height: isMobile ? 12 : 20),
          ],
        ),
      ),
    );
  }

  // Section 2: Manipulation Design (Home2.png cropped)
  Widget _buildSection2(BuildContext context, bool isMobile) {
    final isHovered = _hoveredSection == 2;
    final isOtherHovered = _hoveredSection != null && _hoveredSection != 2;

    return Column(
      children: [
        // Red dashed line
        CustomPaint(
          painter: DashedLinePainter(),
          child: const SizedBox(height: 1, width: double.infinity),
        ),

        GestureDetector(
          onTap: isMobile
              ? () {
                  setState(() {
                    _hoveredSection = _hoveredSection == 2 ? null : 2;
                  });
                }
              : null,
          child: MouseRegion(
            onEnter: isMobile
                ? null
                : (_) => setState(() => _hoveredSection = 2),
            onExit: isMobile
                ? null
                : (_) => setState(() => _hoveredSection = null),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: isHovered ? 350 : (isMobile ? 150 : 200),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('assets/images/Home2.png'),
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(isOtherHovered ? 0.85 : 0.3),
                    BlendMode.darken,
                  ),
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'MANIPULATION DESIGN',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.jersey10(
                        color: Colors.white,
                        fontSize: isMobile ? 32 : 56,
                        letterSpacing: 2,
                        shadows: [
                          Shadow(
                            color: Colors.black.withOpacity(0.8),
                            blurRadius: 10,
                          ),
                        ],
                      ),
                    ),
                    if (isHovered) ...[
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: Text(
                          'A Design that make something Realistic\nas you imagine',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.jersey10(
                            color: Colors.white,
                            fontSize: isMobile ? 20 : 32,
                            letterSpacing: 1.5,
                            shadows: [
                              Shadow(
                                color: Colors.black.withOpacity(0.8),
                                blurRadius: 10,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  // Section 3: Cosplay Parts Commisions (Home3.png cropped)
  Widget _buildSection3(BuildContext context, bool isMobile) {
    final isHovered = _hoveredSection == 3;
    final isOtherHovered = _hoveredSection != null && _hoveredSection != 3;

    return Column(
      children: [
        // Red dashed line
        CustomPaint(
          painter: DashedLinePainter(),
          child: const SizedBox(height: 1, width: double.infinity),
        ),

        GestureDetector(
          onTap: isMobile
              ? () {
                  setState(() {
                    _hoveredSection = _hoveredSection == 3 ? null : 3;
                  });
                }
              : null,
          child: MouseRegion(
            onEnter: isMobile
                ? null
                : (_) => setState(() => _hoveredSection = 3),
            onExit: isMobile
                ? null
                : (_) => setState(() => _hoveredSection = null),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: isHovered ? 350 : (isMobile ? 150 : 200),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('assets/images/Home3.png'),
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(isOtherHovered ? 0.85 : 0.3),
                    BlendMode.darken,
                  ),
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'COSPLAY PARTS COMMISIONS',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.jersey10(
                        color: Colors.white,
                        fontSize: isMobile ? 28 : 52,
                        letterSpacing: 2,
                        shadows: [
                          Shadow(
                            color: Colors.black.withOpacity(0.8),
                            blurRadius: 10,
                          ),
                        ],
                      ),
                    ),
                    if (isHovered) ...[
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: Text(
                          'Create a cosplay parts for your\ncharacter that wishes to cosplay as',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.jersey10(
                            color: Colors.white,
                            fontSize: isMobile ? 20 : 32,
                            letterSpacing: 1.5,
                            shadows: [
                              Shadow(
                                color: Colors.black.withOpacity(0.8),
                                blurRadius: 10,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  // Section 4: Commercial Work (Home4.png scaled)
  Widget _buildSection4(BuildContext context, bool isMobile) {
    final isHovered = _hoveredSection == 4;
    final isOtherHovered = _hoveredSection != null && _hoveredSection != 4;

    return Column(
      children: [
        // Red dashed line
        CustomPaint(
          painter: DashedLinePainter(),
          child: const SizedBox(height: 1, width: double.infinity),
        ),

        GestureDetector(
          onTap: isMobile
              ? () {
                  setState(() {
                    _hoveredSection = _hoveredSection == 4 ? null : 4;
                  });
                }
              : null,
          child: MouseRegion(
            onEnter: isMobile
                ? null
                : (_) => setState(() => _hoveredSection = 4),
            onExit: isMobile
                ? null
                : (_) => setState(() => _hoveredSection = null),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: isHovered ? 350 : (isMobile ? 150 : 200),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('assets/images/Home4.png'),
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(isOtherHovered ? 0.85 : 0.3),
                    BlendMode.darken,
                  ),
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'COMMERCIAL WORK',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.jersey10(
                        color: Colors.white,
                        fontSize: isMobile ? 32 : 56,
                        letterSpacing: 2,
                        shadows: [
                          Shadow(
                            color: Colors.black.withOpacity(0.8),
                            blurRadius: 10,
                          ),
                        ],
                      ),
                    ),
                    if (isHovered) ...[
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: Text(
                          'Need a design for your branding?\ni can help you with 2d and 3d',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.jersey10(
                            color: Colors.white,
                            fontSize: isMobile ? 20 : 32,
                            letterSpacing: 1.5,
                            shadows: [
                              Shadow(
                                color: Colors.black.withOpacity(0.8),
                                blurRadius: 10,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  // Section 5: More Coming Soon + Footer (Black background)
  Widget _buildSection5(BuildContext context, bool isMobile) {
    return Container(
      color: Colors.black,
      child: Column(
        children: [
          // Red dashed line
          CustomPaint(
            painter: DashedLinePainter(),
            child: const SizedBox(height: 1, width: double.infinity),
          ),

          SizedBox(height: isMobile ? 40 : 60),

          // More Coming Soon Text
          Text(
            'More coming soon',
            style: GoogleFonts.jersey10(
              color: Colors.white,
              fontSize: isMobile ? 32 : 48,
              letterSpacing: 2,
            ),
          ),

          SizedBox(height: isMobile ? 40 : 60),

          // Red dashed line before footer
          CustomPaint(
            painter: DashedLinePainter(),
            child: const SizedBox(height: 1, width: double.infinity),
          ),

          // Empty section with black background
          SizedBox(height: isMobile ? 200 : 300),

          // Red dashed line before footer content
          CustomPaint(
            painter: DashedLinePainter(),
            child: const SizedBox(height: 1, width: double.infinity),
          ),

          SizedBox(height: isMobile ? 40 : 60),

          // Footer
          Padding(
            padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 40),
            child: isMobile
                ? _buildMobileFooter(context)
                : _buildDesktopFooter(context),
          ),

          SizedBox(height: isMobile ? 40 : 60),

          // Red dashed line at bottom
          CustomPaint(
            painter: DashedLinePainter(),
            child: const SizedBox(height: 1, width: double.infinity),
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }

  // Mobile Navbar
  Widget _buildMobileNavbar(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          NavItem(text: 'HOME', isMobile: true, isActive: true, onTap: () {}),
          NavItem(
            text: 'ABOUT',
            isMobile: true,
            isActive: false,
            onTap: () => Navigator.pushReplacementNamed(context, '/about'),
          ),
          NavItem(
            text: 'PORTOFOLIO',
            isMobile: true,
            isActive: false,
            onTap: () => Navigator.pushReplacementNamed(context, '/portfolio'),
          ),
          NavItem(
            text: 'CONTACT',
            isMobile: true,
            isActive: false,
            onTap: () => Navigator.pushReplacementNamed(context, '/contact'),
          ),
        ],
      ),
    );
  }

  // Desktop Navbar
  Widget _buildDesktopNavbar(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        Row(
          children: [
            NavItem(
              text: 'HOME',
              isMobile: false,
              isActive: true,
              onTap: () {},
            ),
            NavItem(
              text: 'ABOUT',
              isMobile: false,
              isActive: false,
              onTap: () => Navigator.pushReplacementNamed(context, '/about'),
            ),
            NavItem(
              text: 'PORTOFOLIO',
              isMobile: false,
              isActive: false,
              onTap: () =>
                  Navigator.pushReplacementNamed(context, '/portfolio'),
            ),
            NavItem(
              text: 'CONTACT',
              isMobile: false,
              isActive: false,
              onTap: () => Navigator.pushReplacementNamed(context, '/contact'),
            ),
          ],
        ),
        const Spacer(),
      ],
    );
  }

  // Mobile Footer
  Widget _buildMobileFooter(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
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
                isActive: true,
                onTap: () {},
              ),
              NavItem(
                text: 'ABOUT',
                isMobile: true,
                isActive: false,
                onTap: () => Navigator.pushReplacementNamed(context, '/about'),
              ),
              NavItem(
                text: 'PORTOFOLIO',
                isMobile: true,
                isActive: false,
                onTap: () =>
                    Navigator.pushReplacementNamed(context, '/portfolio'),
              ),
              NavItem(
                text: 'CONTACT',
                isMobile: true,
                isActive: false,
                onTap: () =>
                    Navigator.pushReplacementNamed(context, '/contact'),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildSocialIcon('assets/images/instagram.png'),
            const SizedBox(width: 15),
            _buildSocialIcon('assets/images/facebook.png'),
            const SizedBox(width: 15),
            _buildSocialIcon('assets/images/youtube.png'),
            const SizedBox(width: 15),
            _buildSocialIcon('assets/images/Twitter.png'),
          ],
        ),
      ],
    );
  }

  // Desktop Footer
  Widget _buildDesktopFooter(BuildContext context) {
    return Row(
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
              isMobile: false,
              isActive: true,
              onTap: () {},
            ),
            NavItem(
              text: 'ABOUT',
              isMobile: false,
              isActive: false,
              onTap: () => Navigator.pushReplacementNamed(context, '/about'),
            ),
            NavItem(
              text: 'PORTOFOLIO',
              isMobile: false,
              isActive: false,
              onTap: () =>
                  Navigator.pushReplacementNamed(context, '/portfolio'),
            ),
            NavItem(
              text: 'CONTACT',
              isMobile: false,
              isActive: false,
              onTap: () => Navigator.pushReplacementNamed(context, '/contact'),
            ),
          ],
        ),
        const Spacer(),
        Row(
          children: [
            _buildSocialIcon('assets/images/instagram.png'),
            const SizedBox(width: 15),
            _buildSocialIcon('assets/images/facebook.png'),
            const SizedBox(width: 15),
            _buildSocialIcon('assets/images/youtube.png'),
            const SizedBox(width: 15),
            _buildSocialIcon('assets/images/Twitter.png'),
          ],
        ),
      ],
    );
  }

  Widget _buildSocialIcon(String imagePath) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white.withOpacity(0.3), width: 1),
      ),
      child: Center(
        child: Image.asset(
          imagePath,
          width: 24,
          height: 24,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
