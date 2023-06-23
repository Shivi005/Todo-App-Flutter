import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final String hintText;
  final int maxLine;
  final TextEditingController textController;
  const TextFieldWidget(
      {super.key,
      required this.hintText,
      required this.maxLine,
      required this.textController});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          letterSpacing: 1,
        ),
        autofocus: true,
        controller: textController,
        decoration: InputDecoration(
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            hintText: hintText),
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.next,
        maxLines: maxLine,
      ),
    );
  }
}
