import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final String text;

  Header({this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      '$text',
      style: TextStyle(
        fontSize: 20,
      ),
    );
  }
}

class SmallerHeader extends StatelessWidget {
  final String text;

  SmallerHeader({this.text});

  @override
  Widget build(BuildContext context) {
    return Text('$text',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.normal,
        ));
  }
}
