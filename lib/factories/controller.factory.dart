import '../controllers/app.controller.dart';
import '../controllers/aula.controller.dart';
import 'bloc.factory.dart';

class ControllerFactory {
  static AppController appController() {
    return AppController(
      BlocFactory.usuarioBloc(),
      BlocFactory.autenticacaoBloc(),
    );
  }

  static AulaController aulaController() {
    return AulaController(
      BlocFactory.usuarioBloc(),
      BlocFactory.aulaBloc(),
    );
  }
}