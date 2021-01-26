import 'package:gd_reservas/contracts/autenticacao_repository.contract.dart';
import 'package:gd_reservas/models/usuario.dart';

class AutenticacaoBloc {
  IAutenticacaoRepository iAutenticacaoRepository;

  AutenticacaoBloc(this.iAutenticacaoRepository);

  Future<bool> login(Usuario usuario) async {
    try {
      var usuarioAutenticado = await iAutenticacaoRepository.login(usuario);
      //salvar no banco
      return true;
    } catch (e) {
      return false;
    }
  }
}
