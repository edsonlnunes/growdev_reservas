import 'package:flutter/material.dart';

class Tela {
  static double height;
  static double width;

  Tela(Size tam) {
    height = tam.height;
    width = tam.width;
  }

  static double getAltura() {
    return height;
  }

  static double getLargura() {
    return width;
  }
}
