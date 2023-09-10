import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

const _spacing = 64.0;

class FlutterForAndroidDevsSlide extends FlutterDeckSlideWidget {
  const FlutterForAndroidDevsSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/flutter-for-android-devs',
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.blank(
      builder: (context) => Padding(
        padding: const EdgeInsets.all(_spacing),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Image.asset(
                'assets/images/flutter-for-android-devs.png',
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: _spacing),
            Text(
              'https://docs.flutter.dev/get-started/flutter-for/android-devs',
              style: FlutterDeckTheme.of(context).textTheme.title,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
