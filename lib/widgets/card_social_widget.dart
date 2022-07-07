import 'package:flutter/material.dart';

class CardSocialWidget extends StatelessWidget {
  final String text;
  final String iconPath;
  const CardSocialWidget({
    Key? key,
    required this.text,
    required this.iconPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        children: [
          Container(
            color: Colors.grey.shade300,
            height: 32,
            width: 300,
            child: Row(
              children: [
                Image.asset(iconPath),
                const SizedBox(
                  width: 5,
                ),
                Text(text),
              ],
            ),
          )
        ],
      ),
    );
  }
}
