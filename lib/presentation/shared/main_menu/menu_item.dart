import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  final String text;
  const MenuItem({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text);
  }
}
