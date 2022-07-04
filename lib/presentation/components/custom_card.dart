import 'package:flutter/material.dart';

import '../../utils/color.dart';

class CustomCard extends StatelessWidget {
  final bool isSelected;
  final VoidCallback onTap;
  final Widget child;
  final double? height;
  final EdgeInsets? padding;
  const CustomCard({
    Key? key,
    required this.onTap,
    required this.child,
    this.isSelected = false,
    this.height,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(
            milliseconds: 200,
          ),
          curve: Curves.easeOut,
          height: height ?? 72,
          padding: padding ?? const EdgeInsets.all(8),
          margin: const EdgeInsets.symmetric(vertical: 6),
          decoration: BoxDecoration(
            color: isSelected ? Color(0xFFF8F3FF) : Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color:
                  isSelected ? AppColors.kPrimaryDarkColor : Colors.transparent,
              width: 1.5,
            ),
            boxShadow: const [
              BoxShadow(
                color: Color(0x18274B12),
                blurRadius: 40,
                spreadRadius: -4,
                offset: Offset(0, 14),
              )
            ],
          ),
          child: child,
        ));
  }
}
