import 'dart:async';
import 'package:flutter/material.dart';
import 'localizacoes.dart';

class DeterminarLocalizacao extends LocalizationsDelegate<Localizacoes> {
  const DeterminarLocalizacao();

  @override
  bool isSupported(Locale regiao) => ['pt', 'en'].contains(regiao.languageCode);

  @override
  Future<Localizacoes> load(Locale regiao) async {
    Localizacoes localizacao = new Localizacoes(regiao);

    await localizacao.load();

    return localizacao;
  }

  @override
  bool shouldReload(DeterminarLocalizacao old) => false;
}
