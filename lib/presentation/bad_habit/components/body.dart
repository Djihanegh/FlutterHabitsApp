import 'package:flutter/material.dart';
import 'package:pavlok_test/presentation/components/habit_widget.dart';

import '../../../data/fake_data.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: badHabits.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                  onTap: () {
                    setState(() {
                      int selectedIndex = badHabits
                          .indexWhere((element) => element.isSelected == true);

                      if (selectedIndex != -1) {
                        setState(() {
                          badHabits[selectedIndex].isSelected = false;
                        });
                      }

                      badHabits[index].getSelectedValue
                          ? badHabits[index].selectHabit(false)
                          : badHabits[index].selectHabit(true);
                    });
                  },
                  child: HabitWidget(
                    image: badHabits[index].getImage,
                    isSelected: badHabits[index].getSelectedValue,
                    title: badHabits[index].getTitle,
                  ));
            }));
  }
}
