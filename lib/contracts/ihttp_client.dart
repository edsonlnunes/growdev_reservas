abstract class IHttpClient {
  Future<dynamic> get(
    String url, {
    Map<String, dynamic> headers,
  });
  Future<dynamic> post(
    String url,
    dynamic data, {
    Map<String, dynamic> headers,
  });
  Future<dynamic> put(
    String url, {
    Map<String, dynamic> headers,
  });
}