import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gd_reservas/blocs/autenticacao.bloc.dart';
import 'package:gd_reservas/blocs/usuario.bloc.dart';
import 'package:gd_reservas/layouts/pages/acesso.page.dart';
import 'package:gd_reservas/models/usuario.dart';

class AppController {
  final UsuarioBloc usuarioBloc;
  final AutenticacaoBloc autenticacaoBloc;
  final ValueNotifier<bool> processandoAutenticacao =
      ValueNotifier<bool>(false);

  AppController(this.usuarioBloc, this.autenticacaoBloc);

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

  Future<bool> atualizarInformacoes(
      BuildContext context, Usuario usuario) async {
    try {
      var response =
          await usuarioBloc.usuarioRepository.atualizarInformacoes(usuario);
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

  Future<bool> atualizarSenha(BuildContext context, Usuario usuario) async {
    try {
      var response =
          await usuarioBloc.usuarioRepository.atualizarSenha(usuario);
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
        MaterialPageRoute(builder: (_) => AcessoPage()), (route) => false);
  }

  Future<bool> autenticacao(Usuario usuario) async {
    processandoAutenticacao.value = true;
    var autenticado = await autenticacaoBloc.login(usuario);
    processandoAutenticacao.value = false;
    return autenticado;
  }
}
