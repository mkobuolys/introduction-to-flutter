import 'package:flutter/widgets.dart';
import 'package:flutter_deck/flutter_deck.dart';

import 'package:introduction_to_flutter/slides/slides.dart';

void main() {
  runApp(const FlutterDeckExample());
}

class FlutterDeckExample extends StatelessWidget {
  const FlutterDeckExample({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterDeckApp(
      configuration: const FlutterDeckConfiguration(
        footer: FlutterDeckFooterConfiguration(
          showSlideNumbers: true,
          showSocialHandle: true,
        ),
        transition: FlutterDeckTransition.fade(),
      ),
      slides: const [
        IntroSlide(),
        ImpostorSlide(),
        AgendaSlide(),
        AboutMeSlide(),
        WhatIsFlutterSlide(),
        FlutterHistorySlide(),
        ...flutterFoundationalPillarsSlides,
        FlutterAroundYouSlide(),
        LanguageSlide(),
        MainConceptsSlide(),
        FlutterTreesSlide(),
        ArchitectureSlide(),
        PlatformIntegrationSlide(),
        AddToAppSlide(),
        RealtorSuccessStorySlide(),
        FlutterForAndroidDevsSlide(),
        ThankYouSlide(),
      ],
      speakerInfo: const FlutterDeckSpeakerInfo(
        name: 'Mangirdas Kazlauskas',
        description: 'GDE for Flutter & Dart',
        socialHandle: '@mkobuolys',
        imagePath: 'assets/images/me/avatar.png',
      ),
    );
  }
}
