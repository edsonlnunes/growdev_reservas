abstract class IHttpClient {
  Future<dynamic> get(
    String url, {
    String token,
  });
  Future<dynamic> post(
    String url,
    dynamic data, {
    String token,
  });
  Future<dynamic> put(
    String url, {
    String token,
  });
}