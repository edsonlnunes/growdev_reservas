import 'package:gd_reservas/models/resposta_http.dart';
import 'package:gd_reservas/models/usuario.dart';
import '../contracts/http_client.contract.dart';
import '../contracts/usuario_repository.contract.dart';

class UsuarioRepository implements IUsuarioRepository {
  IHttpClient httpClient;

  UsuarioRepository(this.httpClient);

  @override
  Future<RespostaHttp> criarConta(Usuario usuario) async {
    var url = '/users';
    var response = await httpClient.post(url, usuario.toJson());
    return response;
  }
}
