import 'package:flutter/material.dart';

Color kColorGDLaranja = Color.fromRGBO(225, 110, 14, 1);
Color kColorGDCinza = Color.fromRGBO(153, 156, 157, 1);
Color kColorGDCinzaEscuro = Color.fromRGBO(102, 106, 107, 1);

Color kGDButtonColor = Color.fromRGBO(225, 110, 14, 1);
Color kGDBackgroundColor = Color.fromRGBO(248, 248, 248, 1);
Color kGDAccentColor = Color.fromRGBO(225, 255, 255, 1);
Color kGDprimaryColor = Color.fromRGBO(30, 57, 93, 1);

Color kGDselectedColor = Color(0xFF4AC8EA);

TextStyle listTitleDefaultTextStyle = TextStyle(
    color: kColorGDCinzaEscuro, fontSize: 14.0, fontWeight: FontWeight.w600);
TextStyle listTitleSelectedTextStyle = TextStyle(
    color: kGDprimaryColor, fontSize: 14.0, fontWeight: FontWeight.w600);

ThemeData growDevTheme() {
  return ThemeData(
    primaryColor: kGDprimaryColor,
    backgroundColor: kGDBackgroundColor,
    scaffoldBackgroundColor: kGDBackgroundColor,
    accentColor: kGDAccentColor,
    buttonColor: kGDButtonColor,
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
