import 'package:flutter/material.dart';
import 'package:piano/beat_maker/view/beat_maker_screen.dart';
import 'package:piano/home/view/home_screen.dart';
import 'package:piano/navigation/router_path.dart';
import 'package:piano/sampler_pad/view/sampler_pad_screen.dart';
import 'package:piano/piano/view/piano_screen.dart';

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

Route<dynamic>? generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case RouterPath.home:
      return MaterialPageRoute(
        builder: (_) => HomeScreen(routeObserver: routeObserver),
      );
    case RouterPath.piano:
      return MaterialPageRoute(
        builder: (_) => const PianoScreen(),
        settings: settings,
      );
    case RouterPath.samplerPad:
      return MaterialPageRoute(
        builder: (_) => const SamplerPadScreen(),
        settings: settings,
      );
    case RouterPath.beatMaker:
      return MaterialPageRoute(
        builder: (_) => const BeatMakerScreen(),
        settings: settings,
      );
    default:
      return MaterialPageRoute(
        builder: (_) => HomeScreen(
          routeObserver: routeObserver,
        ),
        settings: settings,
      );
  }
}
