import 'package:flutter/widgets.dart';
import 'package:flutter_deck/flutter_deck.dart';

class ImpostorSlide extends FlutterDeckImageSlide {
  const ImpostorSlide({super.key})
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/impostor',
          ),
        );

  @override
  Image get image => Image.asset(
        'assets/images/impostor.png',
        fit: BoxFit.contain,
      );
}
