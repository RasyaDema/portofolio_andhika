import 'package:flutter/material.dart';
import '../config/app_theme.dart';
import '../constants/app_constants.dart';
import '../widgets/dashed_line_painter.dart';
import '../widgets/nav_item.dart';
import '../services/navigation_service.dart';

class AppNavBar extends StatelessWidget {
  final String currentRoute;

  const AppNavBar({super.key, required this.currentRoute});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < AppConstants.mobileBreakpoint;

    return Column(
      children: [
        CustomPaint(
          painter: DashedLinePainter(),
          child: const SizedBox(height: 1, width: double.infinity),
        ),
        SizedBox(height: isMobile ? 15 : 20),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: isMobile
                ? AppConstants.mobilePadding
                : AppConstants.desktopPadding,
          ),
          child: isMobile
              ? _buildMobileNavBar(context, isMobile)
              : _buildDesktopNavBar(context, isMobile),
        ),
        SizedBox(height: isMobile ? 15 : 20),
        CustomPaint(
          painter: DashedLinePainter(),
          child: const SizedBox(height: 1, width: double.infinity),
        ),
      ],
    );
  }

  Widget _buildMobileNavBar(BuildContext context, bool isMobile) {
    return Column(
      children: [
        Text(
          AppConstants.brandName,
          style: AppTheme.brandTextStyle(isMobile: isMobile),
        ),
        const SizedBox(height: 15),
        Wrap(
          alignment: WrapAlignment.center,
          spacing: 8,
          runSpacing: 8,
          children: _buildNavItems(context, isMobile: true),
        ),
      ],
    );
  }

  Widget _buildDesktopNavBar(BuildContext context, bool isMobile) {
    return Row(
      children: [
        Text(
          AppConstants.brandName,
          style: AppTheme.brandTextStyle(isMobile: isMobile),
        ),
        const Spacer(),
        Row(children: _buildNavItems(context, isMobile: false)),
        const Spacer(),
      ],
    );
  }

  List<Widget> _buildNavItems(BuildContext context, {required bool isMobile}) {
    return [
      NavItem(
        text: 'HOME',
        isMobile: isMobile,
        onTap: () {
          if (currentRoute != AppConstants.homeRoute) {
            NavigationService.navigateTo(AppConstants.homeRoute);
          }
        },
      ),
      NavItem(
        text: 'ABOUT',
        isMobile: isMobile,
        onTap: () {
          if (currentRoute != AppConstants.aboutRoute) {
            NavigationService.navigateTo(AppConstants.aboutRoute);
          }
        },
      ),
      NavItem(
        text: 'PORTOFOLIO',
        isMobile: isMobile,
        onTap: () {
          if (currentRoute != AppConstants.portfolioRoute) {
            NavigationService.navigateTo(AppConstants.portfolioRoute);
          }
        },
      ),
      NavItem(
        text: 'CONTACT',
        isMobile: isMobile,
        onTap: () {
          if (currentRoute != AppConstants.contactRoute) {
            NavigationService.navigateTo(AppConstants.contactRoute);
          }
        },
      ),
    ];
  }
}
