import 'package:flutter/widgets.dart';
import 'package:flutter_deck/flutter_deck.dart';

class LanguageSlide extends FlutterDeckSplitSlide {
  const LanguageSlide({super.key})
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/dart',
            steps: 4,
            header: FlutterDeckHeaderConfiguration(title: 'Dart'),
          ),
        );

  @override
  Widget left(BuildContext context) {
    return FlutterDeckBulletList(
      useSteps: true,
      items: const [
        'Optimized for UI',
        'JIT and AOT compilation',
        'Sound null safety',
        'Full-stack! 🤘',
      ],
    );
  }

  @override
  Widget right(BuildContext context) {
    return Image.asset('assets/images/dart-meme.gif', fit: BoxFit.contain);
  }

  @override
  Color get rightBackgroundColor => const Color(0xFFFFFFFF);
}
