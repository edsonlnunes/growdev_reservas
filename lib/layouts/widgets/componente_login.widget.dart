import 'package:flutter/material.dart';
import 'package:gd_reservas/themes/theme.dart';

class ComponenteLogin extends StatelessWidget {
  final Function paraCadastro;
  final Function entrar;

  const ComponenteLogin({Key key, this.paraCadastro, this.entrar}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    ThemeData theme = growDevTheme();
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
              color: theme.primaryColor,
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
                          hintText: 'Usuário*',
                          fillColor: theme.cardColor,
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
                          fillColor: theme.cardColor,
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
                      'ENTRAR',
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
              'Ainda não possui uma conta?',
              style: TextStyle(fontSize: tamanho.height * 2.2 / 100),
            ),
            onTap: paraCadastro,
          ),
        ],
      ),
    );
  }
}