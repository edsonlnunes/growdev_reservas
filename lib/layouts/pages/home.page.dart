import 'package:flutter/material.dart';
import 'package:gd_reservas/controllers/menu.controller.dart';
import 'package:gd_reservas/layouts/pages/aulas_agendadas.page.dart';
import 'package:gd_reservas/layouts/pages/aulas_disponiveis.page.dart';
import 'package:gd_reservas/layouts/pages/dados_usuario.page.dart';
import 'package:gd_reservas/layouts/widgets/collapsing_navigation_drawer.widget.dart';
import 'package:gd_reservas/layouts/widgets/custom_appbar.widget.dart';
import 'package:gd_reservas/models/menu_item.dart';
import 'package:provider/provider.dart';

int currentSelectedIndex = 0;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<MenuController>(context);
    return Scaffold(
      appBar: CustomAppBar(),
      body: Stack(
        children: [
          ValueListenableBuilder(
            valueListenable: controller.menuSelecionado,
            builder: (_, menuSelecionado, __) {
              return getTela(menuSelecionado);
            },
          ),
          CollapsingNavigationDrawer(),
        ],
      ),
    );
  }

  Widget getTela(int tela) {
    switch (tela) {
      case 0:
        return DadosUsuarioPage();
        break;
      case 1:
        return AulasDisponiveisPage();
        break;
      case 2:
        return AulasAgendadasPage();
        break;
    }
  }
}
