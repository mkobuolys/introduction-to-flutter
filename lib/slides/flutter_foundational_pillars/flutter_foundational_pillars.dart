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

class FlutterFoundationalPillars extends FlutterDeckImageSlide {
  const FlutterFoundationalPillars({super.key})
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/flutter-foundational-pillars',
          ),
        );

  @override
  Image get image => Image.asset(
        'assets/images/flutter-pillars.png',
        fit: BoxFit.contain,
      );
}
