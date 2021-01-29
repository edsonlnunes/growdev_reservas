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
    RespostaHttp response = await httpClient.get('/classes', token: kUserToken);
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
      token: kUserToken,
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
}
