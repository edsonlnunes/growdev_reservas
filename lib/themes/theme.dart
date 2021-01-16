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

Color kColorGDLaranja = Color.fromRGBO(225, 110, 14, 1);
Color kColorGDCinza = Color.fromRGBO(153, 156, 157, 1);
Color kColorGDCinzaEscro = Color.fromRGBO(102, 106, 107, 1);

Color kGDButtonColor = Color.fromRGBO(225, 110, 14, 1);
Color kGDBackgroundColor = Color.fromRGBO(248, 248, 248, 1);
Color kGDAccentColor = Color.fromRGBO(225, 255, 255, 1);
Color kGDprimaryColor = Color.fromRGBO(30, 57, 93, 1);

ThemeData growDevTheme() {
  return ThemeData(
    primaryColor: kGDprimaryColor,
    backgroundColor: kGDBackgroundColor,
    scaffoldBackgroundColor: kGDBackgroundColor,
    accentColor: kGDAccentColor,
    buttonColor: kGDButtonColor,
    // iconTheme: IconThemeData(
    //   color: cinzaEscuro,
    // ),
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
