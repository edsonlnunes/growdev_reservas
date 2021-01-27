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
        width: double.maxFinite,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Column(
                mainAxisSize: MainAxisSize.min,
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
                    child: Flexible(
                      child: ListView.separated(
                        shrinkWrap: true,
                        separatorBuilder: (_, __) => SizedBox(height: 20),
                        itemCount: textFields.length,
                        itemBuilder: (_, index) => textFields[index],
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 30),
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
