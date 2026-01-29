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

    // Get list of images based on selected tab
    final List<String> portfolioImages = _getPortfolioImages();

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
        // Container with fixed background and scrollable images
        Stack(
          children: [
            // Fixed background image dengan seamless scrolling
            Container(
              height: isMobile ? 700 : 800,
              width: double.infinity,
              child: AnimatedBuilder(
                animation: _scrollController,
                builder: (context, child) {
                  final screenWidth = MediaQuery.of(context).size.width;
                  final imageWidth = isMobile
                      ? screenWidth * 3.5
                      : screenWidth * 1.5;
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

            // Scrollable portfolio images in grid
            Container(
              height: isMobile ? 700 : 800,
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                  horizontal: isMobile ? 20 : 100,
                  vertical: 20,
                ),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                    childAspectRatio: isMobile ? 0.8 : 1.0,
                  ),
                  itemCount: portfolioImages.length,
                  itemBuilder: (context, index) {
                    return _buildPortfolioImage(
                      portfolioImages[index],
                      isMobile,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  List<String> _getPortfolioImages() {
    if (selectedTab == 'COSPLAY') {
      return [
        'assets/Cosplay/cosplay1.png',
        'assets/Cosplay/cosplay2.png',
        'assets/Cosplay/cosplay3.png',
        'assets/Cosplay/cosplay4.png',
        'assets/Cosplay/cosplay5.png',
        'assets/Cosplay/cosplay6.png',
        'assets/Cosplay/cosplay7.png',
        'assets/Cosplay/cosplay8.png',
        'assets/Cosplay/cosplay9.png',
        'assets/Cosplay/cosplay11.png',
        'assets/Cosplay/cosplay12.png',
        'assets/Cosplay/cosplay13.png',
        'assets/Cosplay/cosplay14.png',
        'assets/Cosplay/cosplay15.png',
        'assets/Cosplay/cosplay16.png',
        'assets/Cosplay/cosplay17.png',
        'assets/Cosplay/cosplay18.png',
        'assets/Cosplay/cosplay19.png',
        'assets/Cosplay/cosplay20.png',
        'assets/Cosplay/cosplay21.png',
        'assets/Cosplay/cosplay22.png',
        'assets/Cosplay/cosplay23.png',
        'assets/Cosplay/cosplay24.png',
        'assets/Cosplay/cosplay25.png',
      ];
    } else {
      // DESIGN
      return [
        'assets/Desain/desain1.png',
        'assets/Desain/desain2.png',
        'assets/Desain/desain3.png',
        'assets/Desain/desain4.png',
        'assets/Desain/desain5.png',
        'assets/Desain/desain6.png',
        'assets/Desain/desain7.png',
        'assets/Desain/desain8.png',
        'assets/Desain/desain9.png',
        'assets/Desain/desain10.png',
        'assets/Desain/desain11.png',
        'assets/Desain/desain12.png',
        'assets/Desain/desain13.png',
        'assets/Desain/desain14.png',
        'assets/Desain/desain15.png',
        'assets/Desain/desain16.png',
        'assets/Desain/desain17.png',
        'assets/Desain/desain18.png',
        'assets/Desain/desain19.png',
        'assets/Desain/desain20.png',
        'assets/Desain/desain21.png',
        'assets/Desain/desain22.png',
        'assets/Desain/desain23.png',
        'assets/Desain/desain24.png',
        'assets/Desain/desain25.png',
        'assets/Desain/desain26.png',
        'assets/Desain/desain27.png',
        'assets/Desain/desain28.png',
        'assets/Desain/desain29.png',
        'assets/Desain/desain30.png',
        'assets/Desain/desain31.png',
        'assets/Desain/desain32.png',
        'assets/Desain/desain33.png',
        'assets/Desain/desain34.png',
      ];
    }
  }

  Widget _buildPortfolioImage(String imagePath, bool isMobile) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              color: Colors.grey[800],
              child: const Center(
                child: Icon(Icons.image, color: Colors.white, size: 40),
              ),
            );
          },
        ),
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
