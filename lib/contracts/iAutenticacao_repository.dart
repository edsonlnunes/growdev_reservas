import 'package:dio/dio.dart';
import 'package:gd_reservas/models/usuario.dart';

abstract class IAutenticacaoRepository {
  Future<Response> login(Usuario usuario);
}