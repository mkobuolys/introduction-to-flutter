import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:rive/rive.dart';

const _backgroundColor = Color(0xffd6e2ea);

class BeautifulSlide extends FlutterDeckSlideWidget {
  const BeautifulSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/beautiful',
            steps: 3,
            header: FlutterDeckHeaderConfiguration(title: 'Beautiful'),
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.split(
      theme: FlutterDeckTheme.of(context).copyWith(
        splitSlideTheme: const FlutterDeckSplitSlideThemeData(
          rightBackgroundColor: _backgroundColor,
        ),
      ),
      leftBuilder: (context) => FlutterDeckBulletList(
        useSteps: true,
        items: const [
          'Control every pixel on the screen',
          'Consistent look and feel across platforms',
          'Motion creates emotion',
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
  late SMITrigger _successTrigger;
  late SMITrigger _failTrigger;
  late SMIBool _isHandsUp;
  late SMIBool _isChecking;
  late SMINumber _numLook;

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    _focusNode.addListener(_onPasswordFieldFocus);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onPasswordFieldFocus);

    super.dispose();
  }

  void _onRiveInit(Artboard artboard) {
    final controller = StateMachineController.fromArtboard(
      artboard,
      'Login Machine',
    );
    artboard.addController(controller!);

    _successTrigger = controller.findSMI<SMITrigger>('trigSuccess')!;
    _failTrigger = controller.findSMI<SMITrigger>('trigFail')!;
    _isHandsUp = controller.findSMI<SMIBool>('isHandsUp')!;
    _isChecking = controller.findSMI<SMIBool>('isChecking')!;
    _numLook = controller.findSMI<SMINumber>('numLook')!;
  }

  void _onPasswordFieldFocus() =>
      _focusNode.hasFocus ? _handsOnTheEyes() : _idle();

  void _handsOnTheEyes() => _isHandsUp.change(true);

  void _idle() {
    _isChecking.change(false);
    _isHandsUp.change(false);
  }

  void _lookOnTheTextField() {
    _isHandsUp.change(false);
    _isChecking.change(true);
    _numLook.change(0);
  }

  void _moveEyeBalls(String val) => _numLook.change(val.length.toDouble());

  void _login() {
    _emailController.text == 'admin' && _passwordController.text == 'admin'
        ? _successTrigger.fire()
        : _failTrigger.fire();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 400,
          height: 300,
          child: RiveAnimation.asset(
            'assets/rive/teddy.riv',
            onInit: _onRiveInit,
          ),
        ),
        Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                TextField(
                  controller: _emailController,
                  onTap: _lookOnTheTextField,
                  onChanged: _moveEyeBalls,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    hintText: 'Email/Username',
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _passwordController,
                  onTap: _handsOnTheEyes,
                  onTapOutside: (_) => _idle(),
                  focusNode: _focusNode,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: 'Password',
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: _login,
                  child: const Text('Login'),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
