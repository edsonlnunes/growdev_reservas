import 'package:flutter/material.dart';

class Modal extends StatelessWidget {
  final String text;
  final String buttonText;
  final String hintText;
  final String hintText2;
  final Function() onPressed;
  final bool flag;
  final bool obscureText;

  Modal(
      {this.text,
      this.buttonText,
      this.onPressed,
      this.flag,
      this.hintText,
      this.hintText2,
      this.obscureText});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.fromLTRB(25, 10, 25, 20),
      content: Container(
        height: MediaQuery.of(context).size.height * 0.30,
        width: MediaQuery.of(context).size.width * 0.90,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    child: Icon(
                      Icons.close,
                      color: Theme.of(context).accentColor,
                    ),
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
                flag
                    ? Form(
                        child: Column(
                          children: [
                            TextFormField(
                              obscureText: obscureText,
                              decoration: InputDecoration(
                                hintText: hintText,
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              obscureText: obscureText,
                              decoration: InputDecoration(
                                hintText: hintText2,
                              ),
                            ),
                          ],
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.only(top: 50),
                        child: Text(
                          text,
                          style: TextStyle(
                            color: Color(0xff707070),
                            fontSize: 18,
                            height: 1.5,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
              ],
            ),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: RaisedButton(
                child: Text(
                  buttonText,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                color: Theme.of(context).accentColor,
                padding: EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                onPressed: onPressed,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
