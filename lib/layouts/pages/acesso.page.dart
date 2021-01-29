import 'package:flutter/material.dart';
import 'package:gd_reservas/factories/controller.factory.dart';
import 'package:gd_reservas/layouts/pages/home.page.dart';
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
              Builder(
                builder: (ctx) => FlipCard(
                  key: cardKey,
                  flipOnTouch: false,
                  front: LoginWidget(
                    processandoAutenticacao:
                        appController.processandoAutenticacao,
                    paraCadastro: () => cardKey.currentState.toggleCard(),
                    entrar: (username, password) {
                      var usuario = Usuario(
                          nome: null,
                          senha: password,
                          tipo: null,
                          nomeUsuario: username);
                      appController.autenticacao(usuario).then(
                        (autenticado) {
                          if (autenticado) {
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(builder: (_) => HomePage()),
                                (route) => false);
                          } else {
                            Scaffold.of(ctx).showSnackBar(
                              SnackBar(
                                content: Text('Senha ou usuario inválido'),
                              ),
                            );
                          }
                        },
                      );
                    },
                  ),
                  back: CriarContaWidget(
                    paraLogin: () => cardKey.currentState.toggleCard(),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
