import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  double _left = 0.0;
  double _top = 0.0;

  @override
  void initState() {
    Timer.periodic(const Duration(seconds: 2), (timer) {
      setState(() {
        _left = Random().nextDouble() * 300;
        _top = Random().nextDouble() * 300;
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
            const Row(
              children: [
                FlutterLogo(
                  size: 30,
                ),
                SizedBox(width: 5),
                Text(
                  'Flutter',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 30),
            const Row(
              children: [
                Expanded(
                  child: Text(
                    'Create better \ntogether. Whatever.',
                    style: TextStyle(fontSize: 24, height: 1.2),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              'Join the hero to zero app. Have be fun :)',
              style: TextStyle(fontSize: 12, color: Colors.grey[400]),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Stack(
                      children: [
                        AnimatedPositioned(
                          left: _left + _top,
                          top: _top + _left,
                          duration: const Duration(seconds: 1),
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            width: 60,
                            height: 60,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle, color: Colors.white),
                            child: Image.asset(
                              'assets/images/riverpod_logo.png',
                            ),
                          ),
                        ),
                        AnimatedPositioned(
                          left: _left,
                          top: _top,
                          duration: const Duration(seconds: 1),
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            width: 60,
                            height: 60,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle, color: Colors.amber),
                            child: const FlutterLogo(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(20, 20, 10, 20),
                    alignment: Alignment.center,
                    height: 50,
                    decoration: const BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(10, 20, 20, 20),
                    alignment: Alignment.center,
                    height: 50,
                    decoration: const BoxDecoration(
                        color: Colors.purple,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: const Text(
                      'Login',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
