import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/themes_provider.dart';

class CardSocialWidget extends StatelessWidget {
  final String text;
  final String iconPath;
  final Function urlPath;
  const CardSocialWidget({
    Key? key,
    required this.text,
    required this.iconPath,
    required this.urlPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final provider = Provider.of<ThemeProvider>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        children: [
          Image.asset(
            iconPath,
            scale: 13,
            color: provider.isDark == true
                ? Colors.black
                : const Color(0xFF7F52C7),
          ),
          SizedBox(
            width: height * 0.03,
          ),
          GestureDetector(
            onTap: () {
              urlPath();
            },
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xFFD9D9D9),
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
              height: height * 0.05,
              width: width * 0.80,
              child: Align(
                alignment: Alignment.center,
                child: Baseline(
                  baseline: 16,
                  baselineType: TextBaseline.alphabetic,
                  child: RichText(
                    text: TextSpan(
                      text: text,
                      style: TextStyle(
                        color: provider.isDark == true
                            ? Colors.black
                            : const Color(0xFF7F52C7),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
