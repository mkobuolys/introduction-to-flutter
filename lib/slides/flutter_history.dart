import 'package:auto_size_text/auto_size_text.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_deck/flutter_deck.dart';

class FlutterHistorySlide extends FlutterDeckBlankSlide {
  const FlutterHistorySlide({super.key})
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/flutter-history',
            steps: 9,
          ),
        );

  @override
  Widget body(BuildContext context) => const _Content(showCameraCard: false);
}

const _spacing = 64.0;
final _historyItems = [
  (
    'assets/images/history/2015.jpeg',
    'Dart Developer Summit\nFlutter Beta - 2015'
  ),
  (
    'assets/images/history/2018-dec.jpeg',
    'Android & iOS support\nFlutter 1.0 - Dec, 2018'
  ),
  (
    'assets/images/history/2019-feb.png',
    'Dart DevTools\nFlutter 1.2 - Feb, 2019'
  ),
  (
    'assets/images/history/2021-mar.png',
    'Web support, desktop preview\nFlutter 2.0 - Mar, 2021'
  ),
  (
    'assets/images/history/2022-feb.jpeg',
    'Windows support\nFlutter 2.10 - Feb, 2022'
  ),
  (
    'assets/images/history/2022-may.png',
    'MacOS & Linux support\nFlutter 3.0 - May, 2022'
  ),
  (
    'assets/images/history/2023-feb.png',
    'Flutter Forward\nFlutter 3.7 - Feb, 2023'
  ),
  (
    'assets/images/history/2023-may.jpeg',
    'Dart 3 & rendering improvements\nFlutter 3.10 - May, 2023'
  ),
];

class _Content extends StatefulWidget {
  const _Content({
    required this.showCameraCard,
  });

  final bool showCameraCard;

  @override
  State<_Content> createState() => _ContentState();
}

class _ContentState extends State<_Content> {
  late final CardSwiperController _controller;

  CameraDescription? _camera;

  @override
  void initState() {
    super.initState();

    _controller = CardSwiperController();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!widget.showCameraCard) return;

      _loadCamera();
    });
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  Future<void> _loadCamera() async {
    final cameras = await availableCameras();

    if (cameras.isEmpty) return;

    final firstCamera = cameras.first;

    if (cameras.length == 1) {
      if (!mounted) return;

      return setState(() => _camera = firstCamera);
    }

    final faceTimeCamera =
        cameras.where((c) => c.name.contains('FaceTime')).firstOrNull;

    if (!mounted) return;

    setState(() => _camera = faceTimeCamera ?? firstCamera);
  }

  @override
  Widget build(BuildContext context) {
    return FlutterDeckSlideStepsListener(
      listener: (_, stepNumber) {
        if (stepNumber == 1) return;

        _controller.swipeRight();
      },
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(_spacing, _spacing, _spacing, 0),
            child: LayoutBuilder(
              builder: (context, constraints) {
                final height = constraints.biggest.shortestSide * 0.8;

                return Center(
                  child: _CardSwiper(
                    camera: _camera,
                    controller: _controller,
                    size: Size(height + 50, height),
                    showCameraCard: widget.showCameraCard,
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class _CardSwiper extends StatelessWidget {
  const _CardSwiper({
    required this.camera,
    required this.controller,
    required this.size,
    required this.showCameraCard,
  });

  final CameraDescription? camera;
  final CardSwiperController controller;
  final Size size;
  final bool showCameraCard;

  int get _cardsCount => _historyItems.length + (showCameraCard ? 1 : 0);

  void _restart() {
    for (var i = 0; i < _cardsCount; i++) {
      controller.undo();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        GestureDetector(
          onTap: () {
            _restart();
            context.flutterDeck.goToStep(1);
          },
          child: SizedBox.fromSize(
            size: size / 2,
            child: Image.asset('assets/images/restart.jpeg'),
          ),
        ),
        SizedBox.fromSize(
          size: size,
          child: CardSwiper(
            controller: controller,
            isDisabled: true,
            isLoop: false,
            cardBuilder: (BuildContext context, int index) {
              if (showCameraCard && index == _historyItems.length) {
                return _CameraCard(camera: camera);
              }

              final (imagePath, text) = _historyItems[index];

              return _HistoryCard(imagePath: imagePath, text: text);
            },
            cardsCount: _cardsCount,
            backCardOffset: Offset(-size.width / 15, 0),
            numberOfCardsDisplayed: _cardsCount,
            duration: const Duration(milliseconds: 300),
          ),
        ),
      ],
    );
  }
}

class _HistoryCardBase extends StatelessWidget {
  const _HistoryCardBase({
    required this.content,
    required this.text,
  });

  final Widget content;
  final String text;

  @override
  Widget build(BuildContext context) {
    const borderRadius = BorderRadius.all(Radius.circular(16));

    return Material(
      elevation: 8,
      color: Theme.of(context).colorScheme.secondary,
      borderRadius: borderRadius,
      child: ClipRRect(
        borderRadius: borderRadius,
        child: Column(
          children: [
            Expanded(flex: 2, child: content),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Center(
                  child: AutoSizeText(
                    text,
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(
                          color: Theme.of(context).colorScheme.onSecondary,
                          height: 1.4,
                        ),
                    textAlign: TextAlign.center,
                    maxLines: 3,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HistoryCard extends StatelessWidget {
  const _HistoryCard({
    required this.imagePath,
    required this.text,
  });

  final String imagePath;
  final String text;

  @override
  Widget build(BuildContext context) {
    return _HistoryCardBase(
      content: Image.asset(imagePath, fit: BoxFit.cover),
      text: text,
    );
  }
}

class _CameraCard extends StatefulWidget {
  const _CameraCard({
    required this.camera,
  });

  final CameraDescription? camera;

  @override
  State<_CameraCard> createState() => _CameraCardState();
}

class _CameraCardState extends State<_CameraCard> {
  CameraController? _controller;

  @override
  void initState() {
    super.initState();

    final camera = widget.camera;

    if (camera == null) return;

    _controller = CameraController(camera, ResolutionPreset.ultraHigh);
    _controller!.initialize().then((_) {
      if (!mounted) return;

      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _HistoryCardBase(
      content:
          widget.camera != null && (_controller?.value.isInitialized ?? false)
              ? CameraPreview(_controller!)
              : Center(
                  child: CircularProgressIndicator(
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
                ),
      text: 'Today',
    );
  }
}
