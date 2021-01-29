class Growdever {
  String uid;
  String email;
  String telefone;
  String programa;

  Growdever({this.uid, this.email, this.telefone, this.programa});

  Map<String, dynamic> toJson() =>
      {"uid": uid, "email": email, "phone": telefone, "program": programa};

  Growdever.fromJson(Map<String, dynamic> json)
      : uid = json['growdever']['name'],
        email = json['growdever']['email'],
        telefone = json['growdever']['phone'],
        programa = json['growdever']['program'];
}
