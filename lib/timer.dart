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
