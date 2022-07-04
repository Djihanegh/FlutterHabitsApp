import 'package:pavlok_test/data/habit_model.dart';
import 'package:pavlok_test/utils/assets.dart';

import 'day_model.dart';

List<HabitModel> data = <HabitModel>[
  HabitModel("Set bedtime and wake up", AppAssets.timer, false),
  HabitModel("Take a walk", AppAssets.walk, false),
  HabitModel("Stay hydrated", AppAssets.bottle, false),
  HabitModel("Call parents", AppAssets.call, false),
  HabitModel("Donate to charity", AppAssets.donate, false),
];

List<HabitModel> badHabits = <HabitModel>[
  HabitModel("Can't wake up", AppAssets.timer, false),
  HabitModel("Getting lazy for workout", AppAssets.walk, false),
  HabitModel("Forgetting to dring water", AppAssets.bottle, false),
  HabitModel("Spending on credit cards", AppAssets.donate, false),
];

List<DayModel> days = [
  DayModel("M", 1, false),
  DayModel("T", 2, false),
  DayModel("W", 3, false),
  DayModel("T", 4, false),
  DayModel("F", 5, false),
  DayModel("S", 6, false),
  DayModel("S", 7, false)
];

List<int> time = [5, 10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60];
