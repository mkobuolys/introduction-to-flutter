import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_deck/flutter_deck.dart';

class RealtorSuccessStorySlide extends FlutterDeckSlideWidget {
  const RealtorSuccessStorySlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/realtor-success-story',
            steps: 4,
            header: FlutterDeckHeaderConfiguration(
              title: 'Scaling mobile development at realtor.com with Flutter',
            ),
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.blank(builder: (context) => const _Content());
  }
}

const _imagePaths = [
  'assets/images/realtor/realtor-cash-rewards.gif',
  'assets/images/realtor/realtor-schedule.jpeg',
  'assets/images/realtor/realtor-chat.png',
  'assets/images/realtor/realtor-details.gif',
];

class _Content extends StatefulWidget {
  const _Content();

  @override
  State<_Content> createState() => _ContentState();
}

class _ContentState extends State<_Content> {
  late final CardSwiperController _controller;

  @override
  void initState() {
    super.initState();

    _controller = CardSwiperController();
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FlutterDeckSlideStepsListener(
      listener: (_, __) => _controller.swipeRight(),
      child: Scaffold(
        body: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              final dimension = constraints.biggest.shortestSide;

              return Center(
                child: SizedBox.square(
                  dimension: dimension,
                  child: CardSwiper(
                    controller: _controller,
                    isDisabled: true,
                    isLoop: false,
                    cardBuilder: (context, index) => Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Image.asset(
                          _imagePaths[index],
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    cardsCount: _imagePaths.length,
                    backCardOffset: Offset(-dimension / 15, 0),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
