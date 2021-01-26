import 'package:gd_reservas/blocs/autenticacao.bloc.dart';
import 'package:gd_reservas/blocs/usuario.bloc.dart';
import 'package:gd_reservas/factories/repository.factory.dart';

class BlocFactory {
  static UsuarioBloc usuarioBloc() {
    return UsuarioBloc(RepositoryFactory.usuarioRepository());
  }

  static AutenticacaoBloc autenticacaoBloc() {
    return AutenticacaoBloc(RepositoryFactory.autenticacaoRepository());
  }
}
