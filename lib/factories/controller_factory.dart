import 'package:gd_reservas/controllers/app_controller.dart';
import 'package:gd_reservas/factories/bloc_factory.dart';

class ControllerFactory { 
  static AppController appController() {
    return AppController(BlocFactory.usuarioBloc());
  }
}
