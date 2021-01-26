import 'package:flutter/material.dart';
import 'package:gd_reservas/factories/controller.factory.dart';
import 'package:gd_reservas/utils/lang/localizacoes.dart';

class LoginWidget extends StatefulWidget {
  final Function paraCadastro;
  final Function(String username, String password) entrar;
  final ValueNotifier<bool> processandoAutenticacao;

  const LoginWidget({
    Key key,
    this.paraCadastro,
    this.entrar,
    this.processandoAutenticacao,
  }) : super(key: key);

  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  @override
  Widget build(BuildContext context) {
    var usernameController = TextEditingController();
    var passwordController = TextEditingController();
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
                        controller: usernameController,
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
                        controller: passwordController,
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
                  child: ValueListenableBuilder(
                    valueListenable: widget.processandoAutenticacao,
                    builder: (BuildContext context, bool value, Widget child) {
                      return RaisedButton(
                        padding: EdgeInsets.all(tamanho.height * 1.7 / 100),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: value
                            ? CircularProgressIndicator(
                                strokeWidth: 1,
                              )
                            : Text(
                                Localizacoes.of(context)
                                    .traduzir('ENTRAR')
                                    .toUpperCase(),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: tamanho.height * 2.2 / 100,
                                ),
                              ),
                        onPressed: () {
                          widget.entrar(
                            usernameController.text,
                            passwordController.text,
                          );
                        },
                      );
                    },
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
            onTap: widget.paraCadastro,
          ),
        ],
      ),
    );
  }
}
