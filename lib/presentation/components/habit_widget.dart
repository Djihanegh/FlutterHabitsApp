import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '../../utils/utils_export.dart';

class HabitWidget extends StatelessWidget {
  const HabitWidget(
      {Key? key,
      required this.title,
      required this.image,
      required this.isSelected})
      : super(key: key);
  final String title;
  final String image;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: isSelected ? AppColors.selectedHabitColor : Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: const [
                  BoxShadow(
                      offset: Offset(0.0, 14.0),
                      blurRadius: 40.0,
                      spreadRadius: -4.0,
                      color:
                          Color.fromRGBO(24, 39, 75, 0.07) //Color(0xFFE5E5E5),
                      ),
                ],
                border: Border.all(
                    width: 2,
                    color: isSelected
                        ? AppColors.kPrimaryColor
                        : Colors.transparent)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 60,
                  width: 60,
                  padding: const EdgeInsets.all(30),
                  decoration: BoxDecoration(
                      color: AppColors.selectedHabitColor,
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                          image: AssetImage(image),
                          fit: BoxFit.contain,
                          alignment: Alignment.center)),
                ),
                const SizedBox(
                  width: 10,
                ),
                AutoSizeText(
                  title,
                  style: TextStyles.semiBold.copyWith(
                      color: isSelected
                          ? AppColors.kPrimaryDarkColor
                          : AppColors.kPrimaryText),
                ),
              ],
            )));
  }
}
