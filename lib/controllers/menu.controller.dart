import 'package:flutter/material.dart';

class MenuController {
  ValueNotifier<int> menuSelecionado = ValueNotifier<int>(1);

  void alterarMenu(int menu) {
    menuSelecionado.value = menu;
  }
}
