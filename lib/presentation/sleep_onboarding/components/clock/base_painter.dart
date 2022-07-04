import 'dart:math';
import 'dart:developer' as devtools;

import 'package:flutter/material.dart';
import 'package:pavlok_test/utils/app_style.dart';
import 'package:pavlok_test/utils/color.dart';
import 'package:pavlok_test/utils/size_config.dart';

import '../../../../utils/app_style.dart';
import '../../../../utils/constants.dart';
import 'utils.dart';
import 'dart:ui' as ui;

class BasePainter extends CustomPainter {
  Color baseColor;
  Color selectionColor;
  int primarySectors;
  int secondarySectors;
  double sliderStrokeWidth;

  Offset? center;
  double? radius;

  Offset? sectorCenter;
  double? sectorRadius;
  final ui.Image nightImage;

  BasePainter({
    required this.baseColor,
    required this.selectionColor,
    required this.primarySectors,
    required this.secondarySectors,
    required this.sliderStrokeWidth,
    required this.nightImage,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // _getPaint(color: baseColor, width: 30);

    center = Offset(size.width / 2, size.height / 2);
    radius = min(size.width / 2, size.height / 2) - sliderStrokeWidth;

    Paint base = Paint()
      /*  ..shader = ui.Gradient.radial(
        Offset(center!.dx + 10, center!.dy + 10),
        radius! - 50,

        //
        //Offset(center!.dx - 10, center!.dy- 10),
        // Offset(center!, - radius!),
        //  Offset(0, radius!),
        [
          Colors.white,
          Colors.white
          //Color.fromRGBO(131, 56, 236, 0.21),
        ],
      )*/
      ..color = baseColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 30;
    sectorCenter = Offset(size.width / 2, size.height / 2);
    sectorRadius = min(size.width / 2.6, size.height / 2.6);

    /*paintImage(
      canvas: canvas,
      rect: Rect.fromLTWH(20, 20, nightImage.image.width / nightImage.scale,
          nightImage.image.height / nightImage.scale),
      image: nightImage.image, // <- the loaded image
      filterQuality: FilterQuality.low,
    );*/

    // we need this in the parent to calculate if the user clicks on the circumference

    assert(radius! > 0);

    // canvas.save();
    //
Path oval = Path()
      ..addOval(Rect.fromCircle(center: center!, radius: radius! - 0));
    Paint shadowPaint = Paint()
      ..color = Colors.black.withOpacity(0.3)
      ..maskFilter = MaskFilter.blur(BlurStyle.inner, 50);
    canvas.drawPath(oval, shadowPaint);
    _drawBaseCircle(canvas);
 
    canvas.drawCircle(center!, radius!, base);

   

    canvas.translate(sectorRadius! + 30, sectorRadius! + 30);

    if (primarySectors > 0) {
      _paintSectors(primarySectors, 8.0, Colors.black, canvas);
    }

    if (secondarySectors > 0) {
      _paintSectors(secondarySectors, 5.0, const Color(0xFFE9E9E9), canvas);
    }
  }

  void _drawBaseCircle(Canvas canvas) {
    final Paint _paint = Paint()
      ..shader = ui.Gradient.radial(
        Offset(center!.dx, center!.dy),
        radius! + 800, // Color.fromRGBO(131, 56, 236, 0.21)
        //Offset(center!.dx - 10, center!.dy- 10),
        // Offset(center!, - radius!),
        //  Offset(0, radius!),
        [Colors.white, Colors.white],
      )
      ..style = PaintingStyle.fill;
    // _drawShadow(canvas);
    canvas.drawCircle(center!, radius!, _paint);
  }

  void _drawShadow(Canvas canvas) {
    final Path path = Path();

    path.addOval(Rect.fromCircle(center: center!, radius: radius!));
    Paint shadowPaint = Paint()
      ..color = Color.fromRGBO(131, 56, 236, 0.21)
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, 20);

    canvas.drawPath(path, shadowPaint);
  }

  void _paintSectors(
      int sectors, double radiusPadding, Color color, Canvas canvas) {
    Paint section = _getPaint(color: color, width: 2.0);

    var endSectors = getSectionsCoordinatesInCircle(
        sectorCenter!, sectorRadius! + radiusPadding, sectors);
    var initSectors = getSectionsCoordinatesInCircle(
        sectorCenter!, sectorRadius! - radiusPadding, sectors);
    _paintLines(canvas, initSectors, endSectors, section);
  }

  double _getInnerPointRadiusOfMinuteLine(int minute) {
    return 60 -
        ((minute % 15 == 0)
            ? 2
            : (minute % 5 == 0)
                ? 1 // Div5
                : 2); //minuteLineLength);
  }

