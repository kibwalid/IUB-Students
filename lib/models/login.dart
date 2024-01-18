class Login {
  String email;
  String password;

  Login({required this.email, required this.password});

  factory Login.fromJson(Map<String, dynamic> json) {
    return Login(email: json['email'], password: json['password']);
  }

  Map<String, dynamic> toJson() {
    return {'email': email, 'password': password};
  }

  String toJsonString() {
    return "{'email': '$email', 'password': '$password'}".replaceAll("'", "\"");
  }

  factory Login.empty() {
    return Login(email: "", password: "");
  }
}
