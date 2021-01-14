import 'package:flutter/material.dart';
import 'package:gd_reservas/layouts/widgets/aula_card.widget.dart';
import 'package:gd_reservas/layouts/widgets/custom_appbar.widget.dart';
import 'package:gd_reservas/layouts/widgets/modal_cancelar.widget.dart';
import 'package:gd_reservas/models/aula.dart';

class AulasAgendadas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.09,
            width: double.infinity,
            color: Colors.white,
            child: Center(
              child: Text(
                'Aulas agendadas',
                style: TextStyle(
                  fontSize: 20,
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
                    callback: () {
                      modalShowDialog(context);
                    },
                    statusLabel: 'Status da aula: aguardando',
                    iconData: Icons.delete);
              },
            ),
          )
        ],
      ),
    );
  }
}
