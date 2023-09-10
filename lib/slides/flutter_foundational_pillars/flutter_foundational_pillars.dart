import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:introduction_to_flutter/slides/flutter_foundational_pillars/beautiful.dart';
import 'package:introduction_to_flutter/slides/flutter_foundational_pillars/fast.dart';
import 'package:introduction_to_flutter/slides/flutter_foundational_pillars/open.dart';
import 'package:introduction_to_flutter/slides/flutter_foundational_pillars/portable.dart';
import 'package:introduction_to_flutter/slides/flutter_foundational_pillars/productive.dart';

const flutterFoundationalPillarsSlides = [
  FlutterFoundationalPillars(),
  FastSlide(),
  ProductiveSlide(),
  BeautifulSlide(),
  OpenSlide(),
  PortableSlide(),
];

class FlutterFoundationalPillars extends FlutterDeckSlideWidget {
  const FlutterFoundationalPillars()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/flutter-foundational-pillars',
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.image(
      imageBuilder: (context) => Image.asset(
        'assets/images/flutter-pillars.png',
        fit: BoxFit.contain,
      ),
    );
  }
}
