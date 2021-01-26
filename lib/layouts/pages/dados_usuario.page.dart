import 'package:flutter/material.dart';
import 'package:gd_reservas/layouts/widgets/titulo.widget.dart';
import 'package:gd_reservas/layouts/widgets/modal_formulario.widget.dart';
import 'package:gd_reservas/layouts/widgets/rich_text_label.widget.dart';
import 'package:gd_reservas/themes/theme.dart';
import 'package:gd_reservas/utils/lang/localizacoes.dart';

class DadosUsuarioPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(70, 0, 0, 0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Titulo('DADOS_USUARIO'),
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
                      'João',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height: 10),
                    Column(
                      children: [
                        RichTextLabel(
                          label: Localizacoes.of(context).traduzir('USUARIO'),
                          value: 'joao',
                        ),
                        RichTextLabel(
                          label: Localizacoes.of(context)
                              .traduzir('PROGRAMA_GROWDEV'),
                          value: 'Starter',
                        ),
                        RichTextLabel(
                          label: Localizacoes.of(context).traduzir('EMAIL'),
                          value: 'joao@gmail.com',
                        ),
                        RichTextLabel(
                          label: Localizacoes.of(context).traduzir('TELEFONE'),
                          value: '(51)999999999',
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.edit,
                            size: 32,
                            color: kColorGDLaranja,
                          ),
                          onPressed: () => atualizarDados(context),
                        ),
                        SizedBox(width: 30),
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
    showDialog(
      context: ctx,
      builder: (BuildContext context) {
        return ModalFormularioWidget(
          textoBotao: Localizacoes.of(context).traduzir('ATUALIZAR_SENHA'),
          textFields: [
            TextFormField(
              decoration: InputDecoration(
                labelText: Localizacoes.of(context).traduzir('SENHA_ATUAL'),
                fillColor: kGDBackgroundColor,
                filled: true,
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: Localizacoes.of(context).traduzir('NOVA_SENHA'),
                fillColor: kGDBackgroundColor,
                filled: true,
              ),
            )
          ],
          callback: () {
            // TODO: função de atualizar senha
          },
        );
      },
    );
  }

  void atualizarDados(BuildContext ctx) {
    showDialog(
      context: ctx,
      builder: (BuildContext context) {
        return ModalFormularioWidget(
          textoBotao:
              Localizacoes.of(context).traduzir('ATUALIZAR_INFORMACOES'),
          textFields: [
            TextFormField(
              decoration: InputDecoration(
                labelText: Localizacoes.of(context).traduzir('EMAIL'),
                fillColor: kGDBackgroundColor,
                filled: true,
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: Localizacoes.of(context).traduzir('TELEFONE'),
                fillColor: kGDBackgroundColor,
                filled: true,
              ),
            )
          ],
          callback: () {
            // TODO: função de atualizar senha
          },
        );
      },
    );
  }
}
