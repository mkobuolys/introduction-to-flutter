import 'package:flutter/widgets.dart';
import 'package:flutter_deck/flutter_deck.dart';

class ArchitectureSlide extends FlutterDeckSlideWidget {
  const ArchitectureSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/architecture',
            header: FlutterDeckHeaderConfiguration(
              title: 'Flutter architecture',
            ),
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.image(
      imageBuilder: (context) => Image.asset(
        'assets/images/architecture.png',
        fit: BoxFit.contain,
      ),
    );
  }
}
