import 'package:flutter/material.dart';
import 'package:pavlok_test/utils/color.dart';

import '../components/custom_floating_button.dart';
import 'components/body.dart';

class SleepOnBoardingScreen extends StatelessWidget {
  const SleepOnBoardingScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.divierColor,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.keyboard_arrow_left,
                color: Colors.black,
              ))),
      body: const Body(),
    );
  }
}
