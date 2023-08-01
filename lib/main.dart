import 'package:flutter/material.dart';
import 'package:piano/home/view/home_screen.dart';
import 'package:piano/navigation/router.dart';
import 'package:piano/shared/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(routeObserver: routeObserver),
      onGenerateRoute: (settings) => generateRoute(settings),
      navigatorObservers: [routeObserver],
      theme: defineTheme(),
    );
  }
}
