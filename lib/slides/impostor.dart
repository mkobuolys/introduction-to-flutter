import 'package:flutter/widgets.dart';
import 'package:flutter_deck/flutter_deck.dart';

class ImpostorSlide extends FlutterDeckSlideWidget {
  const ImpostorSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/impostor',
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.image(
      imageBuilder: (context) => Image.asset(
        'assets/images/impostor.png',
        fit: BoxFit.contain,
      ),
    );
  }
}
