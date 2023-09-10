import 'package:flutter/widgets.dart';
import 'package:flutter_deck/flutter_deck.dart';

class OpenSlide extends FlutterDeckSlideWidget {
  const OpenSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/open',
            steps: 3,
            header: FlutterDeckHeaderConfiguration(title: 'Open'),
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.split(
      theme: FlutterDeckTheme.of(context).copyWith(
        splitSlideTheme: const FlutterDeckSplitSlideThemeData(
          rightBackgroundColor: Color(0xff03A9F4),
        ),
      ),
      leftBuilder: (context) => FlutterDeckBulletList(
        useSteps: true,
        items: const [
          'Free and open source',
          'Community driven',
          'See you at the pub(.dev) 🍻',
        ],
      ),
      rightBuilder: (context) => Image.asset(
        'assets/images/flutter-community.png',
        fit: BoxFit.contain,
      ),
    );
  }
}
