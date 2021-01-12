import 'package:meta/meta.dart';

class Aula {
  final String data;
  final String hora;
  final String status;
  final int vagas;

  Aula({
    @required this.data,
    @required this.hora,
    @required this.status,
    this.vagas,
  });
}