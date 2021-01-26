class Usuario {
  String name;
  String password;
  String type;
  String username;
  String growdever;
  String token;

  Usuario({
    this.name,
    this.password,
    this.type,
    this.username,
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
