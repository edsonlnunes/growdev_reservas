import 'package:gd_reservas/contracts/autenticacao_repository.contract.dart';
import 'package:gd_reservas/models/usuario.dart';

class AutenticacaoBloc {
  IAutenticacaoRepository iAutenticacaoRepository;

  AutenticacaoBloc(this.iAutenticacaoRepository);

  login(Usuario usuario) async {
    var resposta = await iAutenticacaoRepository.login(usuario);
  }
}
