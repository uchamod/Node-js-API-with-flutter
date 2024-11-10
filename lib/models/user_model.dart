class User {
  final String name;
  final String id;
  final String email;
  final int age;

  User(
      {required this.name,
      required this.id,
      required this.email,
      required this.age});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        name: json["name"],
        id: json["_id"],
        email: json["email"],
        age: json["age"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "email": email,
      "age": age,
    };
  }
}
