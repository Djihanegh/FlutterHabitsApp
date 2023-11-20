import 'package:flutter/material.dart';
import 'package:pavlok_test/presentation/components/habit_widget.dart';
import '../../../data/fake_data.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    const goodHabitKey = Key('good');
    return ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: widget.key == goodHabitKey ? data.length : badHabits.length,
        itemBuilder: (context, index) {
          return GestureDetector(
              onTap: () {
                setState(() {
                  if (widget.key == goodHabitKey) {
                    int selectedIndex = data
                        .indexWhere((element) => element.isSelected == true);

                    if (selectedIndex != -1) {
                      setState(() {
                        data[selectedIndex].isSelected = false;
                      });
                    }

                    data[index].getSelectedValue
                        ? data[index].selectHabit(false)
                        : data[index].selectHabit(true);
                  } else {
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
                  }
                });
              },
              child: HabitWidget(
                image: widget.key == goodHabitKey
                    ? data[index].getImage
                    : badHabits[index].getImage,
                isSelected: widget.key == goodHabitKey
                    ? data[index].getSelectedValue
                    : badHabits[index].getSelectedValue,
                title: widget.key == goodHabitKey
                    ? data[index].getTitle
                    : badHabits[index].getTitle,
              ));
        });
  }
}
