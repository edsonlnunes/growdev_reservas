import 'package:gd_reservas/contracts/aula_repository.contract.dart';
import 'package:gd_reservas/contracts/autenticacao_repository.contract.dart';
import 'package:gd_reservas/contracts/usuario_repository.contract.dart';
import 'package:gd_reservas/repositories/aula.repository.dart';
import 'package:gd_reservas/repositories/autenticacao.repository.dart';
import 'package:gd_reservas/repositories/usuario.repository.dart';
import 'package:gd_reservas/utils/http_client.dart';

class RepositoryFactory {
  static const urlbase = 'https://growdev-test-node.herokuapp.com';

  static IUsuarioRepository usuarioRepository() {
    return UsuarioRepository(HttpClient(urlbase));
  }

  static IAutenticacaoRepository autenticacaoRepository() {
    return AutenticacaoRepository(
      HttpClient(urlbase),
    );
  }

  static IAulaRepository aulaRepository() {
    return AulaRepository(HttpClient(urlbase));
  }
}
