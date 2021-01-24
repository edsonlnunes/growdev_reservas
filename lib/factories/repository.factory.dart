import 'package:gd_reservas/contracts/autenticacao_repository.contract.dart';
import 'package:gd_reservas/repositories/autenticacao_repository.dart';
import 'package:gd_reservas/utils/http_client.dart';

class RepositoryFactory {
  static const urlbase = 'growdev-test-node.herokuapp.com';

  static IAutenticacaoRepository autenticacaoRepository() {
    return AutenticacaoRepository(
      HttpClient(urlbase),
    );
  }
}
