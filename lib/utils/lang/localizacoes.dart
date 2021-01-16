import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Localizacoes {
  Localizacoes(this.regiao);

  final Locale regiao;

  static Localizacoes of(BuildContext context) {
    return Localizations.of<Localizacoes>(context, Localizacoes);
  }

  Map<String, String> _frases;

  Future<bool> load() async {
    String data = await rootBundle
        .loadString('assets/lang/${this.regiao.languageCode}.json');
    Map<String, dynamic> _result = json.decode(data);

    this._frases = new Map();
    _result.forEach((String key, dynamic value) {
      this._frases[key] = value.toString();
    });

    return true;
  }

  String traduzir(String key) {
    final traducao = this._frases[key];
    return traducao != null ? traducao : '***SEM_TRADUCAO***';
  }
}
