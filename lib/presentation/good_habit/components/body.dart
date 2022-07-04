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
    return ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: data.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                  onTap: () {
                    setState(() {
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
                    });
                  },
                  child: HabitWidget(
                    image: data[index].getImage,
                    isSelected: data[index].getSelectedValue,
                    title: data[index].getTitle,
                  ));
            });
  }
}
