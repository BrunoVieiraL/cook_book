import 'dart:async';

import 'package:cook_book/views/home_page.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer(
        const Duration(seconds: 3),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => const HomePage())));
    return Scaffold(
      body: Container(
        color: Colors.purple,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
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
