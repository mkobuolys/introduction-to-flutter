import 'package:flutter/widgets.dart';
import 'package:flutter_deck/flutter_deck.dart';

class PlatformIntegrationSlide extends FlutterDeckSlideWidget {
  const PlatformIntegrationSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/platform-integration',
            steps: 3,
            header:
                FlutterDeckHeaderConfiguration(title: 'Platform integration'),
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.split(
      leftBuilder: (context) => FlutterDeckBulletList(
        useSteps: true,
        items: const [
          'Platform channels',
          'Federated plugins',
          'FFIgen/JNIgen',
        ],
      ),
      rightBuilder: (context) => Image.asset(
        'assets/images/platform-channels.png',
        fit: BoxFit.contain,
      ),
    );
  }
}
