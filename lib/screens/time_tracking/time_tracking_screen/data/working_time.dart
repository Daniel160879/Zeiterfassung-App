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

  factory WorkingTime.fromJson(Map<String, dynamic> json) {
    return WorkingTime(hours: json['hours'], minutes: json['minutes'], seconds: json['seconds']);
  }

  Map<String, dynamic> toJson() {
    return {'hours': minutes, 'minutes': minutes, 'seconds': seconds};
  }
}
