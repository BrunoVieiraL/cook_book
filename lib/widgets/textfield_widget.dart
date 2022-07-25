import 'package:flutter/material.dart';

class TextFieldCustomWidget extends StatelessWidget {
  const TextFieldCustomWidget({
    Key? key,
    required this.controller,
    this.hintText,
    required this.textInputAction,
    required this.maxLines,
  }) : super(key: key);

  final TextEditingController controller;
  final String? hintText;
  final TextInputAction textInputAction;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      textInputAction: textInputAction,
      maxLines: maxLines,
      decoration: InputDecoration(
        label: Center(
          child: Text(hintText as String),
        ),
        labelStyle: const TextStyle(
          fontSize: 20,
        ),
      ),
    );
  }
}
