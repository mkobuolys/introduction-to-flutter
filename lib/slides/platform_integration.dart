import 'package:flutter/widgets.dart';
import 'package:flutter_deck/flutter_deck.dart';

class PlatformIntegrationSlide extends FlutterDeckSplitSlide {
  const PlatformIntegrationSlide({super.key})
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/platform-integration',
            steps: 3,
            header:
                FlutterDeckHeaderConfiguration(title: 'Platform integration'),
          ),
        );

  @override
  Widget left(BuildContext context) {
    return FlutterDeckBulletList(
      useSteps: true,
      items: const [
        'Platform channels',
        'Federated plugins',
        'FFIgen/JNIgen',
      ],
    );
  }

  @override
  Widget right(BuildContext context) {
    return Image.asset(
      'assets/images/platform-channels.png',
      fit: BoxFit.contain,
    );
  }
}
