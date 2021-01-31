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

  Future<List<Aula>> buscarAulasAgendadas(String growdeverUid) async {
    return await aulaRepository.buscarAulasAgendadas(growdeverUid);
  }

  Future<bool> cancelarAgendamento(String uidAgendamento) async {
    return await aulaRepository.cancelarAgendamento(uidAgendamento);
  }
}
