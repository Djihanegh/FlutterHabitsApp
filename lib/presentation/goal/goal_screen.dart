import 'package:flutter/material.dart';
import 'package:pavlok_test/utils/utils_export.dart';

import '../components/components_export.dart';
import '../sleep_onboarding/export_sleep.dart';
import 'components/body.dart' as goal_body;

class GoalScreen extends StatelessWidget {
  const GoalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return DefaultTabController(
        length: 2,
        child: Scaffold(
          body: const goal_body.Body(),
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
