import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gd_reservas/blocs/usuario_bloc.dart';
import 'package:gd_reservas/layouts/pages/aulas_disponiveis.page.dart';
import 'package:gd_reservas/models/usuario.dart';

class AppController {
  final UsuarioBloc usuarioBloc;

  AppController(this.usuarioBloc);

  String validarDados(String valor, String type) {
    switch (type) {
      case 'name':
        return valor.isEmpty ? 'Nome não pode ser vazio' : null;
        break;
      case 'username':
        return valor.isEmpty ? 'username não pode ser vazio' : null;
        break;
      case 'password':
        return valor.length < 6 ? 'Senha muito curta (min: 6)' : null;
        break;
      default:
        return null;
    }
  }

  Future<bool> criarConta(BuildContext context, Usuario usuario) async {
    try {
      var response = await usuarioBloc.usuarioRepository.criarConta(usuario);
      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: response.statusCode == 200
              ? (Text(response.data['message']))
              : Text(
                  response.error['message'],
                ),
        ),
      );
      return response.statusCode == 200 ? true : false;
    } catch (e) {
      Scaffold.of(context).showSnackBar(
        SnackBar(
          content:
              Text('Ocorreu um erro no servidor! Tente novamente mais tarde'),
        ),
      );
      return false;
    }
  }

  void proximaTela(BuildContext context) {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => AulasDisponiveisPage()),
        (route) => false);
  }
}
