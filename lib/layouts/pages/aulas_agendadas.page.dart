import 'package:flutter/material.dart';
import 'package:gd_reservas/layouts/widgets/aula_card.widget.dart';
import 'package:gd_reservas/layouts/widgets/cabecalho_pagina.widget.dart';
import 'package:gd_reservas/layouts/widgets/modal_simples.widget.dart';
import 'package:gd_reservas/models/aula.dart';
import 'package:gd_reservas/utils/lang/localizacoes.dart';

class AulasAgendadasPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(70, 0, 0, 0),
      child: Column(
        children: [
          CabecalhoPagina('AULAS_AGENDADAS'),
          SizedBox(
            height: 15,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return AulaCardWidget(
                    aula: Aula(
                        data: '10/10/2021',
                        hora: '18:30',
                        status: 'meu status:'),
                    callback: () => confirmarCancelamento(context),
                    statusLabel: 'Status da aula:\n aguardando',
                    iconData: Icons.delete);
              },
            ),
          )
        ],
      ),
    );
  }

  void confirmarCancelamento(BuildContext ctx) {
    showDialog(
      context: ctx,
      barrierDismissible: false,
      builder: (context) => ModalSimplesWidget(
        descricao:
            Localizacoes.of(context).traduzir('CONFIRMACAO_CANCELAMENTO_AULA'),
        textobotao:
            Localizacoes.of(context).traduzir('CONFIRMAR').toUpperCase(),
        callback: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
