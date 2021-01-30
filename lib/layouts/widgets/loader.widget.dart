import 'package:flutter/material.dart';
import 'package:gd_reservas/utils/lang/localizacoes.dart';

class LoaderWidget extends StatelessWidget {
  final List itens;
  final Widget builder;

  const LoaderWidget({Key key, this.itens, this.builder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (itens == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else if (itens.isEmpty) {
      return Center(
        child: Text(Localizacoes.of(context).traduzir('NENHUM_ITEM')),
      );
    }
    return builder;
  }
}
