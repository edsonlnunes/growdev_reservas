import 'package:gd_reservas/contracts/usuario_repository.contract.dart';
import 'package:gd_reservas/repositories/usuario_repository.dart';
import 'package:gd_reservas/utils/http_client.dart';

class UsuarioRepositoryFactory {
  static IUsuarioRepository usuarioRepository() {
    var url = 'https://growdev-test-node.herokuapp.com/';

    return UsuarioRepository(HttpClient(url));
  }
}
