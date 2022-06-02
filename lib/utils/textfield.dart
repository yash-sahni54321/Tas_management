import 'package:flutter/material.dart';

import '../colors/app_colors.dart';

class TextFieldwidget extends StatelessWidget {
  final TextEditingController textController;
  final String hinttext;
  final double borderRadius;
  final int? maxLines;
  const TextFieldwidget(
      {Key? key,
      required this.textController,
      required this.hinttext,
      required this.borderRadius,
      this.maxLines = 1})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: maxLines,
      controller: textController,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.textHolder,
        hintText: hinttext,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: const BorderSide(
            color: Colors.white,
            width: 1,
          ),
        ),
      ),
    );
  }
}
