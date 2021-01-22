import 'dart:convert';

import 'package:dio/dio.dart';
import '../contracts/ihttp_client.dart';
import '../contracts/usuario_repository.contract.dart';

class UsuarioRepository implements IUsuarioRepository {
  IHttpClient httpClient;

  UsuarioRepository(this.httpClient);

  @override
  Future<Response> criarConta(usuario) async {
    var url = '/users';
    var response = await httpClient.post(url, json.encode(usuario));
    return response;
  }
}
