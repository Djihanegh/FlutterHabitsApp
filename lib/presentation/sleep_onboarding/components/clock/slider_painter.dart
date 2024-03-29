import 'dart:developer' as devtools;
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pavlok_test/presentation/sleep_onboarding/components/clock/single_circular_slider.dart';

import '../../../../utils/color.dart';
import '../../../components/clock_widget/utils.dart' as u;
import 'utils.dart';
import 'dart:ui' as ui;

class SliderPainter extends CustomPainter {
  CircularSliderMode mode;
  double startAngle;
  double endAngle;
  double sweepAngle;
  Color selectionColor;
  Color handlerColor;
  double handlerOutterRadius;
  bool showRoundedCapInSelection;
  bool showHandlerOutter;
  double sliderStrokeWidth;
  final ui.Image nightImage;
  final ui.Image dayImage;

  Offset? initHandler;
  Offset? endHandler;
  Offset? center;
  double? radius;
  double currentAngle;

  SliderPainter(
      {required this.mode,
      required this.nightImage,
      required this.startAngle,
      required this.endAngle,
      required this.sweepAngle,
      //  required this.backgroundImage,
      required this.selectionColor,
      required this.handlerColor,
      required this.handlerOutterRadius,
      required this.dayImage,
      required this.showRoundedCapInSelection,
      required this.showHandlerOutter,
      required this.sliderStrokeWidth,
      required this.currentAngle});

