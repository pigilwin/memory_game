import 'package:flutter/material.dart';
import 'package:memory_game/matcher/features/matcher.dart';
import 'package:memory_game/shared/features/home_page.dart';

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Memory Game',
      theme: loadTheme(),
      initialRoute: '/',
      routes: loadRoutes(),
      debugShowCheckedModeBanner: false,
    );
  }

  Map<String, Widget Function(BuildContext)> loadRoutes() {
    return {
      '/': (BuildContext context) => const HomePage(),
      '/matcher': (BuildContext context) => const Matcher()
    };
  }

  ThemeData loadTheme() {
    return ThemeData(
      primarySwatch: Colors.lightGreen,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          primary: Colors.red,
          padding: const EdgeInsets.all(10)
        )
      )
    );
  }
}