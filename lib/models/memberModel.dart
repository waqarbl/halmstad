class Member {
  int age;
  String name;
  String gender;
  String ethnicity;
  String disability;

  Member({
    required this.age,
    required this.name,
    required this.gender,
    required this.ethnicity,
    required this.disability,
  });

  factory Member.fromJson(Map<String, dynamic> json) => Member(
        age: json["age"],
        name: json["name"],
        gender: json["gender"],
        ethnicity: json["ethnicity"],
        disability: json["disability"],
      );

  Map<String, dynamic> toJson() => {
        "age": age,
        "name": name,
        "gender": gender,
        "ethnicity": ethnicity,
        "disability": disability,
      };
}
