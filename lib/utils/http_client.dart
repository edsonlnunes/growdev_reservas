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
    try {
      var resposta = await _dio.get(
        url,
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );
      return RespostaHttp(statusCode: resposta.statusCode, data: resposta.data);
    } on DioError catch (e) {
      if (e.type == DioErrorType.RESPONSE) {
        return RespostaHttp(
            statusCode: e.response.statusCode, error: e.response.data);
      }
      return RespostaHttp(error: e.error);
    } catch (e) {
      return RespostaHttp(error: e);
    }
  }

  @override
  Future<RespostaHttp> post(String url, data, {String token}) async {
    try {
      var resposta = await _dio.post(
        url,
        data: data,
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );
      return RespostaHttp(statusCode: resposta.statusCode, data: resposta.data);
    } on DioError catch (e) {
      if (e.type == DioErrorType.RESPONSE) {
        return RespostaHttp(
            statusCode: e.response.statusCode, error: e.response.data);
      }
      return RespostaHttp(error: e.error);
    } catch (e) {
      return RespostaHttp(error: e);
    }
  }

  @override
  Future<RespostaHttp> put(String url, {String token}) async {
    try {
      var resposta = await _dio.put(
        url,
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );
      return RespostaHttp(statusCode: resposta.statusCode, data: resposta.data);
    } on DioError catch (e) {
      if (e.type == DioErrorType.RESPONSE) {
        return RespostaHttp(
            statusCode: e.response.statusCode, error: e.response.data);
      }
      return RespostaHttp(error: e.error);
    } catch (e) {
      return RespostaHttp(error: e);
    }
  }
}
