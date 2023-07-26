import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

class FlutterTreesSlide extends FlutterDeckBlankSlide {
  const FlutterTreesSlide({super.key})
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/flutter-trees',
            header: FlutterDeckHeaderConfiguration(title: 'Flutter Trees'),
          ),
        );

  @override
  Widget body(BuildContext context) {
    final theme = Theme.of(context);
    final brightness = theme.brightness;
    final colorScheme = theme.colorScheme;

    return Center(
      child: Card(
        color: brightness == Brightness.dark
            ? colorScheme.onBackground
            : colorScheme.onPrimary,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Image.asset(
            'assets/images/flutter-trees.png',
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
