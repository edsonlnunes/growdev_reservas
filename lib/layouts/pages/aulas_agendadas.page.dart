import 'package:flutter/material.dart';
import 'package:gd_reservas/factories/controller.factory.dart';
import 'package:gd_reservas/layouts/widgets/aula_card.widget.dart';
import 'package:gd_reservas/layouts/widgets/loader.widget.dart';
import 'package:gd_reservas/layouts/widgets/titulo.widget.dart';
import 'package:gd_reservas/layouts/widgets/modal_simples.widget.dart';
import 'package:gd_reservas/models/aula.dart';
import 'package:gd_reservas/utils/global.dart';
import 'package:gd_reservas/utils/lang/localizacoes.dart';

class AulasAgendadasPage extends StatefulWidget {
  @override
  _AulasAgendadasPageState createState() => _AulasAgendadasPageState();
}

class _AulasAgendadasPageState extends State<AulasAgendadasPage> {
  var aulaController = ControllerFactory.aulaController();
  List<Aula> aulasAgendadas;

  @override
  void initState() {
    super.initState();
    aulaController.buscarAulasAgendadas(kUser.growdever).then((value) {
      print(kUser.token);
      print(kUser.growdever);
      setState(() {
        aulasAgendadas = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(70, 0, 0, 0),
      child: Column(
        children: [
          TituloWidget('AULAS_AGENDADAS'),
          SizedBox(
            height: 15,
          ),
          Expanded(
            child: LoaderWidget(
              itens: aulasAgendadas,
              builder: ListView.builder(
                itemCount: aulasAgendadas?.length ?? 0,
                itemBuilder: (context, index) {
                  return AulaCardWidget(
                      aula: aulasAgendadas[index],
                      callback: () => confirmarCancelamento(context, index),
                      statusLabel: 'Status da aula:\n aguardando',
                      iconData: Icons.delete);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  void confirmarCancelamento(BuildContext ctx, int index) {
    showDialog(
      context: ctx,
      barrierDismissible: false,
      builder: (context) => ModalSimplesWidget(
        descricao:
            Localizacoes.of(context).traduzir('CONFIRMACAO_CANCELAMENTO_AULA'),
        textobotao:
            Localizacoes.of(context).traduzir('CONFIRMAR').toUpperCase(),
        callback: () {
          print('Callback');
          aulaController
              .cancelarAgendamento(aulasAgendadas[index].uidAgendamento)
              .then((value) {
            setState(() {
              if (value) {
                aulasAgendadas.removeAt(index);
              }
            });
            Navigator.of(context).pop();
          });
        },
      ),
    );
  }
}
