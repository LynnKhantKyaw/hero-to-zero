import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:hero_to_zero/assets_class.dart';
import 'package:hero_to_zero/shared/raised_button.dart';
import 'package:hero_to_zero/shared/utils.dart';
import 'package:hero_to_zero/src/auth/presentation/widget/animate_circle_image.dart';

class InitalPage extends StatefulWidget {
  const InitalPage({super.key});

  @override
  State<InitalPage> createState() => _InitalPageState();
}

class _InitalPageState extends State<InitalPage> {
  double _dartLeft = 200.0;
  double _dartTop = 200.0;

  double _flutterLeft = 100.0;
  double _flutterTop = 100.0;

  double _riverPodLeft = 100.0;
  double _riverPodTop = 300.0;

  double _hiveLeft = 300.0;
  double _hiveTop = 300.0;

  double _riveLeft = 300.0;
  double _riveTop = 100.0;

  @override
  void initState() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _dartLeft = Random().nextInt(200).toDouble();
        _dartTop = Random().nextInt(500).toDouble();

        _flutterLeft = Random().nextInt(300).toDouble();
        _flutterTop = Random().nextInt(300).toDouble();

        _riverPodLeft = Random().nextInt(300).toDouble();
        _riverPodTop = Random().nextInt(800).toDouble();

        _hiveLeft = Random().nextInt(600).toDouble();
        _hiveTop = Random().nextInt(800).toDouble();

        _riveLeft = Random().nextInt(500).toDouble();
        _riveTop = Random().nextInt(800).toDouble();
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const FlutterLogo(
                  size: 30,
                ).animate().fadeIn(duration: duration),
                const SizedBox(width: 5),
                const Text(
                  'Flutter',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ).animate().fadeIn(duration: duration),
              ],
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                Expanded(
                  child: const Text(
                    'Create better \ntogether. Whatever.',
                    style: TextStyle(fontSize: 24, height: 1.2),
                  ).animate().slideX(duration: duration),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              'Join the hero to zero app. Have be fun :)',
              style: TextStyle(fontSize: 12, color: Colors.grey[400]),
            ).animate().slideX(duration: duration, begin: 1),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        AnimateCircleImage(
                          image: ImageString.dartLogo,
                          size: 100,
                          left: _dartLeft,
                          top: _dartTop,
                        ),
                        AnimateCircleImage(
                          image: ImageString.flutterLogo,
                          size: 80,
                          left: _flutterLeft,
                          top: _flutterTop,
                        ),
                        AnimateCircleImage(
                          image: ImageString.riverPodLogo,
                          size: 80,
                          left: _riverPodLeft,
                          top: _riverPodTop,
                        ),
                        AnimateCircleImage(
                          image: ImageString.hiveLogo,
                          size: 60,
                          left: _hiveLeft,
                          top: _hiveTop,
                        ),
                        AnimateCircleImage(
                          image: ImageString.riveLogo,
                          size: 60,
                          left: _riveLeft,
                          top: _riveTop,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    child: RaisedButton(
                      label: 'Sign Up',
                      onPressed: () {},
                    ).animate().slideX(duration: duration),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: RaisedButton(
                      label: 'Login',
                      onPressed: () {
                        GoRouter.of(context).pushNamed('login');
                      },
                    ).animate().slideX(begin: 1, duration: duration),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
