import 'package:gd_reservas/models/resposta_http.dart';

abstract class  IAulaRepository {

  Future<RespostaHttp> buscarAulasDisponiveis();

  Future<RespostaHttp> inscricaoAula(String growdeverUid, String classUid);

}