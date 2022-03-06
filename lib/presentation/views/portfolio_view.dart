import 'package:flutter/material.dart';

class PortfolioView extends StatelessWidget {
  const PortfolioView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.purpleAccent,
      padding: const EdgeInsets.all(12),
      alignment: Alignment.center,
      child: FittedBox(
        fit: BoxFit.contain,
        child: Text(
          'My Work',
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
    );
  }
}
