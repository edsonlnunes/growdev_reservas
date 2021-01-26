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
    print('processandoAutenticacao - ${processandoAutenticacao.value}');
    var autenticado = await autenticacaoBloc.login(usuario);
    await Future.delayed(Duration(seconds: 5));
    processandoAutenticacao.value = false;
    print('processandoAutenticacao - ${processandoAutenticacao.value}');
    print('autenticado - $autenticado');
    return autenticado;
  }
}
