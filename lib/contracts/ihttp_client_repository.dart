import 'package:gd_reservas/models/resposta_http.dart';

abstract class IHttpClient {
  Future<RespostaHttp> get(
    String url, {
    String token,
  });
  Future<RespostaHttp> post(
    String url,
    dynamic data, {
    String token,
  });
  Future<RespostaHttp> put(
    String url, {
    String token,
  });
}