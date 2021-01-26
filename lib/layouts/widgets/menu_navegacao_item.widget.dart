import 'package:flutter/material.dart';
import 'package:gd_reservas/models/menu_item.dart';
import 'package:gd_reservas/themes/theme.dart';
import 'package:gd_reservas/utils/lang/localizacoes.dart';

class MenuNavegacaoItem extends StatefulWidget {
  final MenuItem menuItem;
  final bool fechado;
  final bool selecionado;
  final double minWidth;
  final double maxWidth;
  final AnimationController animationController;
  final Function onTap;

  MenuNavegacaoItem(
      {@required this.menuItem,
      @required this.fechado,
      @required this.animationController,
      @required this.minWidth,
      @required this.maxWidth,
      this.selecionado = false,
      this.onTap});

  @override
  _MenuNavegacaoItemState createState() => _MenuNavegacaoItemState();
}

class _MenuNavegacaoItemState extends State<MenuNavegacaoItem> {
  Animation<double> widthAnimation, sizedBoxAnimation, sizeTextAnimation;

  MenuItem menu;

  @override
  void initState() {
    super.initState();

    widthAnimation = Tween<double>(begin: widget.minWidth, end: widget.maxWidth)
        .animate(widget.animationController);

    sizedBoxAnimation =
        Tween<double>(begin: 0, end: 10).animate(widget.animationController);

    sizeTextAnimation =
        Tween<double>(begin: 1, end: 14).animate(widget.animationController);

    menu = widget.menuItem;
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        width: widthAnimation.value,
        padding: EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            Container(
              width: size.width * .18,
              height: size.height * .05,
              child: Center(
                child: Image.asset(
                  widget.selecionado ? menu.iconeSelecionado : menu.icone,
                  fit: BoxFit.contain,
                  width: size.width * .085,
                ),
              ),
            ),
            if (widthAnimation.value >= (size.width * .4))
              Text(
                Localizacoes.of(context).traduzir(menu.titulo),
                style: widget.selecionado
                    ? TextStyle(
                        color: kGDprimaryColor,
                        fontSize: sizeTextAnimation.value,
                        fontWeight: FontWeight.w600)
                    : TextStyle(
                        color: kColorGDCinzaEscuro,
                        fontSize: sizeTextAnimation.value,
                        fontWeight: FontWeight.w600),
              ),
          ],
        ),
      ),
    );
  }
}
