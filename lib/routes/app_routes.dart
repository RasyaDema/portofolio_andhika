import 'package:flutter/material.dart';
import '../screens/home_page.dart';
import '../screens/contact_page.dart';
import '../screens/about_page.dart';
import '../screens/portfolio_page.dart';

class AppRoutes {
  static const String home = '/';
  static const String contact = '/contact';
  static const String about = '/about';
  static const String portfolio = '/portfolio';

  static Map<String, WidgetBuilder> routes = {
    home: (context) => const HomePage(),
    contact: (context) => const ContactPage(),
    about: (context) => const AboutPage(),
    portfolio: (context) => const PortfolioPage(),
  };

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (context) => const HomePage());
      case contact:
        return MaterialPageRoute(builder: (context) => const ContactPage());
      case about:
        return MaterialPageRoute(builder: (context) => const AboutPage());
      case portfolio:
        return MaterialPageRoute(builder: (context) => const PortfolioPage());
      default:
        return MaterialPageRoute(builder: (context) => const HomePage());
    }
  }
}
