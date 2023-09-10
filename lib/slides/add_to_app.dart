import 'package:flutter/widgets.dart';
import 'package:flutter_deck/flutter_deck.dart';

class AddToAppSlide extends FlutterDeckSlideWidget {
  const AddToAppSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/add-to-app',
            steps: 2,
            header: FlutterDeckHeaderConfiguration(title: 'Add-to-app'),
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.split(
      leftBuilder: (context) => FlutterDeckBulletList(
        useSteps: true,
        items: const [
          'Use Flutter in existing apps',
          'Step-by-step migration to Flutter 😉',
        ],
      ),
      rightBuilder: (context) => Image.asset(
        'assets/images/add-to-app.gif',
        fit: BoxFit.contain,
      ),
    );
  }
}
