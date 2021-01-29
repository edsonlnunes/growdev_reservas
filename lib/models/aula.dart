import 'package:meta/meta.dart';

class Aula {
  final String uid;
  final String data;
  final String hora;
  final String status;
  final int vagas;

  Aula({
    @required this.data,
    @required this.hora,
    @required this.status,
    this.uid,
    this.vagas,
  });

  Aula.fromJson(Map<String, dynamic> json)
      : uid = json['uid'],
        data = json['data'],
        hora = json['hora'],
        status = json['status'],
        vagas = json['vagas'];
}
