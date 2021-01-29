import 'package:flutter/material.dart';
import 'package:gd_reservas/layouts/widgets/titulo.widget.dart';
import 'package:gd_reservas/layouts/widgets/modal_simples.widget.dart';
import 'package:gd_reservas/repositories/aula.repository.dart';
import 'package:gd_reservas/utils/http_client.dart';
import 'package:gd_reservas/utils/lang/localizacoes.dart';
import '../../models/aula.dart';
import '../widgets/aula_card.widget.dart';

class AulasDisponiveisPage extends StatefulWidget {
  @override
  _AulasDisponiveisPageState createState() => _AulasDisponiveisPageState();
}

class _AulasDisponiveisPageState extends State<AulasDisponiveisPage> {
  AulaRepository repository =
      AulaRepository(HttpClient('https://growdev-test-node.herokuapp.com/'));

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(70, 0, 0, 0),
      child: Column(
        children: [
          TituloWidget('AULAS_DISPONIVEIS'),
          SizedBox(
            height: 15,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return AulaCardWidget(
                  aula: Aula(
                    data: '26/11/2020',
                    hora: '13:30h',
                    status: 'Aguardando',
                    vagas: 4,
                  ),
                  statusLabel: 'Status',
                  callback: () => confirmarAgendamento(context),
                  iconData: Icons.add,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void confirmarAgendamento(BuildContext ctx) {
    showDialog(
      context: ctx,
      barrierDismissible: false,
      builder: (context) => ModalSimplesWidget(
        descricao:
            Localizacoes.of(context).traduzir('CONFIRMACAO_INSCRICAO_AULA'),
        textobotao:
            Localizacoes.of(context).traduzir('CONFIRMAR').toUpperCase(),
        callback: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
