import 'package:flutter/material.dart';

class CustomTabIndicator extends Decoration {
  final BoxPainter _painter;
  CustomTabIndicator({
    required this.indicatorColor,
    required this.borderRadius,
  }) : _painter = CustomTabIndicatorPainter(
          indicatorColor: indicatorColor,
          borderRadius: borderRadius,
        );

  final Color indicatorColor;
  final Radius borderRadius;

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) => _painter;
}

class CustomTabIndicatorPainter extends BoxPainter {
  final Paint _paint;
  final Radius borderRadius;
  final Color indicatorColor;

  CustomTabIndicatorPainter({
    this.borderRadius = Radius.zero,
    required this.indicatorColor,
  }) : _paint = Paint()
          ..color = indicatorColor
          ..strokeWidth = 2;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    // pain a horizonal rectangle that has height of 10 and width of the tab bar
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(
            offset.dx + 10, configuration.size!.height - 10, configuration.size!.width - 10, 5),
        borderRadius,
      ),
      _paint,
    );
  }
}
