import 'package:flutter/material.dart';
import 'package:gd_reservas/layouts/widgets/custom_appbar.widget.dart';
import 'package:gd_reservas/layouts/widgets/rich_text_label.widget.dart';

class DadosUsuarioPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff8f8f8),
      appBar: CustomAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            width: double.infinity,
            color: Colors.white,
            padding: EdgeInsets.symmetric(vertical: 30),
            child: Center(
              child: Text(
                'Dados do usuário',
                style: TextStyle(
                  color: Color(0xff2b385b),
                  fontSize: 20,
                ),
              ),
            ),
          ),
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
                        label: 'Username',
                        value: 'joao',
                      ),
                      RichTextLabel(
                        label: 'Programa',
                        value: 'Starter',
                      ),
                      RichTextLabel(
                        label: 'E-mail',
                        value: 'joao@gmail.com',
                      ),
                      RichTextLabel(
                        label: 'Telefone',
                        value: '(51)999999999',
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        child: Icon(
                          Icons.edit,
                          size: 32,
                          color: Color(0xffe16e0e),
                        ),
                        onTap: () {},
                      ),
                      SizedBox(width: 30),
                      InkWell(
                        child: Icon(
                          Icons.lock,
                          size: 32,
                          color: Color(0xffe16e0e),
                        ),
                        onTap: () {},
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
