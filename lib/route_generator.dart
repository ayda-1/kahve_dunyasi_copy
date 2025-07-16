import 'package:flutter/material.dart';
import 'package:kahve_dunyasi/entry_page.dart';
import 'package:kahve_dunyasi/login_screen.dart';
import 'package:kahve_dunyasi/take_away_bottom_navigation_bar.dart';

class RouteGenerator {
  static Route<dynamic>? routeGenerator(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case "/entry":
        return MaterialPageRoute(builder: (_) => const EntryPage());
      case "/takeAwayPage":
        return MaterialPageRoute(
          builder: (_) => const TakeAwayBottomNavigationBar(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) =>
              Scaffold(body: Center(child: Text("404: Sayfa bulunamadı"))),
        );
    }
  }
}
