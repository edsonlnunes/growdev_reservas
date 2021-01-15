import 'package:flutter/material.dart';
import 'package:gd_reservas/layouts/widgets/componente_criar_conta.widget.dart';
import 'package:gd_reservas/layouts/widgets/componente_login.widget.dart';
import 'package:gd_reservas/themes/theme.dart';
import 'package:flip_card/flip_card.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();
  // var flip = () => cardKey.currentState.toggleCard();
  @override
  Widget build(BuildContext context) {
    ThemeData theme = growDevTheme();
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top:40),
        child: Container(
          width: double.infinity,
          child: Column(
            children: [
              Image.asset("assets/img/Png/logo_transparente_laranja.png"),
              Text(
                "Agendamento \nde aulas",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: theme.accentColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 22,
                ),
              ),
              SizedBox(height: 20,),
              FlipCard(
                key: cardKey,
                flipOnTouch: false,
                front: ComponenteLogin(
                  paraCadastro: () => cardKey.currentState.toggleCard(), 
                  entrar: (){},
                ),
                back: ComponenteCriarConta(
                  paraLogin: () => cardKey.currentState.toggleCard(), 
                  cadastrar: (){},),
              )
            ],
          ),
        ),
      ),
      
    );
  }
}