import 'package:flutter/material.dart';

// MaterialColor laranja = MaterialColor(
//   Color.fromRGBO(225, 115, 37, 1).value,
//   {
//     50: Color.fromRGBO(225, 115, 37, .1),
//     100: Color.fromRGBO(225, 115, 37, .2),
//     200: Color.fromRGBO(225, 115, 37, .3),
//     300: Color.fromRGBO(225, 115, 37, .4),
//     400: Color.fromRGBO(225, 115, 37, .5),
//     500: Color.fromRGBO(225, 115, 37, .6),
//     600: Color.fromRGBO(225, 115, 37, .7),
//     700: Color.fromRGBO(225, 115, 37, .8),
//     800: Color.fromRGBO(225, 115, 37, .9),
//     900: Color.fromRGBO(225, 115, 37, 1),
//   },
// );

Color branco = Color.fromRGBO(225, 255, 255, 1);
Color laranja = Color.fromRGBO(225, 110, 14, 1);
Color cinza = Color.fromRGBO(153, 156, 157, 1);
Color brancoGelo = Color.fromRGBO(245, 247, 246, 1);
Color cinzaEscuro = Color.fromRGBO(102, 106, 107, 1);
Color azul = Color.fromRGBO(30, 57, 93, 1);

ThemeData growDevTheme() {
  return ThemeData(
    primaryColor: azul,
    splashColor: cinza,
    accentColor: laranja,
    cardColor: brancoGelo,
    buttonColor: laranja,
    iconTheme: IconThemeData(
      color: cinzaEscuro,
    ),
    textTheme: TextTheme(
      bodyText1: new TextStyle(
        fontFamily: "Poppins",
      ),
      bodyText2: TextStyle(
        fontFamily: "Poppins",
      ),
      button: TextStyle(
        fontFamily: "Poppins",
      ),
      caption: TextStyle(
        fontFamily: "Poppins",
      ),
      headline1: TextStyle(
        fontFamily: "Poppins",
      ),
      headline2: TextStyle(
        fontFamily: "Poppins",
      ),
      headline3: TextStyle(
        fontFamily: "Poppins",
      ),
      headline4: TextStyle(
        fontFamily: "Poppins",
      ),
      overline: TextStyle(
        fontFamily: "Poppins",
      ),
      subtitle1: TextStyle(
        fontFamily: "Poppins",
      ),
      subtitle2: TextStyle(
        fontFamily: "Poppins",
      ),
      headline6: TextStyle(
        fontFamily: "Poppins",
      ),
    ),
  );
}
