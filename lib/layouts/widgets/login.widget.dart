import 'package:flutter/material.dart';
import 'package:gd_reservas/utils/lang/localizacoes.dart';

class LoginWidget extends StatelessWidget {
  final Function paraCadastro;
  final Function entrar;

  const LoginWidget({
    Key key,
    this.paraCadastro,
    this.entrar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tamanho = MediaQuery.of(context).size;

    return Center(
      child: Column(
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
              color: Theme.of(context).primaryColor,
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
                          hintText: Localizacoes.of(context)
                              .traduzir('USUARIO_OBRIGATORIO'),
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
                          hintText: Localizacoes.of(context)
                              .traduzir('SENHA_OBRIGATORIO'),
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
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      Localizacoes.of(context).traduzir('ENTRAR').toUpperCase(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: tamanho.height * 2.2 / 100,
                      ),
                    ),
                    onPressed: entrar,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: tamanho.height * 3 / 100),
          GestureDetector(
            child: Text(
              Localizacoes.of(context).traduzir('SEM_CONTA'),
              style: TextStyle(
                fontSize: tamanho.height * 2.2 / 100,
                color: Theme.of(context).primaryColor,
              ),
            ),
            onTap: paraCadastro,
          ),
        ],
      ),
    );
  }
}
