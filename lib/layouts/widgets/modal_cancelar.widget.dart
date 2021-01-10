import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

modalShowDialog(BuildContext context) {
  return Alert(
    context: context,
    type: AlertType.none,
    title: '',
    desc: "Você tem certeza que quer cancelar este agendamento?",
    closeIcon: Icon(
      Icons.close,
      color: Color.fromRGBO(225, 110, 14, 1),
    ),
    buttons: [
      DialogButton(
        width: 250,
        height: 50,
        child: Text(
          "Confirmar".toUpperCase(),
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        onPressed: () => Navigator.pop(context),
        color: Color.fromRGBO(225, 110, 14, 1),
      ),
    ],
  ).show();
}
