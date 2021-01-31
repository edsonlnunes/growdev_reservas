import 'package:meta/meta.dart';

class Aula {
  final String uid;
  final String data;
  final String hora;
  final String status;
  final int vagas;
  final String uidAgendamento;

  Aula({
    @required this.data,
    @required this.hora,
    @required this.status,
    this.uid,
    this.vagas,
    this.uidAgendamento,
  });

  Aula.fromJson(Map<String, dynamic> json)
      : uid = json['uid'],
        data = json['data'],
        hora = json['hora'],
        status = json['status'],
        vagas = json['vagas'],
        uidAgendamento = null;

  Aula.fromJsonAgendamento(Map<String, dynamic> json)
      : uid = json['class']['uid'],
        data = json['class']['data'],
        hora = json['class']['hora'],
        status = json['class']['status'],
        vagas = json['class']['vagas'],
        uidAgendamento = json['uid'];
}