  @override
  void paint(Canvas canvas, Size size) {
   ////

    center = Offset(size.width / 2, size.height / 2);
    radius = min(size.width / 2, size.height / 2) - sliderStrokeWidth;

     Paint progress = _getPaint(color: selectionColor, width: 30);

    canvas.drawArc(
        Rect.fromCircle(center: center!, radius: radius!),
        -pi / 2 + currentAngle,
        sweepAngle,
        false,
        progress); // STARTTTTTTTTTTTT

    Paint handler =
        _getPaint(color: AppColors.kPrimaryColor, style: PaintingStyle.fill);
    Paint handlerOutter = _getPaint(color: AppColors.kPrimaryColor, width: 6.0);

    ////  Paint handler2 = _getPaint(
    //    color: AppColors.kPrimaryColor.withOpacity(0.2),
    //     style: PaintingStyle.fill);
    //   Paint handlerOutter2 =
    //       _getPaint(color: AppColors.kPrimaryColor, width: 6.0);

    //  rgba(255, 255, 255, 0.2)

    // draw handlers
    if (mode == CircularSliderMode.doubleHandler) {
      initHandler = radiansToCoordinates(
          center!, -pi / 2 + currentAngle, radius!); // STARTTTTTTTT

      canvas.drawCircle(initHandler!, 9.0, handler);
      canvas.drawCircle(initHandler!, handlerOutterRadius, handlerOutter);

      //  canvas.drawCircle(initHandler!, 9.0, handler2);
      //  canvas.drawCircle(initHandler!, handlerOutterRadius, handlerOutter2);

     

      /*  canvas.drawImage(
          nightImage,
          //  getOffsetWithRadiusAndTheta(radius: radius!, theta: startAngle + sweepAngle),
          radiansToCoordinates(
              center!, (-pi / 2) - startAngle  , radius!),
          /* */
          // radiansToCoordinates(center!, -pi / 2.05 + startAngle, radius! + 12),
          Paint()
            ..color = Colors.white
            ..strokeWidth = 2.0
            ..strokeCap = StrokeCap.butt
            ..style = PaintingStyle.stroke);*/

      endHandler = radiansToCoordinates(center!, -pi / 2 + endAngle, radius!);
      //
      canvas.drawCircle(endHandler!, handlerOutterRadius, handlerOutter);

      canvas.drawCircle(endHandler!, 9.0, handler);

      var dotPaint = Paint()..color = Colors.white;

      // log("HELLOOOOOOOOOOOOOO");
      // log(startAngle.toString());
      // log(currentAngle.toString());

      // Offset handler2 = u.degreesToCoordinates(
      //     center!, -pi / 2 + currentAngle  , radius!); // START
      // canvas.drawCircle(initHandler!, 12, dotPaint);

      canvas.drawImage(
          dayImage,
          //   getOffsetWithRadiusAndTheta(radius: radius!, theta: (pi - (startAngle))),
          Offset(
              initHandler!.dx - 10,
              initHandler!.dy -
                  10), // radiansToCoordinates(center!, -pi / 2 + (endAngle), radius!),
          //    Offset(  initHandler!.dx  , initHandler!.dy - sweepAngle), // startAngle >= 0 && startAngle <= 1 ? radius! + 14 :
          Paint()
            ..color = Colors.white
            ..strokeWidth = 1.0
            ..strokeCap = StrokeCap.round
            ..style = PaintingStyle.fill);

      canvas.drawImage(
          nightImage,
          //   getOffsetWithRadiusAndTheta(radius: radius!, theta: (pi - (startAngle))),
          Offset(
              endHandler!.dx - 10,
              endHandler!.dy -
                  10), // radiansToCoordinates(center!, -pi / 2 + (endAngle), radius!),
          //    Offset(  initHandler!.dx  , initHandler!.dy - sweepAngle), // startAngle >= 0 && startAngle <= 1 ? radius! + 14 :
          Paint()
            ..color = Colors.white
            ..strokeWidth = 1.0
            ..strokeCap = StrokeCap.round
            ..style = PaintingStyle.fill);

      /* canvas.drawImage(
          nightImage,
          //   getOffsetWithRadiusAndTheta(radius: radius!, theta: (pi - (startAngle))),
          radiansToCoordinates(center!, -pi / 2 + startAngle, radius! + 2),
          //    Offset(  initHandler!.dx  , initHandler!.dy - sweepAngle), // startAngle >= 0 && startAngle <= 1 ? radius! + 14 :
          Paint()
            ..color = Colors.white
            ..strokeWidth = 2.0
            ..strokeCap = StrokeCap.butt
            ..style = PaintingStyle.stroke);*/
      //  _drawShadow(canvas);
      /*  canvas.drawImage(
          nightImage,
          radiansToCoordinates(center!, -pi / 2 + endAngle, radius! - 10),
          //radiansToCoordinates(center!, -pi / 1.9 + endAngle, radius! - 10),
          Paint()
            ..color = Colors.white
            ..strokeWidth = 2.0
            ..strokeCap = StrokeCap.butt
            ..style = PaintingStyle.stroke);*/
    }
    // canvas.restore();

    //endHandler = radiansToCoordinates(center!, -pi / 2 + endAngle, radius!);
    // canvas.drawCircle(endHandler!, 9.0, handler);
    if (showHandlerOutter) {
      //  canvas.drawCircle(endHandler!, handlerOutterRadius, handlerOutter);
    }
  }

  void _drawShadow(Canvas canvas) {
    final Path path = Path();
    path.addOval(Rect.fromCircle(
        center: radiansToCoordinates(
            center!, -pi / 2.02 + startAngle, radius! + 1.5),
        radius: 13.5));

    canvas.drawShadow(path, const Color(0xffFFFFFF).withOpacity(0.1), 3, true);

    path.addOval(Rect.fromCircle(
        center: radiansToCoordinates(center!, -pi / 1.96 + endAngle, radius!),
        radius: 13.5));

    canvas.drawShadow(path, const Color(0xffFFFFFF).withOpacity(0.5), 3, true);
  }

  Paint _getPaint(
          {required Color color, double? width, PaintingStyle? style}) =>
      Paint()
        ..color = color
        ..strokeCap =
            showRoundedCapInSelection ? StrokeCap.round : StrokeCap.butt
        ..style = style ?? PaintingStyle.stroke
        ..strokeWidth = width ?? sliderStrokeWidth;

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
