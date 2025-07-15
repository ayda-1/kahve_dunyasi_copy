import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kahve_dunyasi/entry_page.dart';
import 'package:kahve_dunyasi/online_shop_page.dart';
import 'package:kahve_dunyasi/take_away_bottom_navigation_bar.dart';
import 'package:kahve_dunyasi/take_away_page.dart';

class RouteGenerator {
  static Route<dynamic>? routeGenerator(RouteSettings settings) {
    if (settings.name == "/") {
      return MaterialPageRoute(builder: (context) => EntryPage());
    }  else if (settings.name == "/entryPage") {
      return MaterialPageRoute(builder: (context) => EntryPage());
    }else if (settings.name == "/takeAwayPage") {
      return MaterialPageRoute(builder: (context) => TakeAwayBottomNavigationBar());
    }else if (settings.name == "/onlineShopPage") {
      return MaterialPageRoute(builder: (context) => OnlineShopPage());
    }
  }
}
