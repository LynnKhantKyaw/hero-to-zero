import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Login extends StatelessWidget {
  const Login({super.key});

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
              children: const [
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
            Row(
              children: const [
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
              child: Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    width: 60,
                    height: 60,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.amber),
                    child: const FlutterLogo(),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    width: 60,
                    height: 60,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.white),
                    child: SvgPicture.asset('assets/svgs/riverpod_logo.svg'),
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
