import 'package:meta/meta.dart';

class Usuario {
  final String name;
  final String password;
  final String type;
  final String username;

  Usuario({
    @required this.name,
    @required this.password,
    @required this.type,
    @required this.username,
  });

  Map<String, dynamic> toJson() =>
      {"name": name, "password": password, "type": type, "username": username};

  Map<String, dynamic> toJsonLogin() =>
      {"username": username, "password": password};
}
