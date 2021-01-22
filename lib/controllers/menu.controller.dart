import 'package:flutter/cupertino.dart';

class MenuController {
  ValueNotifier<int> menuSelecionado = ValueNotifier<int>(0);

  void alterarMenu(int menu) {
    menuSelecionado.value = menu;
  }
}
