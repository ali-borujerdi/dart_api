import 'dart:async';

class MTimer {
  int startingFromTheMinute;
  int intervalBetweenMinutes;
  int nextDesiredTime = 0;
  Function action;

  MTimer(this.startingFromTheMinute, this.intervalBetweenMinutes, this.action,
      int currentMinure) {
    for (var i = startingFromTheMinute;
        i < currentMinure;
        i += intervalBetweenMinutes) {
      nextDesiredTime = i + intervalBetweenMinutes;
    }
  }

  desiredTimeChecking(int currentMinute) {
    if (currentMinute >= nextDesiredTime) {
      if (currentMinute - nextDesiredTime <= intervalBetweenMinutes) {
        var tmpNextTime = currentMinute + intervalBetweenMinutes;
        if (tmpNextTime > 59) {
          nextDesiredTime = (60 - tmpNextTime).abs();
        } else {
          nextDesiredTime = tmpNextTime;
        }
        action.call();
        // execute();
      }
    }
  }

  // execute() {
  //   action.call();
  // }
}

class TimerHandler {
  static const timer = Duration(seconds: 5);
  var timerList = List<MTimer>.empty(growable: true);

  TimerHandler() {
    Timer.periodic(timer, (Timer t) => _call());
  }

  addTimer(MTimer timer) {
    timerList.add(timer);
  }

  _call() {
    for (var t in timerList) {
      t.desiredTimeChecking(DateTime.now().minute);
    }
  }
}
