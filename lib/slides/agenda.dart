import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

class AgendaSlide extends FlutterDeckSplitSlide {
  const AgendaSlide({super.key})
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/agenda',
            header: FlutterDeckHeaderConfiguration(title: 'Agenda'),
          ),
        );

  @override
  Widget left(BuildContext context) {
    return FlutterDeckBulletList(items: const ['Flutter']);
  }

  @override
  Widget right(BuildContext context) {
    return FractionallySizedBox(
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
    );
  }
}
