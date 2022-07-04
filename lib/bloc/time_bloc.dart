/*import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';

/// A read-only description of a todo-item


/// An object that controls a list of [Todo].

class TimeNotifier extends ChangeNotifier {
  String bedTime = "";
  String wakeUpTime = "";

  String get getBedTime => bedTime;

  String get getWakeUpTime => wakeUpTime;

  void changeBedTime(String value) {
    bedTime = value;
    notifyListeners();
  }

  void changeWakeUpTime(String value) {
    wakeUpTime = value;
    notifyListeners();
  }
}




class TimeCubit extends Cubit<Time> {
  TimeCubit() : super(Time(wakeUpTime: "dqsdqs", bedTime: "qsdqs"));

  void changeWakeUpTime(String value) =>
      emit(Time(wakeUpTime: value, bedTime: state.bedTime));

  void changeBedTime(String value) =>
      emit(Time(wakeUpTime: state.wakeUpTime, bedTime: value));
}
*/

import 'package:flutter_bloc/flutter_bloc.dart';

class Time {
  Time({
    required this.wakeUpTime,
    required this.bedTime,
  });

  String wakeUpTime;
  String bedTime;

  @override
  String toString() {
    return 'Time(description: $bedTime, completed: $wakeUpTime)';
  }
}
abstract class TimeEvent {}
class WakeUpTimeChandged extends TimeEvent {}
class BedTimeChandged extends TimeEvent {}

class TimeBloc extends Bloc<TimeEvent, Time> {
  TimeBloc() : super(Time(wakeUpTime: "dqsdqs", bedTime: "qsdqs")) {
    on<WakeUpTimeChandged>((event, emit) => emit(Time(wakeUpTime: "dqsdqs", bedTime: "qsdqs")));
  //  on<BedTimeChandged>((event, emit) => emit(state - 1));
  }
}