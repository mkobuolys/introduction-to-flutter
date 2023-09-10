import 'package:flutter/widgets.dart';
import 'package:flutter_deck/flutter_deck.dart';

class MainConceptsSlide extends FlutterDeckSlideWidget {
  const MainConceptsSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/main-concepts',
            steps: 3,
            header: FlutterDeckHeaderConfiguration(title: 'Main concepts'),
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.split(
      theme: FlutterDeckTheme.of(context).copyWith(
        splitSlideTheme: const FlutterDeckSplitSlideThemeData(
          rightBackgroundColor: Color(0xFFFFFFFF),
        ),
      ),
      leftBuilder: (context) => FlutterDeckBulletList(
        useSteps: true,
        items: const [
          'Everything* is a widget',
          'Aggressive composability',
          'Reactive, pseudo-declarative UI',
        ],
      ),
      rightBuilder: (context) => Image.asset(
        'assets/images/reactive-ui.gif',
        fit: BoxFit.contain,
      ),
    );
  }
}
