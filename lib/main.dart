import 'package:flutter/material.dart';

import 'package:landing_page_template/presentation/routes/fluro_router_generator.dart';

void main() => runApp(LandingApp());

class LandingApp extends StatelessWidget {
  final FluroRouterGenerator _router;
  LandingApp({Key? key})
      : _router = FluroRouterGenerator(),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Landing Page Template',
        initialRoute: '/home',
        onGenerateRoute: _router.generateRoute);
  }
}
