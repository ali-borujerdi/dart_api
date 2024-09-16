class ScheduledTask {
  int startingFromTheMinute;
  int intervalBetweenMinutes;
  int nextDesiredTime = 0;
  Function task;

  ScheduledTask(this.startingFromTheMinute, this.intervalBetweenMinutes,
      this.task, int currentMinure) {
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
        task.call();
      }
    }
  }
}
