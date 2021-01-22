import 'package:flutter/material.dart';

class MenuItem {
  String titulo;
  IconData icone;

  MenuItem({this.titulo, this.icone});
}

List<MenuItem> menuItens = [
  MenuItem(titulo: "Dados Pessoais", icone: Icons.person),
  MenuItem(titulo: "Aulas Disponíveis", icone: Icons.menu),
  MenuItem(titulo: "Aulas Agendadas", icone: Icons.calendar_today),
];
