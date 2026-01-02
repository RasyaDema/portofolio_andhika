import 'package:flutter/material.dart';
import '../constants/constants.dart';
import '../config/app_theme.dart';
import '../utils/utils.dart';
import '../widgets/widgets.dart';
import '../controllers/controllers.dart';

/// Contoh halaman About yang sudah direfactor dengan struktur baru
///
/// Menggunakan:
/// - AboutController untuk business logic
/// - AppNavBar untuk navbar reusable
/// - ResponsiveHelper untuk responsive design
/// - AppTheme untuk styling
/// - AppConstants untuk konstanta
class AboutPageRefactored extends StatefulWidget {
  const AboutPageRefactored({super.key});

  @override
  State<AboutPageRefactored> createState() => _AboutPageRefactoredState();
}

class _AboutPageRefactoredState extends State<AboutPageRefactored> {
  late final AboutController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AboutController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);
    final padding = ResponsiveHelper.getPadding(context);
    final verticalSpacing = ResponsiveHelper.getVerticalSpacing(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: verticalSpacing),

            // Navbar reusable
            const AppNavBar(currentRoute: AppConstants.aboutRoute),

            SizedBox(height: verticalSpacing * 2),

            // Content
            Padding(
              padding: EdgeInsets.symmetric(horizontal: padding),
              child: ListenableBuilder(
                listenable: _controller,
                builder: (context, child) {
                  return isMobile
                      ? _buildMobileLayout()
                      : _buildDesktopLayout();
                },
              ),
            ),

            SizedBox(height: verticalSpacing * 2),
          ],
        ),
      ),
    );
  }

  Widget _buildMobileLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildProfileSection(isMobile: true),
        const SizedBox(height: 40),
        _buildStatsSection(isMobile: true),
        const SizedBox(height: 40),
        _buildSkillsSection(isMobile: true),
      ],
    );
  }

  Widget _buildDesktopLayout() {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(flex: 2, child: _buildProfileSection(isMobile: false)),
            const SizedBox(width: 60),
            Expanded(
              child: Column(
                children: [
                  _buildStatsSection(isMobile: false),
                  const SizedBox(height: 40),
                  _buildSkillsSection(isMobile: false),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildProfileSection({required bool isMobile}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          _controller.name,
          style: AppTheme.headingStyle(isMobile: isMobile),
        ),
        const SizedBox(height: 10),
        Text(
          _controller.title,
          style: AppTheme.bodyTextStyle(
            isMobile: isMobile,
            color: AppColors.tertiaryText,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          _controller.bio,
          style: AppTheme.bodyTextStyle(isMobile: isMobile),
        ),
      ],
    );
  }

  Widget _buildStatsSection({required bool isMobile}) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.navItemBorder),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          _buildStatItem(
            'FOLLOWERS',
            _controller.followersCount.toString(),
            isMobile,
          ),
          const Divider(height: 30),
          _buildStatItem(
            'PROJECTS',
            _controller.projectsCompleted.toString(),
            isMobile,
          ),
          const Divider(height: 30),
          _buildStatItem(
            'AWARDS',
            _controller.awardsReceived.toString(),
            isMobile,
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(String label, String value, bool isMobile) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: AppTheme.bodyTextStyle(
            isMobile: isMobile,
            color: AppColors.tertiaryText,
          ),
        ),
        Text(
          value,
          style: AppTheme.headingStyle(
            isMobile: isMobile,
            color: AppColors.primaryText,
          ).copyWith(fontSize: isMobile ? 24 : 32),
        ),
      ],
    );
  }

  Widget _buildSkillsSection({required bool isMobile}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'SKILLS',
          style: AppTheme.headingStyle(
            isMobile: isMobile,
          ).copyWith(fontSize: isMobile ? 24 : 32),
        ),
        const SizedBox(height: 20),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: _controller.skills.map((skill) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.navItemBorder),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                skill,
                style: AppTheme.bodyTextStyle(
                  isMobile: isMobile,
                  color: AppColors.primaryText,
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
