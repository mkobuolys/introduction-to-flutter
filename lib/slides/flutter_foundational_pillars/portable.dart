import 'package:flutter/widgets.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:introduction_to_flutter/widgets/widgets.dart';

const _cardColor = Color(0xFFFFFFFF);

class PortableSlide extends FlutterDeckSplitSlide {
  const PortableSlide({super.key})
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/portable',
            steps: 3,
            header: FlutterDeckHeaderConfiguration(title: 'Portable'),
          ),
        );

  @override
  Widget left(BuildContext context) {
    return FlutterDeckBulletList(
      useSteps: true,
      items: const [
        '6 stable platforms + embedded',
        'Adaptive UI components',
        'Platform-specific APIs access',
      ],
    );
  }

  @override
  Widget right(BuildContext context) {
    const fit = BoxFit.contain;

    return AutoSwipeCarousel(
      duration: const Duration(seconds: 5),
      cardColor: _cardColor,
      children: [
        Image.asset('assets/images/platforms/mobile.jpeg', fit: fit),
        Image.asset('assets/images/platforms/web.jpeg', fit: fit),
        Image.asset('assets/images/platforms/desktop.jpeg', fit: fit),
        Image.asset('assets/images/platforms/embedded.jpeg', fit: fit),
      ],
    );
  }

  @override
  Color get rightBackgroundColor => _cardColor;
}
