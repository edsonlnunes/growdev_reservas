import 'package:flutter/material.dart';
import 'package:gd_reservas/layouts/widgets/aula_card.widget.dart';
import 'package:gd_reservas/layouts/widgets/custom_appbar.widget.dart';
import 'package:gd_reservas/layouts/widgets/modal_simples.widget.dart';
import 'package:gd_reservas/models/aula.dart';
import 'package:gd_reservas/utils/lang/localizacoes.dart';

class AulasAgendadasPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.09,
            width: double.infinity,
            color: Colors.white,
            child: Center(
              child: Text(
                Localizacoes.of(context).traduzir('AULAS_AGENDADAS'),
                style: Theme.of(context).textTheme.headline6.copyWith(
                      color: Theme.of(context).primaryColor,
                    ),
              ),
            ),
          ),
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
                    statusLabel: 'Status da aula: aguardando',
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
            Localizacoes.of(context).traduzir('CONFIRMACAO_CANCELSAMENTO_AULA'),
        textobotao:
            Localizacoes.of(context).traduzir('CONFIRMAR').toUpperCase(),
        callback: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
