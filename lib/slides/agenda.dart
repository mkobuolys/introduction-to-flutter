import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

class AgendaSlide extends FlutterDeckSlideWidget {
  const AgendaSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/agenda',
            header: FlutterDeckHeaderConfiguration(title: 'Agenda'),
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.split(
      leftBuilder: (context) => FlutterDeckBulletList(items: const ['Flutter']),
      rightBuilder: (context) => FractionallySizedBox(
        heightFactor: 0.8,
        widthFactor: 0.8,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.all(32),
          child: const FlutterLogo(),
        ),
      ),
    );
  }
}
