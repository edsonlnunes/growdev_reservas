import 'package:gd_reservas/models/resposta_http.dart';
import 'package:gd_reservas/models/usuario.dart';

abstract class IUsuarioRepository {
  Future<RespostaHttp> criarConta(Usuario usuario);
}
