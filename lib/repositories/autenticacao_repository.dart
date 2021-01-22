import 'package:gd_reservas/contracts/iAutenticacao_repository.dart';
import 'package:gd_reservas/contracts/ihttp_client_repository.dart';
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