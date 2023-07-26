import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:introduction_to_flutter/widgets/widgets.dart';

class FlutterAroundYouSlide extends FlutterDeckSplitSlide {
  const FlutterAroundYouSlide({super.key})
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/flutter-around-you',
            steps: 3,
            header: FlutterDeckHeaderConfiguration(title: 'Flutter around you'),
          ),
        );

  @override
  Widget left(BuildContext context) {
    return FlutterDeckBulletList(
      useSteps: true,
      items: const [
        '5,000,000+ Flutter developers since v1.0',
        '700,000+ Flutter apps published to date',
        "World's largest companies say YES to Flutter!",
      ],
    );
  }

  @override
  Widget right(BuildContext context) {
    return const AutoSwipeCarousel(
      duration: Duration(seconds: 5),
      cardColor: Colors.white,
      children: [
        _CaseStudy(
          imagePath: 'assets/images/case-studies/google-pay.png',
          title: 'Google Pay',
        ),
        _CaseStudy(
          imagePath: 'assets/images/case-studies/ca-24.png',
          title: 'Crédit Agricole',
        ),
        _CaseStudy(
          imagePath: 'assets/images/case-studies/burger-king.png',
          title: 'Burger King',
        ),
        _CaseStudy(
          imagePath: 'assets/images/case-studies/bmw.png',
          title: 'BMW',
        ),
        _CaseStudy(
          imagePath: 'assets/images/case-studies/betterment.png',
          title: 'Betterment',
        ),
        _CaseStudy(
          imagePath: 'assets/images/case-studies/philips.png',
          title: 'Philips',
        ),
        _CaseStudy(
          imagePath: 'assets/images/case-studies/reflectly.png',
          title: 'Reflectly',
        ),
      ],
    );
  }
}

class _CaseStudy extends StatelessWidget {
  const _CaseStudy({
    required this.imagePath,
    required this.title,
  });

  final String imagePath;
  final String title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Expanded(
            child: Image.asset(imagePath, fit: BoxFit.contain),
          ),
          const SizedBox(height: 16),
          Text(
            title,
            style: theme.textTheme.displayMedium?.copyWith(
              color: theme.colorScheme.background,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
