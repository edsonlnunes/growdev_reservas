import 'package:gd_reservas/contracts/autenticacao_repository.contract.dart';
import 'package:gd_reservas/models/usuario.dart';
import 'package:gd_reservas/utils/global.dart';

class AutenticacaoBloc {
  IAutenticacaoRepository iAutenticacaoRepository;

  AutenticacaoBloc(this.iAutenticacaoRepository);

  Future<bool> login(Usuario usuario) async {
    try {
      var usuarioAutenticado = await iAutenticacaoRepository.login(usuario);
      //salvar no banco
      kUserToken = usuarioAutenticado.token;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
