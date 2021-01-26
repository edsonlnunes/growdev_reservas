import 'package:flutter/material.dart';
import 'package:gd_reservas/models/usuario.dart';

import '../bloc/autenticacao.bloc.dart';

class AppController {
  AutenticacaoBloc autenticacaoBloc;
  AppController(this.autenticacaoBloc);

  ValueNotifier<bool> autenticacaoNotifier;

  void autenticacao(Usuario usuario) async {
    autenticacaoNotifier.value = await autenticacaoBloc.login(usuario);
  }
}
