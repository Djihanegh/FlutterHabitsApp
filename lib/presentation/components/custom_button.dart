import 'package:flutter/material.dart';
import '../../utils/utils_export.dart';

class CustomButton extends StatelessWidget {
  final String? title;
  final Color? color;
  final Color? titleColor;

  final Function? onPressed;
  final EdgeInsets? padding;
  final double? height;
  final double? width;

  const CustomButton({
    Key? key,
    this.title,
    this.color,
    this.titleColor,
    this.height,
    this.width,
    this.onPressed,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () => onPressed!(),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      padding: const EdgeInsets.only(top: 0),
      child: Container(
        decoration: BoxDecoration(
          // color: color,
          gradient: const LinearGradient(
              begin: Alignment(-1, 1),
              end: Alignment(-1, -1),
              colors: [
                AppColors.kPrimaryColor,
                AppColors.kLinearColor,
              ],
              stops: [
                0.75,
                1
              ]),
          boxShadow: const [
            BoxShadow(
              color: Color(0xFFBDACFB),
              spreadRadius: 0,
              blurRadius: 20,
              offset: Offset(0, 8),
            ),
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.37),
              spreadRadius: 0,
              blurRadius: 10,
              offset: Offset(0, -3),
            ),
            BoxShadow(
              color: Color.fromRGBO(255, 255, 255, 0.5),
              spreadRadius: 0,
              blurRadius: 15,
              offset: Offset(3, 1),
            ),
          ],
          borderRadius: BorderRadius.circular(18),
        ),
        padding:
            padding ?? const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        alignment: Alignment.center,
        child: Text(
          title!,
          textAlign: TextAlign.center,
          style: TextStyles.semiBold.copyWith(
            fontSize: 16,
            color: titleColor ?? Colors.white,
          ),
        ),
      ),
    );
  }
}
