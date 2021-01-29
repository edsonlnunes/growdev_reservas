import '../models/aula.dart';

abstract class  IAulaRepository {

  Future<List<Aula>> buscarAulasDisponiveis();

  Future<String> inscricaoAula(String growdeverUid, String classUid);

}