class Timer {
  int startingFromTheMinute;
  int intervalBetweenMinutes;
  int nextStep = 0;
  Function action;

  Timer(this.startingFromTheMinute, this.intervalBetweenMinutes, this.action);

  next(int currentMinute) {
    if (currentMinute >= nextStep) {
      if (currentMinute + intervalBetweenMinutes > 59) {
        nextStep = 60 - currentMinute - intervalBetweenMinutes;
      }
      nextStep += intervalBetweenMinutes;
      execute();
    }
  }

  execute() {
    action.call();
  }
}

class TimerHandler {}
