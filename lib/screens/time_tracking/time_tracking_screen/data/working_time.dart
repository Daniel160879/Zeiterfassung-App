class WorkingTime {
  int seconds;
  int minutes;
  int hours;

  WorkingTime({
    required this.hours,
    required this.minutes,
    required this.seconds,
  });
  @override
  String toString() {
    return '$hours : $minutes : $seconds';
  }
}
