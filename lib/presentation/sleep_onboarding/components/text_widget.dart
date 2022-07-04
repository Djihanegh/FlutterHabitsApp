import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../utils/app_style.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      "Over your sleep goal ( 8hrs )",
      style: TextStyles.medium.copyWith(color: Colors.black, fontSize: 14),
    );
  }
}
