import 'package:gd_reservas/models/resposta_http.dart';

abstract class IHttpClient {
  Future<RespostaHttp> get(
    String url, {
    String token,
  });
  Future<RespostaHttp> post(
    String url,
    Map<String, dynamic> data, {
    String token,
  });
  Future<RespostaHttp> put(
    String url,
    Map<String, dynamic> data, {
    String token,
  });
}
