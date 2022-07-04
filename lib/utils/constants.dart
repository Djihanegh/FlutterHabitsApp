import 'dart:math';

class Constants {
  static const int numberOfHours = 12;
  static const int numberOfMinutes = 60;
  static const int numberOfSeconds = 60;
  static const double angleBetweenEachMinuteLine = (2 * pi) / numberOfMinutes;
  static const double angleBetweenEachHourLine = 5 * angleBetweenEachMinuteLine;
}
