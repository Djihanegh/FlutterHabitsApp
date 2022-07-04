import 'package:flutter/material.dart';

import '../../utils/color.dart';

class CustomFloatingButton extends StatelessWidget {
  const CustomFloatingButton(
      {Key? key, this.text, required this.onTap, this.padding})
      : super(key: key);
  final VoidCallback onTap;
  final String? text;
  final EdgeInsets? padding;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.all(24.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: CustomGradientDecoration(
              customBorderRadius: BorderRadius.circular(16)),
          height: 56,
          width: double.infinity,
          child: Center(
              child: Text(
            text ?? "Next",
            style: const TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
          )),
        ),
      ),
    );
  }
}
