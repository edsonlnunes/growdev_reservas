class MenuItem {
  String titulo;
  String icone;
  String iconeSelecionado;

  MenuItem({this.titulo, this.icone, this.iconeSelecionado});
}

List<MenuItem> menuItens = [
  MenuItem(
    titulo: "DADOS_PESSOAIS",
    icone: "assets/img/png/person-cinza.png",
    iconeSelecionado: "assets/img/png/person-azul.png",
  ),
  MenuItem(
    titulo: "AULAS_DISPONIVEIS",
    icone: "assets/img/png/lista-cinza.png",
    iconeSelecionado: "assets/img/png/lista-azul.png",
  ),
  MenuItem(
    titulo: "AULAS_AGENDADAS",
    icone: "assets/img/png/calendario-cinza.png",
    iconeSelecionado: "assets/img/png/calendario-azul.png",
  ),
];
