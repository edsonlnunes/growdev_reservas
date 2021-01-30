import 'dart:convert';

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
  Future<RespostaHttp> post(String url, Map<String, dynamic> data,
      {String token}) async {
    try {
      var resposta = await _dio.post(
        url,
        data: jsonEncode(data),
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
  Future<RespostaHttp> put(String url, Map<String, dynamic> data,
      {String token}) async {
    try {
      var resposta = await _dio.put(
        url,
        data: jsonEncode(data),
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
  Future<RespostaHttp> delete(String url, {String token}) async {
    try {
      var resposta = await _dio.delete(
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
