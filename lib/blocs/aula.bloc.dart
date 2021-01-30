import '../contracts/aula_repository.contract.dart';
import '../models/aula.dart';

class AulaBloc {
  final IAulaRepository aulaRepository;

  AulaBloc(this.aulaRepository);

  Future<List<Aula>> buscarAulasDisponiveis() async {
    return await aulaRepository.buscarAulasDisponiveis();
  }

  Future<String> inscricaoAula(String growdeverUid, String classUid) async {
    return await aulaRepository.inscricaoAula(growdeverUid, classUid);
  }
}
