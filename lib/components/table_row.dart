import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/utils/constants.dart';

class TableRowDetails extends StatelessWidget {
  final String title, value;

  const TableRowDetails({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(
          addNewLineCharacter(value),
          textAlign: TextAlign.center,
          style: movieTextStyleLeft,
        ),
        Text(
          value,
          textAlign: TextAlign.center,
          style: movieTextStyleRight,
        ),
      ],
    );
  }

  String addNewLineCharacter(String result) {
    if (result.length <= 23 && result.allMatches(' ').length <= 2) {
      return title;
    } else {
      return '$title\n';
    }
  }
}
