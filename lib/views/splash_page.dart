import 'dart:async';

import 'package:cook_book/views/home_page.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(
        const Duration(seconds: 3),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => const HomePage())));
    return Scaffold(
      body: Container(
        color: const Color(0xFF7A1FA2),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(
              image: AssetImage('assets/icon.png'),
            ),
            Text(
              'Cook Book',
              style: TextStyle(fontSize: 30),
            ),
          ],
        ),
      ),
    );
  }
}
