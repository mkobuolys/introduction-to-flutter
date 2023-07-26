import 'package:flutter/widgets.dart';
import 'package:flutter_deck/flutter_deck.dart';

class OpenSlide extends FlutterDeckSplitSlide {
  const OpenSlide({super.key})
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/open',
            steps: 3,
            header: FlutterDeckHeaderConfiguration(title: 'Open'),
          ),
        );

  @override
  Widget left(BuildContext context) {
    return FlutterDeckBulletList(
      useSteps: true,
      items: const [
        'Free and open source',
        'Community driven',
        'See you at the pub(.dev) 🍻',
      ],
    );
  }

  @override
  Widget right(BuildContext context) {
    return Image.asset(
      'assets/images/flutter-community.png',
      fit: BoxFit.contain,
    );
  }

  @override
  Color get rightBackgroundColor => const Color(0xff03A9F4);
}
