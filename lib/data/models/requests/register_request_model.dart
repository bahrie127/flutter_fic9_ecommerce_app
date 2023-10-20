import 'dart:convert';

// {
//     "name": "bahri",
//     "password": "12345678",
//     "email": "bahri1@gmail.com",
//     "username": "bahri"
// }

class RegisterRequestModel {
  final String name;
  final String password;
  final String email;
  final String username;

  RegisterRequestModel(
      {required this.name,
      required this.password,
      required this.email,
      required this.username});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'password': password,
      'email': email,
      'username': username,
    };
  }

  String toJson() => json.encode(toMap());
}
