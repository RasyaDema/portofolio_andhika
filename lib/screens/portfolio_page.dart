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
    with TickerProviderStateMixin {
  String selectedTab = 'COSPLAY';
  int? selectedImageIndex;
  late AnimationController _scrollController;
  late AnimationController _tabAnimationController;
  late Animation<double> _tabAnimation;

  final List<GlobalKey> _tabKeys = [GlobalKey(), GlobalKey(), GlobalKey()];
  bool _isFirstBuild = true;

  @override
  void initState() {
    super.initState();
    _scrollController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 35),
    )..repeat();

    _tabAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _tabAnimation = Tween<double>(begin: 0, end: 0).animate(
      CurvedAnimation(parent: _tabAnimationController, curve: Curves.easeInOut),
    );

    // Force rebuild after first frame to get accurate measurements
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted && _isFirstBuild) {
        // Add small delay to ensure widgets are fully rendered
        Future.delayed(const Duration(milliseconds: 50), () {
          if (mounted) {
            setState(() {
              _isFirstBuild = false;
            });
          }
        });
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _tabAnimationController.dispose();
    super.dispose();
  }

  void _animateToTab(String tab) {
    double targetPosition = 0;
    if (tab == 'COSPLAY') {
      targetPosition = 0;
    } else if (tab == 'DESIGN') {
      targetPosition = 1;
    } else if (tab == '3D ANIMATOR') {
      targetPosition = 2;
    }

    _tabAnimation =
        Tween<double>(begin: _tabAnimation.value, end: targetPosition).animate(
          CurvedAnimation(
            parent: _tabAnimationController,
            curve: Curves.easeInOut,
          ),
        );

    _tabAnimationController.forward(from: 0);
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

  Widget _buildTabButton(String tab, bool isMobile, int index) {
    return InkWell(
      key: _tabKeys[index],
      onTap: () {
        setState(() {
          selectedTab = tab;
          selectedImageIndex = null;
          _animateToTab(tab);
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 15 : 25,
          vertical: isMobile ? 8 : 12,
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

  Widget _buildAnimatedTabs(bool isMobile) {
    final tabs = ['COSPLAY', 'DESIGN', '3D ANIMATOR'];

    return LayoutBuilder(
      builder: (context, constraints) {
        return Stack(
          children: [
            // Animated red background
            AnimatedBuilder(
              animation: _tabAnimation,
              builder: (context, child) {
                // Get button sizes and positions from GlobalKeys
                List<double> buttonWidths = [];
                List<double> buttonPositions = [0];

                for (int i = 0; i < _tabKeys.length; i++) {
                  final RenderBox? renderBox =
                      _tabKeys[i].currentContext?.findRenderObject()
                          as RenderBox?;
                  if (renderBox != null) {
                    buttonWidths.add(renderBox.size.width);
                    if (i < _tabKeys.length - 1) {
                      buttonPositions.add(
                        buttonPositions.last + renderBox.size.width,
                      );
                    }
                  } else {
                    // Fallback if not yet rendered
                    double fallbackWidth = isMobile ? 120 : 200;
                    buttonWidths.add(fallbackWidth);
                    if (i < _tabKeys.length - 1) {
                      buttonPositions.add(buttonPositions.last + fallbackWidth);
                    }
                  }
                }

                int currentIndex = _tabAnimation.value.round().clamp(
                  0,
                  buttonWidths.length - 1,
                );
                double targetIndex = _tabAnimation.value;

                // Calculate position
                double leftPosition = 0;
                if (targetIndex.floor() < buttonPositions.length) {
                  leftPosition = buttonPositions[targetIndex.floor()];

                  // Add partial width for in-between animation
                  if (targetIndex != targetIndex.floor() &&
                      targetIndex.floor() < buttonWidths.length - 1) {
                    double fraction = targetIndex - targetIndex.floor();
                    leftPosition +=
                        buttonWidths[targetIndex.floor()] * fraction;
                  }
                }

                // Get current button width
                double currentWidth =
                    buttonWidths.isNotEmpty &&
                        currentIndex < buttonWidths.length
                    ? buttonWidths[currentIndex]
                    : (isMobile ? 120 : 200);

                // Get height from first button
                double currentHeight = isMobile ? 40 : 64;
                final RenderBox? renderBox =
                    _tabKeys[0].currentContext?.findRenderObject()
                        as RenderBox?;
                if (renderBox != null) {
                  currentHeight = renderBox.size.height;
                }

                return Positioned(
                  left: leftPosition,
                  child: Container(
                    width: currentWidth,
                    height: currentHeight,
                    decoration: const BoxDecoration(color: Color(0xFFFF0000)),
                  ),
                );
              },
            ),
            // Buttons
            Row(
              mainAxisSize: MainAxisSize.min,
              children: tabs
                  .asMap()
                  .entries
                  .map(
                    (entry) =>
                        _buildTabButton(entry.value, isMobile, entry.key),
                  )
                  .toList(),
            ),
          ],
        );
      },
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
        // Tab buttons with animation
        Center(child: _buildAnimatedTabs(isMobile)),
        SizedBox(height: isMobile ? 10 : 20),
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
              width: double.infinity,
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                  horizontal: isMobile ? 10 : 100,
                  vertical: isMobile ? 10 : 15,
                ),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: isMobile ? 3 : 4,
                    crossAxisSpacing: isMobile ? 8 : 15,
                    mainAxisSpacing: isMobile ? 8 : 15,
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
        'assets/Desain/desain35.png',
        'assets/Desain/desain36.png',
        'assets/Desain/desain37.png',
        'assets/Desain/desain38.png',
        'assets/Desain/desain39.png',
        'assets/Desain/desain40.png',
        'assets/Desain/desain41.png',
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
          cacheWidth: isMobile ? 300 : 400,
          cacheHeight: isMobile ? 400 : 500,
          filterQuality: FilterQuality.low,
          frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
            if (wasSynchronouslyLoaded) return child;
            return AnimatedOpacity(
              opacity: frame == null ? 0 : 1,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeIn,
              child: child,
            );
          },
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
        // Tab buttons with animation
        Center(child: _buildAnimatedTabs(isMobile)),
        SizedBox(height: isMobile ? 10 : 20),
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
