import 'package:flutter/material.dart';

class TextFieldCustomWidget extends StatelessWidget {
  const TextFieldCustomWidget({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.textInputAction,
  }) : super(key: key);

  final TextEditingController controller;
  final String hintText;
  final TextInputAction textInputAction;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(hintText: hintText),
      controller: controller,
      textInputAction: textInputAction,
    );
  }
}
