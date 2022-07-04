import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:pavlok_test/utils/app_style.dart';
import 'package:pavlok_test/utils/color.dart';
import 'package:pavlok_test/utils/size_config.dart';
import 'dart:ui' as ui;
import '../sleep_onboarding/components/clock/double_circular_slider.dart';

class ClockWidget extends StatefulWidget {
  final ui.Image nightImage;
  final ui.Image dayImage;

  const ClockWidget(
      {Key? key, required this.nightImage, required this.dayImage})
      : super(key: key);
  @override
  _ClockWidgetState createState() => _ClockWidgetState();
}

class _ClockWidgetState extends State<ClockWidget> {
  int initTime = DateTime.now().hour;
  int endTime = DateTime.now().hour - 10;

  static int inBedTime = 0;
  int outBedTime = 0;
  String selectedTime = "";

  int previousInitValue = 0;
  int previousEndValue = 0;

  bool bedTime = false;
  int hours = 0;
  int minutes = 0;

  @override
  void initState() {
    super.initState();
    _shuffle();
  }

  void _shuffle() {
    setState(() {
      initTime = DateTime.now().hour;
      endTime = DateTime.now().hour - 10;
      inBedTime = initTime;
      outBedTime = endTime;
    });
  }

  void _updateLabels(int init, int end) {
    if (previousInitValue != init) {
      setState(() {
        inBedTime = init;

        _formatTime(inBedTime);

        previousInitValue = init;
      });
    } else if (previousEndValue != end) {
      setState(() {
        outBedTime = end;
        _formatTime(outBedTime);

        previousEndValue = end;
      });
    }

    setState(() {
      inBedTime = init;
      outBedTime = end;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const SizedBox(
          height: 20,
        ),
        Container(
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: AppColors.kPrimaryDarkColor.withOpacity(0.21),
                  blurRadius: 17,
                  spreadRadius: 0,
                  offset: Offset(0, 0),
                ),
              ],
            ),
            child: DoubleCircularSlider(
              288,
              initTime,
              endTime,
              height: 260.0,
              width: 260.0,
              primarySectors: 12,
              secondarySectors: 60,
              baseColor: HexColor("#F1F1F1"),
              selectionColor: AppColors.kPrimaryColor,
              handlerColor: Colors.black,
              handlerOutterRadius: 12.0,
              onSelectionChange: (int a, int b, int c) => _updateLabels(a, b),
              sliderStrokeWidth: 12.0,
              child: Padding(
                padding: const EdgeInsets.all(42.0),
                child: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AutoSizeText("${hours}hrs",
                        style: TextStyles.extraBold.copyWith(
                            color: AppColors.kPrimaryDarkColor,
                            fontSize: getProportionateScreenWidth(24))),
                    AutoSizeText("${minutes}min",
                        style: TextStyles.semiBold.copyWith(
                            color: Colors.black,
                            fontSize: getProportionateScreenWidth(20)))
                  ],
                )),
              ),
              nightImage: widget.nightImage,
              dayImage: widget.dayImage,
            )),
      ],
    );
  }

  String _formatTime(int time) {
    if (time == 0) {
      return '00:00';
    }
    hours = time ~/ 12;
    minutes = (time % 12) * 5;

    if (hours < 13) {
      bedTime = false;
    }
    if (hours == 13) {
      hours = 1;
      bedTime = true;
    } else if (hours == 14) {
      hours = 2;
      bedTime = true;
    } else if (hours == 15) {
      hours = 3;
      bedTime = true;
    } else if (hours == 16) {
      hours = 4;
      bedTime = true;
    } else if (hours == 17) {
      hours = 5;
      bedTime = true;
    } else if (hours == 18) {
      hours = 6;
      bedTime = true;
    } else if (hours == 19) {
      hours = 7;
      bedTime = true;
    } else if (hours == 20) {
      hours = 8;
      bedTime = true;
    } else if (hours == 21) {
      hours = 9;
      bedTime = true;
    } else if (hours == 22) {
      hours = 10;
      bedTime = true;
    } else if (hours == 23) {
      hours = 11;
      bedTime = true;
    } else if (hours == 12) {
      hours = 12;
      bedTime = true;
    }
//    setState(() {
    selectedTime = '$hours:$minutes';
    //  });

    return '$hours:$minutes';
  }
}
