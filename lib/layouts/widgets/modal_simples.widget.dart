import 'package:flutter/material.dart';

class ModalSimplesWidget extends StatelessWidget {
  final String descricao;
  final String textobotao;
  final void Function() callback;

  const ModalSimplesWidget({
    Key key,
    @required this.descricao,
    @required this.textobotao,
    @required this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 20),
      content: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    child: Icon(
                      Icons.close,
                      color: Color(0xffe16e0e),
                    ),
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  descricao,
                  style: TextStyle(
                    color: Color(0xff707070),
                    fontSize: 18,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              width: double.infinity,
              child: RaisedButton(
                child: Text(
                  textobotao.toUpperCase(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                padding: EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                onPressed: callback,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
