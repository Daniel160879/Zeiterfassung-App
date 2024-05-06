class WorkPlace {
  final String title;

  WorkPlace(
    this.title,
  );

  factory WorkPlace.fromJson(Map<String, dynamic> json) {
    return WorkPlace(json['title']);
  }

  Map<String, dynamic> toJson() {
    return {'title': title};
  }
}
