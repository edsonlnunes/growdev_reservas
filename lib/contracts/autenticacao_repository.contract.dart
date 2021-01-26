import 'package:gd_reservas/models/usuario.dart';

abstract class IAutenticacaoRepository {
  Future<Usuario> login(Usuario usuario);
}
