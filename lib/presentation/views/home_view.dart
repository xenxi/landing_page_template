import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.greenAccent,
      padding: const EdgeInsets.all(12),
      alignment: Alignment.center,
      child: FittedBox(
        fit: BoxFit.contain,
        child: Text(
          'Home',
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
    );
  }
}
