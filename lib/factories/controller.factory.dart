import 'package:gd_reservas/controllers/app.controller.dart';
import 'package:gd_reservas/factories/bloc.factory.dart';

class ControllerFactory {
  static AppController appController() {
    return AppController(
      BlocFactory.usuarioBloc(),
      BlocFactory.autenticacaoBloc(),
    );
  }
}
