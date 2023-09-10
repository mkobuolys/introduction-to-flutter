import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

class FlutterTreesSlide extends FlutterDeckSlideWidget {
  const FlutterTreesSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/flutter-trees',
            header: FlutterDeckHeaderConfiguration(title: 'Flutter Trees'),
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.blank(
      builder: (context) {
        final theme = Theme.of(context);
        final colorScheme = theme.colorScheme;

        return Center(
          child: Card(
            color: theme.brightness == Brightness.dark
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
      },
    );
  }
}
