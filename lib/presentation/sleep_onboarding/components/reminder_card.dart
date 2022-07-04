import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pavlok_test/utils/size_config.dart';

import '../../../utils/color.dart';
import '../../components/bottom_sheet.dart';
import '../../components/custom_card.dart';
import '../../components/custom_floating_button.dart';

class ReminderCard extends StatefulWidget {
  const ReminderCard({
    Key? key,
  }) : super(key: key);

  @override
  State<ReminderCard> createState() => _ReminderCardState();
}

class _ReminderCardState extends State<ReminderCard> {
  @override
  Widget build(BuildContext context) {
    return CustomCard(
      height: 56,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      onTap: () async {
        showBottomSheet(
            context: context, builder: (_) => _ReminderBottomSheet());
      },
      child: Row(
        children: [
          Text(
            "Remind me before bed time",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
          Spacer(),
          Text(
            "30 min",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          ),
          SizedBox(width: 5),
        ],
      ),
    );
  }
}

class _ReminderBottomSheet extends StatefulWidget {
  const _ReminderBottomSheet({Key? key}) : super(key: key);

  @override
  State<_ReminderBottomSheet> createState() => __ReminderBottomSheetState();
}

class __ReminderBottomSheetState extends State<_ReminderBottomSheet> {
  int value = 5;
  @override
  Widget build(BuildContext context) {
    return BottomFloatingCard(
      height: SizeConfig.screenHeight! * 0.5,
      child: Column(
        children: [
          // lip
          Container(
            height: 5,
            width: 40,
            decoration: BoxDecoration(
              color: AppColors.kgreyColor,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          SizedBox(height: 30),
          Text("Reminder",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: AppColors.kPrimaryText,
              )),
          SizedBox(height: 14),
          Flexible(
            child: Stack(
              children: [
                CupertinoPicker(
                  itemExtent: 120 / 5 + 1,
                  backgroundColor: Colors.white,
                  onSelectedItemChanged: (val) {
                    setState(() {
                      value = 5 * (val + 1);
                    });
                  },
                  squeeze: 0.9,
                  magnification: 1.2,
                  diameterRatio: 1.1,
                  selectionOverlay: SizedBox.shrink(),
                  children: [
                    for (int i = 1; i <= 24; i++)
                      Text(
                        "${5 * i}",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w500),
                      ),
                  ],
                ),
                Align(
                  child: Text(
                    "min",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                  ),
                  alignment: Alignment.lerp(
                      Alignment.center, Alignment.centerRight, 0.3)!,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 40,
                    decoration: const BoxDecoration(
                      color: Colors.transparent,
                      border: Border(
                        top: BorderSide(
                          color: AppColors.kgreyColor,
                          width: 1,
                        ),
                        bottom: BorderSide(
                          color: AppColors.kgreyColor,
                          width: 1,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 14),
          CustomFloatingButton(
            onTap: () {
              // Get.back(result: value);
            },
            text: "Done",
            padding: EdgeInsets.symmetric(
              horizontal: 8,
            ),
          )
        ],
      ),
    );
  }
}
