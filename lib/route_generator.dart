import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kahve_dunyasi/entry_page.dart';
import 'package:kahve_dunyasi/entry_screen.dart';

class RouteGenerator {
  static Route<dynamic>? routeGenerator(RouteSettings settings) {
    if (settings.name == "/") {
      return MaterialPageRoute(builder: (context) => EntryPage());
    } else if (settings.name == "/entryScreen") {
      return MaterialPageRoute(builder: (context) => EntryScreen());
    } else if (settings.name == "/entryPage") {
      return MaterialPageRoute(builder: (context) => EntryPage());
    }
  }
}
