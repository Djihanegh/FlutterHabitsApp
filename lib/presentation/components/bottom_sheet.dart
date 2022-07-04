import 'package:flutter/material.dart';

class BottomFloatingCard extends StatelessWidget {
  const BottomFloatingCard(
      {Key? key, required this.height, required this.child})
      : super(key: key);
  final double height;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15), topRight: Radius.circular(15)),
        color: Colors.white,
      ),
      height: height,
      padding: const EdgeInsets.all(10),
      child: child,
    );
  }
}
