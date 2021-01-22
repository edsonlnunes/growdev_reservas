import 'package:dio/dio.dart';
import 'package:gd_reservas/contracts/http_client.contract.dart';
import 'package:gd_reservas/models/resposta_http.dart';

class HttpClient implements IHttpClient {
  Dio _dio;

  HttpClient(String baseUrl) {
    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
      ),
    );
  }

  @override
  Future<RespostaHttp> get(String url, {String token}) async {
    var resposta = await _dio.get(
      url,
      options: Options(
        headers: {'Authorization': 'Bearer $token'},
      ),
    );
    return RespostaHttp(resposta.statusCode, resposta.data);
  }

  @override
  Future<RespostaHttp> post(String url, data, {String token}) async {
    var resposta = await _dio.post(
      url,
      data: data,
      options: Options(
        headers: {'Authorization': 'Bearer $token'},
      ),
    );
    return RespostaHttp(resposta.statusCode, resposta.data);
  }

  @override
  Future<RespostaHttp> put(String url, {String token}) async {
    var resposta = await _dio.put(
      url,
      options: Options(
        headers: {'Authorization': 'Bearer $token'},
      ),
    );
    return RespostaHttp(resposta.statusCode, resposta.data);
  }
}
