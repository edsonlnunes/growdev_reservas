import 'package:meta/meta.dart';

class Usuario {
  final String name;
  final String password;
  final String type;
  final String username;
  final String growdever;
  String token;

  Usuario({
    @required this.name,
    @required this.password,
    @required this.type,
    @required this.username,
    this.token,
    this.growdever,
  });

  Map<String, dynamic> toJson() =>
      {"name": name, "password": password, "type": type, "username": username};

  Map<String, dynamic> toJsonLogin() =>
      {"username": username, "password": password};

  Usuario.fromJsonLogin(Map<String, dynamic> json)
      : name = json['user']['name'],
        password = '',
        type = json['user']['type'],
        username = json['user']['username'],
        growdever = json['user']['growdever'],
        token = json['token'];

  @override
  String toString() {
    return '''
nome: $name
tipo: $type
usuario: $username
password: $password
growdever: $growdever
token: $token 
''';
  }
}
