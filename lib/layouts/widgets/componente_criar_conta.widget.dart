import 'package:flutter/material.dart';

class ComponenteCriarConta extends StatelessWidget {
  final Function noToqueParaLogin;

  const ComponenteCriarConta({Key key, this.noToqueParaLogin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tamanho = MediaQuery.of(context).size;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 3 / 5,
          height: tamanho.height *
              (8.8 * MediaQuery.of(context).textScaleFactor + 35) /
              100,
          padding: EdgeInsets.symmetric(
              horizontal: tamanho.width * 5 / 100,
              vertical: tamanho.height * 4 / 100),
          decoration: BoxDecoration(
            color: Color(0xFF2B385B),
            borderRadius: BorderRadius.circular(tamanho.height * 2 / 100),
          ),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    TextField(
                      style: TextStyle(fontSize: tamanho.height * 2.2 / 100),
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding:
                            EdgeInsets.all(tamanho.height * 1.7 / 100),
                        hintText: 'Nome completo*',
                        fillColor: Colors.white,
                        filled: true,
                        border: InputBorder.none,
                      ),
                    ),
                    SizedBox(height: tamanho.height * 2.9 / 100),
                    TextField(
                      style: TextStyle(fontSize: tamanho.height * 2.2 / 100),
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding:
                            EdgeInsets.all(tamanho.height * 1.7 / 100),
                        hintText: 'Usuário*',
                        fillColor: Colors.white,
                        filled: true,
                        border: InputBorder.none,
                      ),
                    ),
                    SizedBox(height: tamanho.height * 2.9 / 100),
                    TextField(
                      obscureText: true,
                      style: TextStyle(fontSize: tamanho.height * 2.2 / 100),
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding:
                            EdgeInsets.all(tamanho.height * 1.7 / 100),
                        hintText: 'Senha*',
                        fillColor: Colors.white,
                        filled: true,
                        border: InputBorder.none,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                child: RaisedButton(
                  padding: EdgeInsets.all(tamanho.height * 1.7 / 100),
                  color: Color(0xFFE16E0E),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    'CADASTRE-SE',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: tamanho.height * 2.2 / 100,
                    ),
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: tamanho.height * 3 / 100),
        GestureDetector(
          child: Text(
            'Já possui uma conta?',
            style: TextStyle(fontSize: tamanho.height * 2.2 / 100),
          ),
          onTap: noToqueParaLogin,
        ),
      ],
    );
  }
}