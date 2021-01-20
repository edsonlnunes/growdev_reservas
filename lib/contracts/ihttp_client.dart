abstract class IHttpClient {
  Future<void> get(
    String endpoint, {
    Map<String, dynamic> headers,
  });
  Future<void> post(
    String endpoint,
    dynamic data, {
    Map<String, dynamic> headers,
  });
  Future<void> put(
    String endpoint, {
    Map<String, dynamic> headers,
  });
}