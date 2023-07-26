import 'package:flutter/widgets.dart';
import 'package:flutter_deck/flutter_deck.dart';

class ArchitectureSlide extends FlutterDeckImageSlide {
  const ArchitectureSlide({super.key})
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/architecture',
            header: FlutterDeckHeaderConfiguration(
              title: 'Flutter architecture',
            ),
          ),
        );

  @override
  Image get image => Image.asset(
        'assets/images/architecture.png',
        fit: BoxFit.contain,
      );
}
