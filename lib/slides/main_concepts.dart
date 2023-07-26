import 'package:flutter/widgets.dart';
import 'package:flutter_deck/flutter_deck.dart';

class MainConceptsSlide extends FlutterDeckSplitSlide {
  const MainConceptsSlide({super.key})
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/main-concepts',
            steps: 3,
            header: FlutterDeckHeaderConfiguration(title: 'Main concepts'),
          ),
        );

  @override
  Widget left(BuildContext context) {
    return FlutterDeckBulletList(
      useSteps: true,
      items: const [
        'Everything* is a widget',
        'Aggressive composability',
        'Reactive, pseudo-declarative UI',
      ],
    );
  }

  @override
  Widget right(BuildContext context) {
    return Image.asset('assets/images/reactive-ui.gif', fit: BoxFit.contain);
  }

  @override
  Color get rightBackgroundColor => const Color(0xFFFFFFFF);
}
