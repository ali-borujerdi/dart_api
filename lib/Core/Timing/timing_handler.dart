import 'dart:async';
import 'package:dart_api/Core/Timing/scheduled_task.dart';

class TimingHandler {
  final timer = Duration(seconds: 5);
  var timerList = List<ScheduledTask>.empty(growable: true);

  TimingHandler() {
    Timer.periodic(timer, (Timer t) => _call());
  }

  addTimer(ScheduledTask timer) {
    timerList.add(timer);
  }

  _call() {
    for (var t in timerList) {
      t.desiredTimeChecking(DateTime.now().minute);
    }
  }
}
