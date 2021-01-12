import 'package:flutter/material.dart';
import 'package:gd_reservas/layouts/widgets/modal_confirmar_inscricao.widget.dart';
import '../../models/aula.dart';
import '../widgets/aula_card.widget.dart';

class AulasDisponiveisPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff8f8f8),
      appBar: AppBar(
        title: Text('Aulas da Growdev'),
        backgroundColor: Theme.of(context).primaryColor,
        actions: [
          IconButton(
            icon: Icon(
              Icons.exit_to_app,
              color: Colors.white,
            ),
            onPressed: () {},
          )
        ],
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Image.asset('assets/icons/logo.png'),
        ),
      ),
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
