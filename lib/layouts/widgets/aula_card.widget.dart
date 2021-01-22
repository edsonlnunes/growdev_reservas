import 'package:flutter/material.dart';
import 'package:gd_reservas/models/aula.dart';
import 'package:gd_reservas/utils/lang/localizacoes.dart';

class AulaCardWidget extends StatelessWidget {
  final Aula aula;
  final String statusLabel;
  final IconData iconData;
  final Function callback;

  const AulaCardWidget({
    Key key,
    @required this.aula,
    @required this.statusLabel,
    @required this.iconData,
    @required this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      Localizacoes.of(context).traduzir('QUANDO'),
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      aula.data,
                      style: TextStyle(
                        color: Color(0xff707070),
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      Localizacoes.of(context).traduzir('HORA'),
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      aula.hora,
                      style: TextStyle(
                        color: Color(0xff707070),
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                VerticalDivider(
                  width: 4,
                  color: Color(0xffa5a5a5),
                  thickness: 1,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            text:
                                '$statusLabel ${aula.vagas == null ? '\n' : ''}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xff707070),
                              fontSize: 16,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: '${aula.status}',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal),
                              ),
                            ],
                          ),
                        ),
                        aula.vagas != null
                            ? Text(
                                '${Localizacoes.of(context).traduzir('VAGAS_RESTANTES')}: ${aula.vagas}',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xff707070),
                                    fontWeight: FontWeight.bold),
                              )
                            : SizedBox(),
                      ],
                    ),
                    InkWell(
                      child: Icon(
                        iconData,
                        color: Color(0xffe16e0e),
                      ),
                      onTap: callback,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
