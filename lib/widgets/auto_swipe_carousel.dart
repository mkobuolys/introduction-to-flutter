import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

class AutoSwipeCarousel extends StatefulWidget {
  const AutoSwipeCarousel({
    required this.children,
    this.duration = const Duration(seconds: 10),
    this.cardColor,
    super.key,
  });

  final Color? cardColor;
  final Duration duration;
  final List<Widget> children;

  @override
  State<AutoSwipeCarousel> createState() => _AutoSwipeCarouselState();
}

class _AutoSwipeCarouselState extends State<AutoSwipeCarousel> {
  late final CardSwiperController _controller;
  late final Timer _timer;

  @override
  void initState() {
    super.initState();

    _controller = CardSwiperController();

    _timer = Timer.periodic(widget.duration, (_) => _onTick());
  }

  @override
  void dispose() {
    _timer.cancel();
    _controller.dispose();

    super.dispose();
  }

  void _onTick() {
    if (!mounted) return;

    _controller.swipeRight();
  }

  @override
  Widget build(BuildContext context) {
    final children = widget.children;
    final color = widget.cardColor ?? Theme.of(context).colorScheme.primary;

    return LayoutBuilder(
      builder: (context, constraints) {
        final height = constraints.biggest.shortestSide * 0.9;

        return Center(
          child: SizedBox(
            height: height,
            width: height,
            child: CardSwiper(
              controller: _controller,
              isDisabled: true,
              cardBuilder: (context, index) => Card(
                color: color,
                elevation: 0,
                child: children[index],
              ),
              cardsCount: children.length,
              backCardOffset: Offset.zero,
              duration: const Duration(milliseconds: 300),
            ),
          ),
        );
      },
    );
  }
}
