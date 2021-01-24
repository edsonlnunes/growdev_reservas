class RespostaHttp {
  int statusCode;
  Map<String, dynamic> data;
  dynamic error;

  RespostaHttp({this.statusCode, this.data, this.error});
}
