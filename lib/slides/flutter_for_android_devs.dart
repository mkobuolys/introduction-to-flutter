import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

const _spacing = 64.0;

class FlutterForAndroidDevsSlide extends FlutterDeckBlankSlide {
  const FlutterForAndroidDevsSlide({super.key})
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/flutter-for-android-devs',
          ),
        );

  @override
  Widget body(BuildContext context) {
    return Padding(
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
            style: Theme.of(context).textTheme.displayLarge,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
