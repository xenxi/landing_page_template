import 'package:flutter/material.dart';
import 'package:landing_page_template/presentation/home_page.dart';

void main() => runApp(const LandingApp());

class LandingApp extends StatelessWidget {
  const LandingApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Landing Page Template',
      home: HomePage(),
    );
  }
}
