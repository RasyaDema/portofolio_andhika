import 'package:flutter/material.dart';

class AnimationHelper {
  // Create fade in animation
  static Widget fadeIn({
    required Widget child,
    required AnimationController controller,
    Duration delay = Duration.zero,
  }) {
    return FadeTransition(
      opacity: Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
          parent: controller,
          curve: Interval(
            delay.inMilliseconds / controller.duration!.inMilliseconds,
            1.0,
            curve: Curves.easeIn,
          ),
        ),
      ),
      child: child,
    );
  }

  // Create slide in animation
  static Widget slideIn({
    required Widget child,
    required AnimationController controller,
    Offset begin = const Offset(0, 0.1),
    Duration delay = Duration.zero,
  }) {
    return SlideTransition(
      position: Tween<Offset>(begin: begin, end: Offset.zero).animate(
        CurvedAnimation(
          parent: controller,
          curve: Interval(
            delay.inMilliseconds / controller.duration!.inMilliseconds,
            1.0,
            curve: Curves.easeOut,
          ),
        ),
      ),
      child: child,
    );
  }

  // Create scale animation
  static Widget scaleIn({
    required Widget child,
    required AnimationController controller,
    Duration delay = Duration.zero,
  }) {
    return ScaleTransition(
      scale: Tween<double>(begin: 0.8, end: 1.0).animate(
        CurvedAnimation(
          parent: controller,
          curve: Interval(
            delay.inMilliseconds / controller.duration!.inMilliseconds,
            1.0,
            curve: Curves.easeOut,
          ),
        ),
      ),
      child: child,
    );
  }
}
