import 'package:flutter_deck/flutter_deck.dart';

class ThankYouSlide extends FlutterDeckTitleSlide {
  const ThankYouSlide({super.key})
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/thank-you',
            footer: FlutterDeckFooterConfiguration(showFooter: false),
          ),
        );

  @override
  String get title => 'Save trees. Stay SOLID. Thank you!';
}
