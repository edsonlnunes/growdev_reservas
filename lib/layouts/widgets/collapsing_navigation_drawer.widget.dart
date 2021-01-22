import 'package:flutter/material.dart';
import 'package:gd_reservas/controllers/menu.controller.dart';
import 'package:gd_reservas/layouts/pages/home.page.dart';
import 'package:gd_reservas/layouts/widgets/collapsing_list_tile.widget.dart';
import 'package:gd_reservas/models/menu_item.dart';
import 'package:gd_reservas/themes/theme.dart';
import 'package:provider/provider.dart';

class CollapsingNavigationDrawer extends StatefulWidget {
  @override
  CollapsingNavigationDrawerState createState() {
    return new CollapsingNavigationDrawerState();
  }
}

class CollapsingNavigationDrawerState extends State<CollapsingNavigationDrawer>
    with SingleTickerProviderStateMixin {
  double maxWidth = 210;
  double minWidth = 70;
  bool isCollapsed = false;
  AnimationController _animationController;
  Animation<double> widthAnimation;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    widthAnimation = Tween<double>(begin: maxWidth, end: minWidth)
        .animate(_animationController);
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<MenuController>(context);
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, widget) => getWidget(context, widget, controller),
    );
  }

  Widget getWidget(context, widget, MenuController menuController) {
    return Material(
      elevation: 80.0,
      child: Container(
        width: widthAnimation.value,
        color: kGDBackgroundColor,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 5,
            ),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, counter) {
                  return Divider(
                    height: 5.0,
                    color: kColorGDCinza,
                  );
                },
                itemBuilder: (context, counter) {
                  return CollapsingListTile(
                    onTap: () {
                      setState(() {
                        if (!isCollapsed) {
                          currentSelectedIndex = counter;
                          menuController.alterarMenu(currentSelectedIndex);
                        }

                        isCollapsed = !isCollapsed;

                        isCollapsed
                            ? _animationController.forward()
                            : _animationController.reverse();
                      });
                    },
                    isSelected: currentSelectedIndex == counter,
                    title: menuItens[counter].titulo,
                    icon: menuItens[counter].icone,
                    animationController: _animationController,
                  );
                },
                itemCount: menuItens.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
