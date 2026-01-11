import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui';
import '../widgets/nav_item.dart';
import '../widgets/dashed_line_painter.dart';

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key});

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage>
    with SingleTickerProviderStateMixin {
  String selectedTab = 'COSPLAY';
  int? selectedImageIndex;
  late AnimationController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 35),
    )..repeat();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

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
                                  fontSize: 28,
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
                                isActive: false,
                                onTap: () => Navigator.pushReplacementNamed(
                                  context,
                                  '/about',
                                ),
                              ),
                              NavItem(
                                text: 'PORTOFOLIO',
                                isMobile: true,
                                isActive: true,
                                onTap: () {},
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
                                  isActive: false,
                                  onTap: () => Navigator.pushReplacementNamed(
                                    context,
                                    '/about',
                                  ),
                                ),
                                NavItem(
                                  text: 'PORTOFOLIO',
                                  isActive: true,
                                  onTap: () {},
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

            // ================= CONTENT WITH TABS =================
            _buildContent(isMobile),

            SizedBox(height: isMobile ? 30 : 50),
          ],
        ),
      ),
    );
  }

  Widget _buildTabButton(String tab, bool isMobile) {
    final isSelected = selectedTab == tab;
    return InkWell(
      onTap: () {
        setState(() {
          selectedTab = tab;
          selectedImageIndex = null;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 15 : 25,
          vertical: isMobile ? 8 : 12,
        ),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFFF0000) : Colors.transparent,
        ),
        child: Text(
          tab,
          style: GoogleFonts.jersey10(
            color: Colors.white,
            fontSize: isMobile ? 24 : 40,
          ),
        ),
      ),
    );
  }

  Widget _buildContent(bool isMobile) {
    return Column(
      children: [
        // Title PORTOFOLIO (pas di bawah navbar)
        Text(
          'PORTOFOLIO',
          style: GoogleFonts.jersey10(
            color: Colors.white,
            fontSize: isMobile ? 35 : 50,
          ),
        ),
        SizedBox(height: isMobile ? 5 : 10),

        // Content dengan gambar background dan tombol di atas
        if (selectedTab == 'COSPLAY' || selectedTab == 'DESIGN')
          _buildScrollingImageWithTabs(isMobile)
        else
          _build3DAnimatorWithTabs(isMobile),
      ],
    );
  }

  Widget _buildScrollingImageWithTabs(bool isMobile) {
    final imagePath = selectedTab == 'COSPLAY'
        ? 'assets/images/cosplay.png'
        : 'assets/images/design.png';

    return Container(
      height: isMobile ? 500 : 700,
      width: double.infinity,
      child: Stack(
        children: [
          // Background image dengan seamless scrolling
          Positioned.fill(
            child: AnimatedBuilder(
              animation: _scrollController,
              builder: (context, child) {
                final screenWidth = MediaQuery.of(context).size.width;
                final imageWidth = screenWidth * 1.5;
                final offset = _scrollController.value * imageWidth;

                return ClipRect(
                  child: OverflowBox(
                    maxWidth: double.infinity,
                    child: Transform.translate(
                      offset: Offset(-offset, 0),
                      child: Row(
                        children: List.generate(3, (index) {
                          return SizedBox(
                            width: imageWidth,
                            child: ImageFiltered(
                              imageFilter: ImageFilter.blur(
                                sigmaX: 5,
                                sigmaY: 5,
                              ),
                              child: Image.asset(
                                imagePath,
                                fit: BoxFit.cover,
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
                          );
                        }),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          // Tab buttons overlay di atas gambar
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Wrap(
              alignment: WrapAlignment.center,
              spacing: isMobile ? 10 : 30,
              runSpacing: isMobile ? 10 : 0,
              children: [
                _buildTabButton('COSPLAY', isMobile),
                _buildTabButton('DESIGN', isMobile),
                _buildTabButton('3D ANIMATOR', isMobile),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _build3DAnimatorWithTabs(bool isMobile) {
    return Column(
      children: [
        // Tab buttons
        Wrap(
          alignment: WrapAlignment.center,
          spacing: isMobile ? 10 : 30,
          runSpacing: isMobile ? 10 : 0,
          children: [
            _buildTabButton('COSPLAY', isMobile),
            _buildTabButton('DESIGN', isMobile),
            _buildTabButton('3D ANIMATOR', isMobile),
          ],
        ),
        SizedBox(height: isMobile ? 20 : 40),
        // 3D Animator content
        _build3DAnimatorContent(isMobile),
      ],
    );
  }

  Widget _build3DAnimatorContent(bool isMobile) {
    final images = [
      'assets/images/animasi1.png',
      'assets/images/animasi2.png',
      'assets/images/animasi3.png',
    ];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 40),
      child: isMobile
          ? Column(
              children: images.asMap().entries.map((entry) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: _build3DImage(entry.key, entry.value, isMobile),
                );
              }).toList(),
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: images.asMap().entries.map((entry) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: _build3DImage(entry.key, entry.value, isMobile),
                );
              }).toList(),
            ),
    );
  }

  Widget _build3DImage(int index, String imagePath, bool isMobile) {
    return Container(
      width: isMobile ? double.infinity : 300,
      height: isMobile ? 200 : 250,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset(
          imagePath,
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              color: Colors.grey[800],
              child: const Center(
                child: Icon(Icons.image, color: Colors.white, size: 60),
              ),
            );
          },
        ),
      ),
    );
  }
}
