import 'package:gd_reservas/models/growdever.dart';

class Usuario {
  String nome;
  String senha;
  String novaSenha;
  String tipo;
  String nomeUsuario;
  String token;
  Growdever growdever;

  Usuario({
    this.nome,
    this.senha,
    this.novaSenha,
    this.tipo,
    this.nomeUsuario,
    this.token,
    this.growdever,
  });

  Map<String, dynamic> toJson() =>
      {"name": nome, "password": senha, "type": tipo, "username": nomeUsuario};

  Map<String, dynamic> toJsonLogin() =>
      {"username": nomeUsuario, "password": senha};

  Map<String, dynamic> toJsonNovaSenha() =>
      {"username": nomeUsuario, "oldPassword": senha, "password": novaSenha};

  Usuario.fromJsonLogin(Map<String, dynamic> json)
      : nome = json['user']['name'],
        senha = '',
        novaSenha = '',
        tipo = json['user']['type'],
        nomeUsuario = json['user']['username'],
        growdever = Growdever.fromJson(json['user']['growdever']);

  @override
  String toString() {
    return '''
nome: $nome
tipo: $tipo
usuario: $nomeUsuario
password: $senha
growdever: $growdever
token: $token 
''';
  }
}
