import 'package:gd_reservas/controller/app.controller.dart';
import 'package:gd_reservas/factories/bloc.factory.dart';

class ControllerFactory {
  static AppController appController() {
    return AppController(BlocFactory.autenticacaoBloc());
  }
}
