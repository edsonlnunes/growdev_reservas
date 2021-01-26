import 'package:gd_reservas/blocs/autenticacao.bloc.dart';
import 'package:gd_reservas/blocs/usuario_bloc.dart';
import 'package:gd_reservas/factories/repository.factory.dart';
import 'package:gd_reservas/factories/usuario_repository_factory.dart';

class BlocFactory {
  static UsuarioBloc usuarioBloc() {
    return UsuarioBloc(UsuarioRepositoryFactory.usuarioRepository());
  }

  static AutenticacaoBloc autenticacaoBloc() {
    return AutenticacaoBloc(RepositoryFactory.autenticacaoRepository());
  }
}
