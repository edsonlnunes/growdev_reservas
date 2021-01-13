import 'package:flutter/material.dart';
import 'package:gd_reservas/layouts/widgets/custom_appbar.widget.dart';
import 'package:gd_reservas/layouts/widgets/modal_confirmar_inscricao.widget.dart';
import '../../models/aula.dart';
import '../widgets/aula_card.widget.dart';

class AulasDisponiveisPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff8f8f8),
      appBar: CustomAppBar(),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            color: Colors.white,
            padding: EdgeInsets.symmetric(vertical: 30),
            child: Center(
              child: Text(
                'Aulas disponíveis',
                style: TextStyle(
                  color: Color(0xff2b385b),
                  fontSize: 20,
                ),
              ),
            ),
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
                  callback: () => showModalConfirmarInscricao(context),
                  iconData: Icons.add,
                );
              },
            ),
          ),
        ],
      ),
    );
  }  
}
