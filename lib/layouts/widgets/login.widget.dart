import 'package:flutter/material.dart';
import 'package:gd_reservas/factories/controller.factory.dart';
import 'package:gd_reservas/layouts/pages/home.page.dart';
import 'package:gd_reservas/layouts/widgets/circular_progress_indicator_button.widget.dart';
import 'package:gd_reservas/models/usuario.dart';
import 'package:gd_reservas/utils/lang/localizacoes.dart';

class LoginWidget extends StatefulWidget {
  final Function paraCadastro;
  // final Function(String username, String password) entrar;
  // final ValueNotifier<bool> processandoAutenticacao;

  const LoginWidget({Key key, this.paraCadastro
      // this.entrar,
      // this.processandoAutenticacao,
      })
      : super(key: key);

  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  @override
  Widget build(BuildContext context) {
    var appController = ControllerFactory.appController();
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
                (8.8 * MediaQuery.of(context).textScaleFactor + 40) /
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
                    valueListenable: appController.processandoAutenticacao,
                    builder: (BuildContext context, bool value, Widget child) {
                      return RaisedButton(
                        padding: EdgeInsets.all(tamanho.height * 1.7 / 100),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: value
                            ? CircularProgressIndicatorButtonWidget()
                            : Text(
                                Localizacoes.of(context)
                                    .traduzir('ENTRAR')
                                    .toUpperCase(),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: tamanho.height * 2.2 / 100,
                                ),
                              ),
                        onPressed: appController.processandoAutenticacao.value
                            ? null
                            : () {
                                if (usernameController.text.isNotEmpty &&
                                    passwordController.text.isNotEmpty) {
                                  var usuario = Usuario(
                                    username: usernameController.text,
                                    password: passwordController.text,
                                  );
                                  appController.autenticacao(usuario).then(
                                    (autenticado) {
                                      if (autenticado) {
                                        Navigator.of(context)
                                            .pushAndRemoveUntil(
                                                MaterialPageRoute(
                                                    builder: (_) => HomePage()),
                                                (route) => false);
                                      } else {
                                        Scaffold.of(context).showSnackBar(
                                          SnackBar(
                                            content: Text(
                                                'Senha ou usuario inválido'),
                                          ),
                                        );
                                      }
                                    },
                                  );
                                }
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
