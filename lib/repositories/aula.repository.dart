import 'package:gd_reservas/utils/lang/localizacoes.dart';

import '../contracts/aula_repository.contract.dart';
import '../contracts/http_client.contract.dart';
import '../models/aula.dart';
import '../models/resposta_http.dart';
import '../utils/global.dart';

class AulaRepository implements IAulaRepository {
  final IHttpClient httpClient;

  AulaRepository(this.httpClient);

  @override
  Future<List<Aula>> buscarAulasDisponiveis() async {
    RespostaHttp response =
        await httpClient.get('/classes', token: kUser.token);
    if (response.statusCode == 200) {
      List listaJson = response.data['classes'];
      var lista = listaJson.map((aula) => Aula.fromJson(aula)).toList();
      return lista;
    } else {
      throw response.error;
    }
  }

  @override
  Future<String> inscricaoAula(String growdeverUid, String classUid) async {
    RespostaHttp response = await httpClient.post(
      'class-growdevers',
      {
        "growdever_uid": growdeverUid,
        "class_uid": classUid,
      },
      token: kUser.token,
    );
    try {
      if (response.statusCode == 200) {
        return "AGENDAMENTO_SUCESSO";
      } else if (response.statusCode == 503) {
        // TODO fazer a chave da tradução
        return 'SERVICO_INDISPONIVEL';
      }
      // TODO fazer a chave de tradução
      return "AGENDAMENTO_ERRO";
    } catch (e) {
      // TODO fazer a chave da tradução
      return 'ERRO_SERVIDOR';
    }
  }

  @override
  Future<List<Aula>> buscarAulasAgendadas(String growdeverUid) async {
    RespostaHttp response = await httpClient.get(
      '/growdevers/$growdeverUid',
      token: kUser.token,
    );

    try {
      if (response.statusCode == 200) {
        List listaJson = response.data['growdever']['scheduled_classes'];
        var lista =
            listaJson.map((aula) => Aula.fromJsonAgendamento(aula)).toList();
        return lista;
      }
      return <Aula>[];
    } catch (e) {
      return <Aula>[];
    }
  }

  @override
  Future<bool> cancelarAgendamento(String uidAgendamento) async {
    RespostaHttp response = await httpClient.delete(
      '/class-growdevers/$uidAgendamento',
      token: kUser.token,
    );

    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }
}
