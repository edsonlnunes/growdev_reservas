import 'package:flutter/material.dart';
import 'package:gd_reservas/controllers/menu.controller.dart';
import 'package:gd_reservas/layouts/widgets/menu_navegacao_item.widget.dart';
import 'package:gd_reservas/models/menu_item.dart';
import 'package:gd_reservas/themes/theme.dart';
import 'package:provider/provider.dart';

class MenuNavegacao extends StatefulWidget {
  @override
  MenuNavegacaoState createState() {
    return new MenuNavegacaoState();
  }
}

class MenuNavegacaoState extends State<MenuNavegacao>
    with SingleTickerProviderStateMixin {
  double maxWidth;
  double minWidth;
  bool menuRecolhido = true;
  Size screen;
  AnimationController _animationController;
  Animation<double> widthAnimation;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    maxWidth = MediaQuery.of(context).size.width * .55;
    minWidth = MediaQuery.of(context).size.width * .18;
    widthAnimation = Tween<double>(begin: minWidth, end: maxWidth)
        .animate(_animationController);
  }

  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<MenuController>(context);
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, widget) => getWidget(context, widget, controller),
    );
  }

  Widget getWidget(context, Widget widget, MenuController menuController) {
    return Material(
      elevation: 10,
      child: Container(
        width: widthAnimation.value,
        color: kColorGDBackgroundWidgets,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 5,
            ),
            Expanded(
              child: ListView.separated(
                itemCount: menuItens.length,
                separatorBuilder: (context, index) {
                  return Divider(
                    height: 5.0,
                    color: kColorGDCinza,
                  );
                },
                itemBuilder: (context, index) {
                  return MenuNavegacaoItem(
                    selecionado: menuController.menuSelecionado.value == index,
                    menuItem: menuItens[index],
                    fechado: menuRecolhido,
                    minWidth: minWidth,
                    maxWidth: maxWidth,
                    animationController: _animationController,
                    onTap: () {
                      setState(() {
                        if (!menuRecolhido) {
                          menuController.alterarMenu(index);
                        }

                        menuRecolhido = !menuRecolhido;

                        menuRecolhido
                            ? _animationController.reverse()
                            : _animationController.forward();
                      });
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