  void _drawHourText(
      {required Canvas canvas,
      required int minute,
      required double theta,
      required String type}) {
    const double fontSize = 12.0;
    TextSpan span = TextSpan(
        style: TextStyles.semiBold.copyWith(
            color: AppColors.kSecondaryText,
            fontSize: getProportionateScreenWidth(12)),
        text: type == "am" && (minute == 30 || minute == 60)
            ? "${(minute ~/ 5).toString()} am"
            : type == "pm" && (minute == 30 || minute == 60)
                ? "${(minute ~/ 5).toString()} pm"
                : (minute ~/ 5).toString());
    TextPainter tp = TextPainter(
      text: span,
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );
    tp.layout();
    final Offset _pointToPositionText = getOffsetWithRadiusAndTheta(
        radius: _getInnerPointRadiusOfMinuteLine(minute) + 20, theta: theta);

    tp.paint(
        canvas,
        Offset(_pointToPositionText.dx - tp.width / 2,
            _pointToPositionText.dy - tp.height / 2));
  }

  void _drawMinutesLine(Canvas canvas) {
    final Paint _paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.square
      ..style = PaintingStyle.stroke;

    final Paint _paint2 = Paint()
      ..color = HexColor("#E9E9E9")
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.square
      ..style = PaintingStyle.stroke;
    for (int minute = 1; minute <= Constants.numberOfMinutes; minute++) {
      final double _theta = Constants.angleBetweenEachMinuteLine * minute;
      final double _radiusOfInnerPoint =
          _getInnerPointRadiusOfMinuteLine(minute);

      if (minute % 5 != 0) {
        final Offset _extremePoint =
            getOffsetWithRadiusAndTheta(radius: radius! - 20.0, theta: _theta);
        final Offset _innerPoint = getOffsetWithRadiusAndTheta(
            radius: _radiusOfInnerPoint + 35, theta: _theta);
        canvas.drawLine(_extremePoint, _innerPoint, _paint2);
      } else {
        final Offset _extremePoint =
            getOffsetWithRadiusAndTheta(radius: radius! - 20.0, theta: _theta);
        final Offset _innerPoint = getOffsetWithRadiusAndTheta(
            radius: _radiusOfInnerPoint + 37, theta: _theta);
        canvas.drawLine(_extremePoint, _innerPoint, _paint);
      }

      if (minute < 30) {
        if (minute * 2 % 5 == 0) {
          _drawHourText(
              minute: minute * 2, canvas: canvas, theta: _theta, type: "am");

          // canvas.drawLine(_extremePoint, _innerPoint, _paint);
        }
      }
      if (minute == 30) {
        if (minute * 2 % 5 == 0) {
          _drawHourText(
              minute: minute * 2, canvas: canvas, theta: _theta, type: "pm");
          //  canvas.drawLine(_extremePoint, _innerPoint, _paint);
        }
      }
      if (minute == 35) {
        _drawHourText(minute: 10, canvas: canvas, theta: _theta, type: "pm");
        //  canvas.drawLine(_extremePoint, _innerPoint, _paint);
      }

      if (minute == 40) {
        _drawHourText(minute: 20, canvas: canvas, theta: _theta, type: "pm");
        //     canvas.drawLine(_extremePoint, _innerPoint, _paint);
      }
      if (minute == 45) {
        _drawHourText(minute: 30, canvas: canvas, theta: _theta, type: "pm");
        //    canvas.drawLine(_extremePoint, _innerPoint, _paint);
      }

      if (minute == 50) {
        _drawHourText(minute: 40, canvas: canvas, theta: _theta, type: "pm");
        //    canvas.drawLine(_extremePoint, _innerPoint, _paint);
      }
      if (minute == 55) {
        _drawHourText(minute: 50, canvas: canvas, theta: _theta, type: "pm");
        //   canvas.drawLine(_extremePoint, _innerPoint, _paint);
      }
      if (minute == 60) {
        _drawHourText(minute: 60, canvas: canvas, theta: _theta, type: "am");
        //  canvas.drawLine(_extremePoint, _innerPoint, _paint);
      }
    }
  }

  void _paintLines(
      Canvas canvas, List<Offset> inits, List<Offset> ends, Paint section) {
    _drawMinutesLine(canvas);
  }

  Paint _getPaint(
          {required Color color, double? width, PaintingStyle? style}) =>
      Paint()
        ..color = color
        ..strokeCap = StrokeCap.round
        ..style = style ?? PaintingStyle.stroke
        ..strokeWidth = width ?? 3;

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
