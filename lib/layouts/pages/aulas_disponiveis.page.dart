import 'package:flutter/material.dart';
import 'package:gd_reservas/layouts/widgets/titulo.widget.dart';
import 'package:gd_reservas/layouts/widgets/modal_simples.widget.dart';
import 'package:gd_reservas/repositories/aula.repository.dart';
import 'package:gd_reservas/utils/global.dart';
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
  void initState() {
    // TODO: implement initState
    super.initState();
    print('kUser');
    print(kUser);
  }

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
            child: FutureBuilder(
              future: repository.buscarAulasDisponiveis(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState != ConnectionState.done) {
                  return CircularProgressIndicator();
                }
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    Aula aula = snapshot.data[index];
                    return AulaCardWidget(
                      aula: Aula(
                        data: aula.data,
                        hora: aula.hora,
                        status: aula.status,
                        vagas: aula.vagas,
                      ),
                      statusLabel: 'Status',
                      callback: () async {
                        String mensagem = await confirmarAgendamento(
                            context, kUser?.growdever, aula.uid);
                        final snackBar = SnackBar(
                          content: Text(
                            Localizacoes.of(context).traduzir(mensagem),
                          ),
                          duration: Duration(seconds: 3),
                        );
                        Scaffold.of(context).showSnackBar(snackBar);
                      },
                      iconData: Icons.add,
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<String> confirmarAgendamento(
      BuildContext ctx, String growdeverUid, String aulaUid) async {
    String resposta = await showDialog(
      context: ctx,
      barrierDismissible: false,
      builder: (context) => ModalSimplesWidget(
        descricao:
            Localizacoes.of(context).traduzir('CONFIRMACAO_INSCRICAO_AULA'),
        textobotao:
            Localizacoes.of(context).traduzir('CONFIRMAR').toUpperCase(),
        callback: () async {
          String resposta =
              await repository.inscricaoAula(growdeverUid, aulaUid);
          Navigator.of(context).pop(resposta);
        },
      ),
    );
    return resposta;
  }
}
