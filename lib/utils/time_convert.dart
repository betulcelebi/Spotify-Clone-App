class TimeConvert {
  String milisecontToSecondAndMinute(int? milisecond) {
    int msecond = milisecond! ~/ 1000;
    int minute = msecond ~/ 60;
    int second = (msecond % 60).toInt();

    return "$minute:$second";
  }
}
