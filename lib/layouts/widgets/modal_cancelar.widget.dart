import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

modalShowDialog(BuildContext context) {
  return Alert(
    style: AlertStyle(
      descStyle: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.bold),
    ),
    context: context,
    type: AlertType.none,
    title: '',
    desc: "Você tem certeza que quer cancelar este agendamento?",
    closeIcon: Icon(
      Icons.close,
      color: Theme.of(context).buttonColor,
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
        color: Theme.of(context).buttonColor,
      ),
    ],
  ).show();
}
