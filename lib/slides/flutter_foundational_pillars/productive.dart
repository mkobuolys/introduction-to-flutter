import 'package:flutter/widgets.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:introduction_to_flutter/widgets/widgets.dart';

class ProductiveSlide extends FlutterDeckSplitSlide {
  const ProductiveSlide({super.key})
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/productive',
            steps: 4,
            header: FlutterDeckHeaderConfiguration(title: 'Productive'),
          ),
        );

  @override
  Widget left(BuildContext context) {
    return FlutterDeckBulletList(
      useSteps: true,
      items: const [
        'One codebase to rule them all',
        'Pre-defined components for every taste',
        'Hot reload 🔥',
        'Pre-built toolkits for news & games apps',
      ],
    );
  }

  @override
  Widget right(BuildContext context) {
    const fit = BoxFit.contain;

    return AutoSwipeCarousel(
      children: [
        Image.asset('assets/images/kits/news-kit.png', fit: fit),
        Image.asset('assets/images/kits/games-kit.png', fit: fit),
      ],
    );
  }
}
