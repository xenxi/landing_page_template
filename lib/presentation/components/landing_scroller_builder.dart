import 'package:flutter/material.dart';
import 'package:universal_html/html.dart' as html;
import '../views/view_data.dart';

int _getIndex(String page, List<ViewData> views) {
  final initialView = views.firstWhere((element) => element.title == page,
      orElse: () => views.first);

  return views.indexOf(initialView);
}

typedef OnPageChanged = void Function(String page);
PageController fromInitialPage(
    {required String inital,
    required List<ViewData> views,
    required OnPageChanged onPageChanged}) {
  final pageIndex = _getIndex(inital, views);
  final controller = PageController(initialPage: pageIndex);
  final homeController = HomePageController._(
      controller: controller,
      currentIndex: pageIndex,
      views: views,
      onPageChanged: onPageChanged);

  return homeController.controller;
}

class HomePageController {
  final PageController controller;
  final OnPageChanged onPageChanged;
  int _currentIndex;
  HomePageController._({
    required this.controller,
    required this.onPageChanged,
    required int currentIndex,
    required List<ViewData> views,
  }) : _currentIndex = currentIndex {
    controller.addListener(() {
      final index = (controller.page ?? 0).round();

      if (index != _currentIndex) {
        final view = views[index];
        _currentIndex = index;
        html.window.history.pushState(null, 'none', '#/${view.title}');
        html.document.title = view.title;
        onPageChanged(view.title);
      }
    });
  }

  factory HomePageController.fromInitialPage(
      {required String inital,
      required List<ViewData> views,
      required OnPageChanged onPageChanged}) {
    final pageIndex = _getIndex(inital, views);
    final controller = PageController(initialPage: pageIndex);
    return HomePageController._(
        controller: controller,
        currentIndex: pageIndex,
        views: views,
        onPageChanged: onPageChanged);
  }
}
