import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:landing_page_template/presentation/home_page.dart';

class FluroRouterGenerator {
  final FluroRouter _router;

  FluroRouterGenerator() : _router = FluroRouter() {
    _configureRoutes();
  }

  void _configureRoutes() {
    _router.define(
      '/:page',
      handler: _homeHandler(),
    );

    _router.notFoundHandler = _homeHandler();
  }

  Handler _homeHandler() => Handler(
        handlerFunc: (context, params) => const HomePage(),
      );

  Route<dynamic>? generateRoute(RouteSettings settings) =>
      _router.generator(settings);
}
