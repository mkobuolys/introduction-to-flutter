import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

const _spacing = 64.0;

class WhatIsFlutterSlide extends FlutterDeckBlankSlide {
  const WhatIsFlutterSlide({super.key})
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/what-is-flutter',
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
              'assets/images/devices.png',
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: _spacing),
          Text(
            'Google’s portable UI toolkit for building beautiful, '
            'natively compiled, multi-platform applications from '
            'a single codebase',
            style: Theme.of(context).textTheme.displayLarge,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
