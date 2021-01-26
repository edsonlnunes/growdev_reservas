import 'package:flutter/material.dart';
import 'package:gd_reservas/utils/lang/localizacoes.dart';

class Titulo extends StatelessWidget {
  String titulo;

  Titulo(this.titulo);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.09,
      width: double.infinity,
      color: Theme.of(context).accentColor,
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
