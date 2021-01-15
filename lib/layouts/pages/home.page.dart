import 'package:flutter/material.dart';
import 'package:gd_reservas/layouts/widgets/componente_criar_conta.widget.dart';
import 'package:gd_reservas/layouts/widgets/componente_login.widget.dart';
import 'package:gd_reservas/themes/theme.dart';
import 'package:flip_card/flip_card.dart';

GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();
class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
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
              Image.asset("assets/img/png/logo_transparente_laranja.png"),
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
                front: ComponenteLogin(),
                back: ComponenteCriarConta(),
              )
            ],
          ),
        ),
      ),
      
    );
  }
}