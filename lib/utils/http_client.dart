import 'package:dio/dio.dart';
import 'package:gd_reservas/contracts/ihttp_client.dart';

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
  Future<Response> get(String url, {String token}) async {
    var response = await _dio.get(
      url,
      options: Options(
        headers: {'Authorization': 'Bearer $token'},
      ),
    );
    return response;
  }

  @override
  Future<Response> post(String url, data, {String token}) async {
    var response = await _dio.post(
      url,
      data: data,
      options: Options(
        headers: {'Authorization': 'Bearer $token'},
      ),
    );
    return response;
  }

  @override
  Future<Response> put(String url, {String token}) async {
    var response = await _dio.put(
      url,
      options: Options(
        headers: {'Authorization': 'Bearer $token'},
      ),
    );
    return response;
  }
}
