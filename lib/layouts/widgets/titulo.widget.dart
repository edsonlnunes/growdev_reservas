import 'package:flutter/material.dart';
import 'package:gd_reservas/themes/theme.dart';
import 'package:gd_reservas/utils/lang/localizacoes.dart';

class TituloWidget extends StatelessWidget {
  final String titulo;

  TituloWidget(this.titulo);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.09,
      width: double.infinity,
      color: kColorGDBackgroundWidgets,
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
