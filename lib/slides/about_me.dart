import 'package:flutter/widgets.dart';
import 'package:flutter_deck/flutter_deck.dart';

class AboutMeSlide extends FlutterDeckSplitSlide {
  const AboutMeSlide({super.key})
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/about-me',
            steps: 5,
            header: FlutterDeckHeaderConfiguration(title: 'About me'),
          ),
        );

  @override
  Widget left(BuildContext context) {
    return FlutterDeckBulletList(
      useSteps: true,
      items: const [
        'Software Engineer from Lithuania 🇱🇹',
        'Mobile Tech Lead @ Billo 🚀',
        'Google Developer Expert for Flutter & Dart 💙',
        'Organiser @ Flutter Vilnius 🎉',
        'Your go-to Flutter meme person 🫡',
      ],
    );
  }

  @override
  Widget right(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.8,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        child: Image.asset('assets/images/me/me.jpg', fit: BoxFit.cover),
      ),
    );
  }
}
