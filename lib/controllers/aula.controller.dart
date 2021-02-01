import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../blocs/aula.bloc.dart';
import '../blocs/usuario.bloc.dart';
import '../layouts/pages/acesso.page.dart';
import '../models/aula.dart';
import '../utils/lang/localizacoes.dart';

class AulaController {
  final UsuarioBloc usuarioBloc;
  final AulaBloc aulaBloc;

  final ValueNotifier<bool> processandoAutenticacao =
      ValueNotifier<bool>(false);

  AulaController(this.usuarioBloc, this.aulaBloc);

  Future<void> inscricaoAula(
      BuildContext context, String growdeverUid, String classUid) async {
    var response = await aulaBloc.inscricaoAula(growdeverUid, classUid);
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text(
          Localizacoes.of(context).traduzir(response),
        ),
      ),
    );
  }

  Future<List<Aula>> buscarAulasDisponiveis() async {
    processandoAutenticacao.value = true;
    List<Aula> aulas = await aulaBloc.buscarAulasDisponiveis();
    processandoAutenticacao.value = false;
    return aulas;
  }

  Future<List<Aula>> buscarAulasAgendadas(String growdeverUid) async {
    return await aulaBloc.buscarAulasAgendadas(growdeverUid);
  }

  Future<bool> cancelarAgendamento(String uidAgendamento) async {
    return await aulaBloc.cancelarAgendamento(uidAgendamento);
  }
}
