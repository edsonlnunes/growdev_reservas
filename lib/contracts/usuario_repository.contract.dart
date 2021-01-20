abstract class IUsuarioRepository {
  Future<void> criarConta(
    String name,
    String password,
    String type,
    String username,
    String endpoint,
    Map<String, dynamic> headers,
  );
}
