class Employer {
  String firstName;
  String lastName;
  String age;

  Employer({required this.firstName, required this.lastName, required this.age});

  factory Employer.fromJson(Map<String, dynamic> json) {
    return Employer.fromJson(json);
  }

  Map<String, dynamic> toJson() {
    return {'firstName': firstName, 'lastname': lastName, 'age': age};
  }
}
