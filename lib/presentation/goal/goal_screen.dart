import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:pavlok_test/utils/assets.dart';
import 'package:pavlok_test/utils/color.dart';
import 'package:pavlok_test/utils/navigation.dart';

import '../../utils/app_style.dart';
import '../../utils/size_config.dart';
import '../components/custom_floating_button.dart';
import '../sleep_onboarding/sleep_onboarding_screen.dart';
import 'components/body.dart';

class GoalScreen extends StatelessWidget {
  const GoalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return DefaultTabController(
        length: 2,
        child: Scaffold(
          body: const Body(),
          floatingActionButton: CustomFloatingButton(
            onTap: () {
              navigateToPage(const SleepOnBoardingScreen(), context);
            },
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
        ));
  }
}
