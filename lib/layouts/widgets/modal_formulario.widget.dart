import 'package:flutter/material.dart';

class ModalFormularioWidget extends StatelessWidget {
  final String textoBotao;
  final void Function() callback;
  final List<TextFormField> textFields;

  ModalFormularioWidget({
    @required this.textoBotao,
    @required this.textFields,
    @required this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.fromLTRB(25, 10, 25, 20),
      content: Container(
        height: MediaQuery.of(context).size.height * 0.35,
        width: MediaQuery.of(context).size.width * 0.90,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      child: Icon(
                        Icons.close,
                        color: Theme.of(context).buttonColor,
                      ),
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Form(
                    child: Expanded(
                      child: ListView.separated(
                        separatorBuilder: (_, __) => SizedBox(height: 20),
                        itemCount: textFields.length,
                        itemBuilder: (_, index) => textFields[index],
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: RaisedButton(
                child: Text(
                  textoBotao.toUpperCase(),
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
