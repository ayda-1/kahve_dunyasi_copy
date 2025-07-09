import 'package:flutter/material.dart';
import 'package:kahve_dunyasi/entry_page.dart';
import 'package:kahve_dunyasi/route_generator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: RouteGenerator.routeGenerator,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(textTheme: TextTheme(
        titleSmall: TextStyle(
        fontSize: 15,color: Colors.white))),
    );
  }
}
