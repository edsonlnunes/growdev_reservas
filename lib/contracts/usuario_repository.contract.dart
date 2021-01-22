import 'package:dio/dio.dart';
import 'package:gd_reservas/models/usuario.dart';

abstract class IUsuarioRepository {
  Future<Response> criarConta(Usuario usuario);
}
