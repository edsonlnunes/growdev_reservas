import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class RichTextLabel extends StatelessWidget {
  final String label;
  final String value;

  const RichTextLabel({
    Key key,
    @required this.label,
    @required this.value,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: '$label: ',
        style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xff707070),
            fontSize: 16,
            height: 1.5),
        children: <TextSpan>[
          TextSpan(
            text: '$value',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
          ),
        ],
      ),
    );
  }
}
