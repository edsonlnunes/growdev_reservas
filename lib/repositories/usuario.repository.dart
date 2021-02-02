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

  @override
  Future<RespostaHttp> atualizarInformacoes(Usuario usuario) async {
    var url = '/users/${usuario.growdever.uid}';
    var response = await httpClient.put(
      url,
      usuario.growdever.toJson(),
      token: usuario.token,
    );
    return response;
  }

  @override
  Future<RespostaHttp> atualizarSenha(Usuario usuario) async {
    var url = '/users/${usuario.growdever.uid}';
    var response = await httpClient.put(
      url,
      usuario.toJsonNovaSenha(),
      token: usuario.token,
    );
    return response;
  }
}
