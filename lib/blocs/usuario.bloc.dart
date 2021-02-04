import 'package:gd_reservas/contracts/usuario_repository.contract.dart';
import 'package:gd_reservas/models/resposta_http.dart';
import 'package:gd_reservas/models/usuario.dart';

class UsuarioBloc {
  final IUsuarioRepository usuarioRepository;

  UsuarioBloc(this.usuarioRepository);

  Future<RespostaHttp> criarConta(Usuario usuario) async {
    return usuarioRepository.criarConta(usuario);
  }

  Future<RespostaHttp> atualizarInformacoes(Usuario usuario) async {
    return usuarioRepository.atualizarInformacoes(usuario);
  }

  Future<RespostaHttp> atualizarSenha(Usuario usuario) async {
    return usuarioRepository.atualizarSenha(usuario);
  }
}
