import 'package:flutter/widgets.dart';
import 'package:flutter_deck/flutter_deck.dart';

class AddToAppSlide extends FlutterDeckSplitSlide {
  const AddToAppSlide({super.key})
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/add-to-app',
            steps: 2,
            header: FlutterDeckHeaderConfiguration(title: 'Add-to-app'),
          ),
        );

  @override
  Widget left(BuildContext context) {
    return FlutterDeckBulletList(
      useSteps: true,
      items: const [
        'Use Flutter in existing apps',
        'Step-by-step migration to Flutter 😉',
      ],
    );
  }

  @override
  Widget right(BuildContext context) {
    return Image.asset('assets/images/add-to-app.gif', fit: BoxFit.contain);
  }
}
