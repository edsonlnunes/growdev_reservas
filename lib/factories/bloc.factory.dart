import 'package:gd_reservas/factories/repository.factory.dart';
import '../bloc/autenticacao.bloc.dart';

class BlocFactory {
  static AutenticacaoBloc autenticacaoBloc() {
    return AutenticacaoBloc(RepositoryFactory.autenticacaoRepository());
  }
}
