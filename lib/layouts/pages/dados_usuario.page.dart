import 'package:flutter/material.dart';
import 'package:gd_reservas/factories/controller.factory.dart';
import 'package:gd_reservas/layouts/widgets/titulo.widget.dart';
import 'package:gd_reservas/layouts/widgets/modal_formulario.widget.dart';
import 'package:gd_reservas/layouts/widgets/rich_text_label.widget.dart';
import 'package:gd_reservas/themes/theme.dart';
import 'package:gd_reservas/utils/global.dart';
import 'package:gd_reservas/utils/lang/localizacoes.dart';
import 'package:gd_reservas/models/usuario.dart';

class DadosUsuarioPage extends StatefulWidget {
  @override
  _DadosUsuarioPageState createState() => _DadosUsuarioPageState();
}

class _DadosUsuarioPageState extends State<DadosUsuarioPage> {
  final Usuario usu = kUsuario;

  // @override
  // void initState() {
  //   usu = kUsuario;
  // }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(70, 0, 0, 0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TituloWidget('DADOS_USUARIO'),
            Card(
              margin: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 30,
                ),
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundImage:
                          NetworkImage('https://placeimg.com/200/200/people'),
                      radius: 40,
                    ),
                    SizedBox(height: 20),
                    Text(
                      kUsuario.nome,
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Column(
                      children: [
                        RichTextLabel(
                          label: Localizacoes.of(context).traduzir('USUARIO'),
                          value: usu.nomeUsuario,
                        ),
                        RichTextLabel(
                          label: Localizacoes.of(context)
                              .traduzir('PROGRAMA_GROWDEV'),
                          value: usu.growdever.programa,
                        ),
                        RichTextLabel(
                          label: Localizacoes.of(context).traduzir('EMAIL'),
                          value: usu.growdever.email,
                        ),
                        RichTextLabel(
                          label: Localizacoes.of(context).traduzir('TELEFONE'),
                          value: usu.growdever.telefone,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.edit,
                            size: 32,
                            color: kColorGDLaranja,
                          ),
                          onPressed: () {
                            setState(() {
                              atualizarDados(context);
                            });
                          },
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.lock,
                            size: 32,
                            color: kColorGDLaranja,
                          ),
                          onPressed: () => atualizarSenha(context),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void atualizarSenha(BuildContext ctx) {
    final TextEditingController senhaAtualController = TextEditingController();
    final TextEditingController novaSenhaController = TextEditingController();
    var appController = ControllerFactory.appController();
    showDialog(
      context: ctx,
      builder: (BuildContext context) {
        return ModalFormularioWidget(
          textoBotao: Localizacoes.of(context).traduzir('ATUALIZAR_SENHA'),
          textFields: [
            TextFormField(
              controller: senhaAtualController,
              decoration: InputDecoration(
                labelText: Localizacoes.of(context).traduzir('SENHA_ATUAL'),
                fillColor: kGDBackgroundColor,
                filled: true,
              ),
            ),
            TextFormField(
              controller: novaSenhaController,
              decoration: InputDecoration(
                labelText: Localizacoes.of(context).traduzir('NOVA_SENHA'),
                fillColor: kGDBackgroundColor,
                filled: true,
              ),
            )
          ],
          callback: () async {
            var editUsuario = kUsuario;
            editUsuario.senha = senhaAtualController.text;
            editUsuario.novaSenha = novaSenhaController.text;
            await appController.atualizarSenha(ctx, editUsuario);

            Navigator.of(context).pop();
          },
        );
      },
    );
  }

  void atualizarDados(BuildContext ctx) {
    final TextEditingController emailController =
        TextEditingController(text: usu.growdever.email);
    final TextEditingController telefoneController =
        TextEditingController(text: usu.growdever.telefone);
    var appController = ControllerFactory.appController();

    showDialog(
      context: ctx,
      builder: (BuildContext context) {
        return ModalFormularioWidget(
          textoBotao:
              Localizacoes.of(context).traduzir('ATUALIZAR_INFORMACOES'),
          textFields: [
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: Localizacoes.of(context).traduzir('EMAIL'),
                fillColor: kGDBackgroundColor,
                filled: true,
              ),
            ),
            TextFormField(
              controller: telefoneController,
              decoration: InputDecoration(
                labelText: Localizacoes.of(context).traduzir('TELEFONE'),
                fillColor: kGDBackgroundColor,
                filled: true,
              ),
            )
          ],
          callback: () async {
            var editUsuario = usu;
            editUsuario.growdever.email = emailController.text;
            editUsuario.growdever.telefone = telefoneController.text;
            if (await appController.atualizarInformacoes(ctx, editUsuario)) {
              usu.growdever.email = emailController.text;
              usu.growdever.telefone = telefoneController.text;
              kUsuario.growdever.email = emailController.text;
              kUsuario.growdever.telefone = telefoneController.text;
            }
            Navigator.of(context).pop();
          },
        );
      },
    );
  }
}
