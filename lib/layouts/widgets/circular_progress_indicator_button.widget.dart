import 'package:flutter/material.dart';
import 'package:gd_reservas/themes/theme.dart';

class CircularProgressIndicatorButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: SizedBox(
        child: CircularProgressIndicator(
          backgroundColor: kGDprimaryColor,
          strokeWidth: 2.0,
        ),
        height: 23.0,
        width: 23.0,
      )),
    );
  }
}
