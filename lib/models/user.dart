class User {
  String name;
  double cpga;
  double creditsCompleted;
  String id;
  String major;

  User({
    required this.name,
    required this.cpga,
    required this.creditsCompleted,
    required this.id,
    required this.major,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      cpga: json['cpga'].toDouble(),
      creditsCompleted: json['creditsCompleted'],
      id: json['id'],
      major: json['major'],
    );
  }

  factory User.empty() {
    return User(name: "", cpga: 0, creditsCompleted: 0, id: "", major: "");
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'cpga': cpga,
      'creditsCompleted': creditsCompleted,
      'id': id,
      'major': major,
    };
  }

  String toJsonString() {
    return """{
      'name': '$name',
      'cpga': $cpga,
      'creditsCompleted': $creditsCompleted,
      'id': '$id',
      'major': '$major'
    }"""
        .replaceAll("'", "\"");
  }
}
