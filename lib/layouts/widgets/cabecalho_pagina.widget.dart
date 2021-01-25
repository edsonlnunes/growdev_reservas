import 'package:flutter/material.dart';
import 'package:gd_reservas/utils/lang/localizacoes.dart';
import 'package:gd_reservas/utils/tela.dart';

class CabecalhoPagina extends StatelessWidget {
  String titulo;

  CabecalhoPagina(this.titulo);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Tela.getAltura() * 0.09,
      width: double.infinity,
      color: Colors.white,
      child: Center(
        child: Text(
          Localizacoes.of(context).traduzir(titulo),
          style: Theme.of(context).textTheme.headline6.copyWith(
                color: Theme.of(context).primaryColor,
              ),
        ),
      ),
    );
  }
}
