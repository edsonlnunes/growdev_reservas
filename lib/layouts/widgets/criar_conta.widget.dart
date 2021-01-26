import 'package:flutter/material.dart';
import 'package:gd_reservas/factories/controller.factory.dart';
import 'package:gd_reservas/layouts/widgets/circular_progress_indicator_button.widget.dart';
import 'package:gd_reservas/models/usuario.dart';
import 'package:gd_reservas/themes/theme.dart';
import 'package:gd_reservas/utils/lang/localizacoes.dart';

class CriarContaWidget extends StatefulWidget {
  final Function paraLogin;

  CriarContaWidget({this.paraLogin});

  @override
  _CriarContaWidgetState createState() => _CriarContaWidgetState();
}

class _CriarContaWidgetState extends State<CriarContaWidget> {
  Usuario usuario = Usuario(
    type: 'Growdever',
  );
  bool loading = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final appController = ControllerFactory.appController();
    final tamanho = MediaQuery.of(context).size;

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 3 / 5,
            height: tamanho.height *
                (8.8 * MediaQuery.of(context).textScaleFactor + 40.0) /
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
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          validator: (valor) {
                            var type = 'name';
                            return appController.validarDados(valor, type);
                          },
                          onSaved: (valor) => usuario.name = valor,
                          style:
                              TextStyle(fontSize: tamanho.height * 2.2 / 100),
                          decoration: InputDecoration(
                            errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: kColorGDLaranja, width: 2)),
                            errorStyle:
                                TextStyle(height: 0.5, color: kColorGDLaranja),
                            isDense: true,
                            contentPadding:
                                EdgeInsets.all(tamanho.height * 1.7 / 100),
                            hintText: Localizacoes.of(context)
                                .traduzir('NOME_COMPLETO_OBRIGATORIO'),
                            fillColor: Colors.white,
                            filled: true,
                            border: InputBorder.none,
                          ),
                        ),
                        SizedBox(height: tamanho.height * 2.9 / 100),
                        TextFormField(
                          validator: (valor) {
                            var type = 'username';
                            return appController.validarDados(valor, type);
                          },
                          onSaved: (valor) => usuario.username = valor,
                          style:
                              TextStyle(fontSize: tamanho.height * 2.2 / 100),
                          decoration: InputDecoration(
                            errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: kColorGDLaranja, width: 2)),
                            errorStyle:
                                TextStyle(height: 0.5, color: kColorGDLaranja),
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
                        TextFormField(
                          validator: (valor) {
                            var type = 'password';
                            return appController.validarDados(valor, type);
                          },
                          onSaved: (valor) => usuario.password = valor,
                          obscureText: true,
                          style:
                              TextStyle(fontSize: tamanho.height * 2.2 / 100),
                          decoration: InputDecoration(
                            errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: kColorGDLaranja, width: 2)),
                            errorStyle:
                                TextStyle(height: 0.5, color: kColorGDLaranja),
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
                ),
                Container(
                  width: double.infinity,
                  child: RaisedButton(
                      padding: EdgeInsets.all(tamanho.height * 1.7 / 100),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: !loading
                          ? Text(
                              Localizacoes.of(context)
                                  .traduzir('CADASTRAR_SE')
                                  .toUpperCase(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: tamanho.height * 2.2 / 100,
                              ),
                            )
                          : CircularProgressIndicatorButtonWidget(),
                      onPressed: () async {
                        setState(() {
                          loading = true;
                        });
                        if (!_formKey.currentState.validate()) {
                          Scaffold.of(context).showSnackBar(
                              SnackBar(content: Text('Campo(s) inválido(s)')));
                        } else {
                          _formKey.currentState.save();
                          var criou =
                              await appController.criarConta(context, usuario);
                          if (criou) {
                            Future.delayed(Duration(seconds: 1),
                                () => appController.proximaTela(context));
                          }
                        }
                        print('setstate');
                        setState(() {
                          loading = false;
                        });
                      }),
                ),
              ],
            ),
          ),
          SizedBox(height: tamanho.height * 3 / 100),
          GestureDetector(
            child: Text(
              Localizacoes.of(context).traduzir('POSSUI_CONTA'),
              style: TextStyle(
                fontSize: tamanho.height * 2.2 / 100,
                color: Theme.of(context).primaryColor,
              ),
            ),
            onTap: widget.paraLogin,
          ),
        ],
      ),
    );
  }
}
