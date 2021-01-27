import 'package:gd_reservas/contracts/autenticacao_repository.contract.dart';
import 'package:gd_reservas/contracts/http_client.contract.dart';
import 'package:gd_reservas/models/usuario.dart';

class AutenticacaoRepository implements IAutenticacaoRepository {
  IHttpClient _httpClient;
  AutenticacaoRepository(this._httpClient);

  @override
  Future<Usuario> login(Usuario usuario) async {
    var response = await _httpClient.post('/login', usuario.toJsonLogin());

    if (response.statusCode == 400 && response.error['success'] == false) {
      throw 'Usuário ou senha inválidos';
    } else if (response.error != null) {
      throw response.error;
    }

    return Usuario.fromJsonLogin(response.data);
  }
}
