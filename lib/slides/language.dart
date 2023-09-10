import 'package:flutter/widgets.dart';
import 'package:flutter_deck/flutter_deck.dart';

class LanguageSlide extends FlutterDeckSlideWidget {
  const LanguageSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/dart',
            steps: 4,
            header: FlutterDeckHeaderConfiguration(title: 'Dart'),
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
          'Optimized for UI',
          'JIT and AOT compilation',
          'Sound null safety',
          'Full-stack! 🤘',
        ],
      ),
      rightBuilder: (context) => Image.asset(
        'assets/images/dart-meme.gif',
        fit: BoxFit.contain,
      ),
    );
  }
}
