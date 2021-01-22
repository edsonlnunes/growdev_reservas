import 'dart:convert';
import 'package:gd_reservas/models/resposta_http.dart';
import '../contracts/http_client.contract.dart';
import '../contracts/usuario_repository.contract.dart';

class UsuarioRepository implements IUsuarioRepository {
  IHttpClient httpClient;

  UsuarioRepository(this.httpClient);

  @override
  Future<RespostaHttp> criarConta(usuario) async {
    var url = '/users';
    var response = await httpClient.post(url, json.encode(usuario));
    return response;
  }
}
