import 'package:flutter/material.dart';
import 'package:gd_reservas/factories/controller.factory.dart';
import 'package:gd_reservas/layouts/pages/aulas_disponiveis.page.dart';
import 'package:gd_reservas/layouts/widgets/criar_conta.widget.dart';
import 'package:gd_reservas/layouts/widgets/login.widget.dart';
import 'package:gd_reservas/models/usuario.dart';
import 'package:gd_reservas/themes/theme.dart';
import 'package:flip_card/flip_card.dart';
import 'package:gd_reservas/utils/lang/localizacoes.dart';

class AcessoPage extends StatelessWidget {
  final cardKey = GlobalKey<FlipCardState>();

  @override
  Widget build(BuildContext context) {
    var appController = ControllerFactory.appController();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 40),
        child: Container(
          width: double.infinity,
          child: Column(
            children: [
              Image.asset(
                "assets/img/png/logo_transparente_laranja.png",
              ),
              Text(
                Localizacoes.of(context).traduzir('TITULO_APP_LOGIN'),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: kColorGDLaranja,
                  fontWeight: FontWeight.w500,
                  fontSize: 22,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              FlipCard(
                key: cardKey,
                flipOnTouch: false,
                front: LoginWidget(
                  paraCadastro: () => cardKey.currentState.toggleCard(),
                  entrar: (username, password) {
                    var usuario = Usuario(
                        name: null,
                        password: password,
                        type: null,
                        username: password);
                    appController.autenticacao(usuario);

                    // Navigator.of(context).pushAndRemoveUntil(
                    //     MaterialPageRoute(
                    //         builder: (_) => AulasDisponiveisPage()),
                    //     (route) => false);
                  },
                ),
                back: CriarContaWidget(
                  paraLogin: () => cardKey.currentState.toggleCard(),
                  cadastrar: () {
                    cardKey.currentState.toggleCard();
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
