import 'package:flutter_deck/flutter_deck.dart';

class IntroSlide extends FlutterDeckTitleSlide {
  const IntroSlide({super.key})
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/intro',
            footer: FlutterDeckFooterConfiguration(showFooter: false),
          ),
        );

  @override
  String get title => 'Let me introduce you to Flutter';
}
