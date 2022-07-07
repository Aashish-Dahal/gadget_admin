import 'package:admin_panel/presentation/screen/demo_screen.dart';
import 'package:admin_panel/presentation/screen/slider_screen.dart';
import 'package:flutter/material.dart'
    show MaterialPageRoute, Route, RouteSettings, Widget;

class AppRouter {
  static Route<dynamic>? onGenerateRoutes(
      RouteSettings settings, bool isLoggedIn) {
    if (!isLoggedIn) {
      switch (settings.name) {
        case "":
          return _materialPageRoute(const HomeSlider());

        default:
          return _materialPageRoute(const DemoScreen());
      }
    } else if (isLoggedIn) {
    } else {
      switch (settings.name) {
        case 'about':
          return _materialPageRoute(const DemoScreen());
        default:
          _materialPageRoute(const DemoScreen());
      }
    }
    return null;
  }

  static Route<dynamic> _materialPageRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
