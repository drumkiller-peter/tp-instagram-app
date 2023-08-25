import 'package:flutter/material.dart';
import 'package:tp_instagram_app/screens/home/home_screen.dart';

class AppRoutes {
  AppRoutes._();

  static const String home = '/home';
  static const String dashboard = '/dashboard';

  static Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case home:
        return _getMaterialRoute(
          HomeScreen(
            email: routeSettings.arguments as String,
          ),
        );

      case dashboard:
        return _getMaterialRoute(
          HomeScreen(
            email: routeSettings.arguments as String,
          ),
        );

      default:
        return _getMaterialRoute(
          ErrorWidget(
            Exception("Route Not Found"),
          ),
        );
    }
  }

  static MaterialPageRoute _getMaterialRoute(Widget screen) =>
      MaterialPageRoute(builder: (_) => screen);
}
