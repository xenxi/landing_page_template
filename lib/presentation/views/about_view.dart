import 'package:flutter/material.dart';

class AboutView extends StatelessWidget {
  const AboutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.pinkAccent,
      padding: const EdgeInsets.all(12),
      alignment: Alignment.center,
      child: FittedBox(
        fit: BoxFit.contain,
        child: Text(
          'About',
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
    );
  }
}
