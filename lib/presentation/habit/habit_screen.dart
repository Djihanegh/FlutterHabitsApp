import 'package:flutter/material.dart';

import 'components/body.dart';

class HabitScreen extends StatelessWidget {
  const HabitScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Body(),
    );
  }
}
