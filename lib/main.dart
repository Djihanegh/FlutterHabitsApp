import 'package:flutter/material.dart';
import 'package:pavlok_test/presentation/goal/goal_screen.dart';
import 'package:pavlok_test/utils/color.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.kbackgroundColor,
        fontFamily: "Manrope",
        pageTransitionsTheme: const PageTransitionsTheme(builders: {
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        }),
      ),
      home: const GoalScreen(),
    );
  }
}
