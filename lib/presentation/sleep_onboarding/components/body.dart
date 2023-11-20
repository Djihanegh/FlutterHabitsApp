import 'dart:typed_data';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:pavlok_test/presentation/components/components_export.dart';
import 'package:pavlok_test/utils/utils_export.dart';
import 'package:pavlok_test/presentation/sleep_onboarding/export_sleep.dart';
import '../../../data/fake_data.dart';

import 'dart:ui' as ui;


class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  ImageInfo? myImageInfo;

  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _getImageInfo();
    });

    super.initState();
  }

  void _getImageInfo() async {
    getImageInfo(context);
  }

  ui.Image? _image;
  ui.Image? _imageDay;

  void getImageInfo(BuildContext context) async {
    ByteData bd = await rootBundle.load(AppAssets.night);

    final Uint8List bytes = Uint8List.view(bd.buffer);

    final ui.Codec codec = await ui.instantiateImageCodec(bytes);

    final ui.Image? image = (await codec.getNextFrame()).image;

    setState(() => _image = image);

    ByteData bd2 = await rootBundle.load(AppAssets.day);

    final Uint8List byte = Uint8List.view(bd2.buffer);

    final ui.Codec code = await ui.instantiateImageCodec(byte);

    final ui.Image? images = (await code.getNextFrame()).image;

    setState(() => _imageDay = images);
    //return completer.future;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
            padding: const EdgeInsets.all(14),
            child: SingleChildScrollView(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AutoSizeText(
                  "Set bedtime and wake up",
                  textAlign: TextAlign.center,
                  style: TextStyles.semiBold.copyWith(
                    color: Colors.black,
                    fontSize: 25,
                  ),
                ),
                if (_image != null)
                  ClockWidget(
                    nightImage: _image!,
                    dayImage: _imageDay!,
                  ),
                Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(AppAssets.union),
                        const SizedBox(
                          width: 5,
                        ),
                        TextWidget(),
                      ],
                    )),
                Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(AppAssets.bedTime),
                                const SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AutoSizeText(
                                      "BedTime",
                                      style: TextStyles.interSemiBold.copyWith(
                                          color: AppColors.kSecondaryText,
                                          fontSize: 12),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    AutoSizeText(
                                      "12:00 AM",
                                      style: TextStyles.interSemiBold.copyWith(
                                          color: Colors.black, fontSize: 18),
                                    ),
                                  ],
                                )
                              ],
                            )),
                        Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Row(children: [
                              Image.asset(AppAssets.wakeUpTime),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AutoSizeText(
                                    "Wake up",
                                    style: TextStyles.interSemiBold.copyWith(
                                        color: AppColors.kSecondaryText,
                                        fontSize: 12),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  //    TextWidget(),
                                  AutoSizeText(
                                    "12:00 AM",
                                    style: TextStyles.interSemiBold.copyWith(
                                        color: Colors.black, fontSize: 18),
                                  )
                                ],
                              )
                            ]))
                      ],
                    )),
                Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 20),
                    child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0xFFE5E5E5),
                              spreadRadius: 0.2,
                              blurRadius: 5,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                                padding: const EdgeInsets.all(10),
                                child: AutoSizeText("Repeat days",
                                    style: TextStyles.interSemiBold.copyWith(
                                        color: const Color(0xFF0D0E0F),
                                        fontSize: 16))),
                            SizedBox(
                                height: SizeConfig.screenHeight! / 15,
                                width: SizeConfig.screenWidth!,
                                child: ListView.builder(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: days.length,
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              days[index].isSelected
                                                  ? days[index].selectDay(false)
                                                  : days[index].selectDay(true);
                                            });
                                          },
                                          child: Container(
                                              // height: 30,
                                              width: SizeConfig.screenWidth! /
                                                  10.2,
                                              padding: const EdgeInsets.all(10),
                                              margin: const EdgeInsets.all(5),
                                              decoration: BoxDecoration(
                                                gradient: LinearGradient(
                                                  begin: Alignment.bottomCenter,
                                                  end: Alignment.topCenter,
                                                  colors: days[index].isSelected
                                                      ? [
                                                          AppColors
                                                              .kPrimaryColor,
                                                          AppColors
                                                              .kLinearColor,
                                                        ]
                                                      : [
                                                          AppColors.divierColor,
                                                          AppColors.divierColor
                                                        ],
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                                color: days[index].isSelected
                                                    ? AppColors.kPrimaryColor
                                                    : AppColors.divierColor,
                                                boxShadow: days[index]
                                                        .isSelected
                                                    ? const [
                                                        BoxShadow(
                                                          color:
                                                              Color(0xFFBDACFB),

                                                          spreadRadius: 0.5,
                                                          blurRadius: 10,
                                                          offset: Offset(0.0,
                                                              0.2), // changes position of shadow
                                                        ),
                                                      ]
                                                    : const [
                                                        BoxShadow(
                                                          color: Colors
                                                              .transparent,

                                                          spreadRadius: 0.5,
                                                          blurRadius: 15,
                                                          offset: Offset(0.0,
                                                              0.7), // changes position of shadow
                                                        ),
                                                      ],
                                              ),
                                              child: Center(
                                                  child: AutoSizeText(
                                                days[index].day,
                                                style: TextStyles.semiBold
                                                    .copyWith(
                                                  color: days[index].isSelected
                                                      ? Colors.white
                                                      : Colors.black,
                                                  fontSize: 16,
                                                ),
                                              ))));
                                    })),
                            const SizedBox(
                              height: 10,
                            )
                          ],
                        ))),
                ReminderCard(),
                CustomFloatingButton(
                  onTap: () {},
                ),

                //   Spacer()
              ],
            ))));
  }
}
