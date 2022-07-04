import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:pavlok_test/utils/color.dart';

import '../../utils/app_style.dart';

class ProgressWidget extends StatelessWidget {
  const ProgressWidget({Key? key, required this.total, required this.actual})
      : super(key: key);

  final int total;
  final int actual;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 200,
          height: 10,
          decoration: const BoxDecoration(
            color: Color(0xFFE9E9E9),
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(30)),
            child: LinearProgressIndicator(
              backgroundColor: const Color(0xFFE9E9E9),
              color: const Color(0xFFE9E9E9),
              valueColor: const AlwaysStoppedAnimation<Color>(
                  AppColors.kSecondaryColor),
              value: actual / total,
              semanticsLabel: 'Linear progress indicator',
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        AutoSizeText('$actual of $total',
            style: TextStyles.medium.copyWith(color: AppColors.kSecondaryText))
      ],
    );
  }
}
