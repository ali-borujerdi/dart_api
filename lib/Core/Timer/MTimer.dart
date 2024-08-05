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
    //???
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
}
