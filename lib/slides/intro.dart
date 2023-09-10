import 'package:flutter/widgets.dart';
import 'package:flutter_deck/flutter_deck.dart';

class IntroSlide extends FlutterDeckSlideWidget {
  const IntroSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/intro',
            footer: FlutterDeckFooterConfiguration(showFooter: false),
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.title(title: 'Let me introduce you to Flutter');
  }
}
