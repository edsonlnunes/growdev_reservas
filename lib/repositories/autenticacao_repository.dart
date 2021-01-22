import 'package:gd_reservas/contracts/autenticacao_repository.contract.dart';
import 'package:gd_reservas/contracts/http_client.contract.dart';
import 'package:gd_reservas/models/resposta_http.dart';
import 'package:gd_reservas/models/usuario.dart';

class AutenticacaoRepository implements IAutenticacaoRepository {
  IHttpClient _httpClient;
  AutenticacaoRepository(this._httpClient);

  @override
  Future<RespostaHttp> login(Usuario usuario) async {
    var response = await _httpClient.post('/login', usuario.toJsonLogin());
    return response;
  }
}