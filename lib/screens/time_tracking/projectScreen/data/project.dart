class Project {
  String title;

  Project(
    this.title,
  );

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(json['title']);
  }

  Map<String, dynamic> toJson() {
    return {'title': title};
  }
}
