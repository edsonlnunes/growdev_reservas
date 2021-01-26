import 'package:flutter/material.dart';
import 'package:gd_reservas/models/usuario.dart';

import '../bloc/autenticacao.bloc.dart';

class AppController {
  AutenticacaoBloc autenticacaoBloc;
  AppController(this.autenticacaoBloc);
  final ValueNotifier<bool> processandoAutenticacao =
      ValueNotifier<bool>(false);

  Future<bool> autenticacao(Usuario usuario) async {
    processandoAutenticacao.value = true;
    var autenticado = await autenticacaoBloc.login(usuario);
    processandoAutenticacao.value = false;
    return autenticado;
  }
}
