import 'dart:ui' as ui;

import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

class FastSlide extends FlutterDeckSlideWidget {
  const FastSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/fast',
            steps: 3,
            header: FlutterDeckHeaderConfiguration(title: 'Fast'),
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.split(
      leftBuilder: (context) => FlutterDeckBulletList(
        useSteps: true,
        items: const [
          'Aims for at least 60 FPS',
          'Compiles to native code',
          'Uses its own rendering engine',
        ],
      ),
      rightBuilder: (context) => const _ContentRight(),
    );
  }
}

class _ContentRight extends StatefulWidget {
  const _ContentRight();

  @override
  State<_ContentRight> createState() => _ContentRightState();
}

class _ContentRightState extends State<_ContentRight> {
  final _focusNode = FocusNode();
  final game = _Water();

  @override
  void dispose() {
    game.dispose();
    _focusNode.dispose();

    super.dispose();
  }

  void _onChanged(double value) => setState(() => game.seaHeight = value);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _focusNode.requestFocus,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        child: Material(
          child: Column(
            children: [
              Expanded(child: GameWidget(autofocus: false, game: game)),
              Slider(
                focusNode: _focusNode,
                value: game.seaHeight,
                onChanged: _onChanged,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Water extends Game {
  late final devicePixelRatio = MediaQuery.of(buildContext!).devicePixelRatio;

  late final ui.FragmentProgram _program;
  late final ui.FragmentShader shader;

  var _time = 0.0;

  double seaHeight = 0.3;

  void dispose() {
    shader.dispose();
  }

  @override
  Future<void>? onLoad() async {
    _program = await ui.FragmentProgram.fromAsset('shaders/water.glsl');
    shader = _program.fragmentShader();
  }

  @override
  void render(ui.Canvas canvas) {
    shader
      ..setFloat(0, size.x)
      ..setFloat(1, size.y)
      ..setFloat(2, _time)
      ..setFloat(3, seaHeight.clamp(0, 1));

    canvas
      ..translate(size.x, size.y)
      ..rotate(180 * degrees2Radians)
      ..drawRect(
        Offset.zero & size.toSize(),
        Paint()..shader = shader,
      );
  }

  @override
  void update(double dt) => _time += dt;
}
