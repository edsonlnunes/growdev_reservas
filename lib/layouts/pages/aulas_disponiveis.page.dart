import 'package:flutter/material.dart';
import 'package:gd_reservas/layouts/widgets/custom_appbar.widget.dart';
import 'package:gd_reservas/layouts/widgets/modal_simples.widget.dart';
import 'package:gd_reservas/themes/theme.dart';
import 'package:gd_reservas/utils/lang/localizacoes.dart';
import '../../models/aula.dart';
import '../widgets/aula_card.widget.dart';

class AulasDisponiveisPage extends StatefulWidget {
  @override
  _AulasDisponiveisPageState createState() => _AulasDisponiveisPageState();
}

class _AulasDisponiveisPageState extends State<AulasDisponiveisPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff8f8f8),
      appBar: CustomAppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 15,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          color: Colors.red,
                          child: Stack(
                            children: [
                              Container(
                                width: 200,
                                color: Colors.green,
                                child: Text('Teste'),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 85,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.09,
                        width: double.infinity,
                        color: Colors.white,
                        child: Center(
                          child: Text(
                            Localizacoes.of(context)
                                .traduzir('AULAS_DISPONIVEIS'),
                            style:
                                Theme.of(context).textTheme.headline6.copyWith(
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
                ),
              ],
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
