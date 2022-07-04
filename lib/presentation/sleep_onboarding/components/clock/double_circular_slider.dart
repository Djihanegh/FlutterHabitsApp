import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pavlok_test/presentation/sleep_onboarding/components/clock/single_circular_slider.dart';
import 'dart:ui' as ui;

import 'package:pavlok_test/presentation/sleep_onboarding/components/clock/utils.dart';

/// Returns a widget which displays a circle to be used as a slider.
///
/// Required arguments are init and end to set the initial selection.
/// onSelectionChange is a callback function which returns new values as the user
/// changes the interval.
/// The rest of the params are used to change the look and feel.
///
///     DoubleCircularSlider(5, 10, onSelectionChange: () => {});
class DoubleCircularSlider extends StatefulWidget {
  /// the selection will be values between 0..divisions; max value is 300
  final int divisions;

  /// the initial value in the selection
  final int? init;

  /// the end value in the selection
  final int? end;

  /// the number of primary sectors to be painted
  /// will be painted using selectionColor
  final int? primarySectors;

  /// the number of secondary sectors to be painted
  /// will be painted using baseColor
  final int? secondarySectors;

  /// an optional widget that would be mounted inside the circle
  final Widget? child;

  /// height of the canvas, default at 220
  final double? height;

  /// width of the canvas, default at 220
  final double? width;

  /// color of the base circle and sections
  final Color? baseColor;

  /// color of the selection
  final Color? selectionColor;

  /// color of the handlers
  final Color? handlerColor;

  /// callback function when init and end change
  /// (int init, int end) => void
  final SelectionChanged<int>? onSelectionChange;

  /// callback function when init and end finish
  /// (int init, int end) => void
  final SelectionChanged<int>? onSelectionEnd;

  /// outter radius for the handlers
  final double? handlerOutterRadius;

  /// if true an extra handler ring will be displayed in the handler
  final bool? showHandlerOutter;

  /// stroke width for the slider, defaults at 12.0
  final double? sliderStrokeWidth;

  /// if true, the onSelectionChange will also return the number of laps in the slider
  /// otherwise, everytime the user completes a full lap, the selection restarts from 0
  final bool? shouldCountLaps;

  final ui.Image nightImage;

          final ui.Image dayImage;


  DoubleCircularSlider(
    this.divisions,
    this.init,
    this.end, {
    this.height,
    this.width,
    this.child,
    this.primarySectors,
    this.secondarySectors,
    this.baseColor,
    this.selectionColor,
    this.handlerColor,
    this.onSelectionChange,
    this.onSelectionEnd,
    required this.nightImage,
    required this.dayImage,
    this.handlerOutterRadius,
    this.showHandlerOutter,
    this.sliderStrokeWidth,
    this.shouldCountLaps,
  })  : assert(init! >= 0 && init <= divisions,
            'init has to be > 0 and < divisions value'),
        assert(end! >= 0 && end <= divisions,
            'end has to be > 0 and < divisions value'),
        assert(divisions >= 0 && divisions <= 360,
            'divisions has to be > 0 and <= 360');

  @override
  _DoubleCircularSliderState createState() => _DoubleCircularSliderState();
}

class _DoubleCircularSliderState extends State<DoubleCircularSlider> {
  int? _init;
  int? _end;

  @override
  void initState() {
    super.initState();
    _init = widget.init;
    _end = widget.end;
  }

  Offset toPolar(Offset center, double radians, double radius) =>
      center + Offset.fromDirection(radians, radius);

  Offset _currentDragOffset = Offset.zero;

  double radius = 135;

  double currentAngle = 0;

  double startAngle = toRadian(90);

  double totalAngle = toRadian(360);

  @override
  Widget build(BuildContext context) {
    /*Size screenSize = MediaQuery.of(context).size;
    Size canvasSize = Size(screenSize.width, screenSize.width - 35);
    Offset center = canvasSize.center(Offset.zero);
    Offset knobPos = toPolar(
        center - Offset(widget.sliderStrokeWidth!, widget.sliderStrokeWidth!),
        currentAngle + startAngle,
        radius);*/
    return SizedBox(
      height: widget.height ?? 220,
      width: widget.width ?? 220,
      child: CircularSliderPaint(
        dayImage: widget.dayImage,
        nightImage: widget.nightImage,
        mode: CircularSliderMode.doubleHandler,
        init: _init!,
        end: _end!,
        divisions: widget.divisions,
        primarySectors: widget.primarySectors ?? 0,
        secondarySectors: widget.secondarySectors ?? 0,
        child: widget.child!,
        onSelectionChange: (newInit, newEnd, laps) {
          if (widget.onSelectionChange != null) {
            widget.onSelectionChange!(newInit, newEnd, laps);
          }
          setState(() {
            _init = newInit;
            _end = newEnd;
          });
        },
        onSelectionEnd: (newInit, newEnd, laps) {
          if (widget.onSelectionEnd != null) {
            widget.onSelectionEnd!(newInit, newEnd, laps);
          }
        },
        sliderStrokeWidth: widget.sliderStrokeWidth ?? 12.0,
        baseColor: widget.baseColor ?? Color.fromRGBO(255, 255, 255, 0.1),
        selectionColor:
            widget.selectionColor ?? Color.fromRGBO(255, 255, 255, 0.3),
        handlerColor: widget.handlerColor ?? Colors.white,
        handlerOutterRadius: widget.handlerOutterRadius ?? 12.0,
        showRoundedCapInSelection: false,
        showHandlerOutter: widget.showHandlerOutter ?? true,
        shouldCountLaps: widget.shouldCountLaps ?? false,
      ),
    );
  }
}
