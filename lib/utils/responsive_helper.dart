import 'package:flutter/material.dart';
import '../constants/app_constants.dart';

class ResponsiveHelper {
  // Check if screen is mobile
  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < AppConstants.mobileBreakpoint;
  }

  // Check if screen is tablet
  static bool isTablet(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width >= AppConstants.mobileBreakpoint && width < 1024;
  }

  // Check if screen is desktop
  static bool isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width >= 1024;
  }

  // Get responsive padding
  static double getPadding(BuildContext context) {
    return isMobile(context)
        ? AppConstants.mobilePadding
        : AppConstants.desktopPadding;
  }

  // Get responsive vertical spacing
  static double getVerticalSpacing(BuildContext context) {
    return isMobile(context)
        ? AppConstants.mobileVerticalSpacing
        : AppConstants.desktopVerticalSpacing;
  }

  // Get responsive font size
  static double getResponsiveFontSize(
    BuildContext context, {
    required double mobile,
    required double desktop,
  }) {
    return isMobile(context) ? mobile : desktop;
  }

  // Get number of columns for grid
  static int getGridColumns(BuildContext context) {
    if (isMobile(context)) return 1;
    if (isTablet(context)) return 2;
    return 3;
  }
}
