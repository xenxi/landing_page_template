import 'package:flutter/material.dart';

class BlogView extends StatelessWidget {
  const BlogView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orangeAccent,
      padding: const EdgeInsets.all(12),
      alignment: Alignment.center,
      child: FittedBox(
        fit: BoxFit.contain,
        child: Text(
          'Blog',
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
    );
  }
}
