import 'package:dio/dio.dart';
import 'package:gd_reservas/models/resposta_http.dart';
import 'package:gd_reservas/models/usuario.dart';

abstract class IAutenticacaoRepository {
  Future<Usuario> login(Usuario usuario);
}
