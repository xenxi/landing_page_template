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
  _addOnPageChangedEvent(pageIndex, controller, views, onPageChanged);
  return controller;
}

void _addOnPageChangedEvent(int page, PageController controller,
    List<ViewData> views, OnPageChanged onPageChanged) {
  controller.addListener(() {
    final index = (controller.page ?? 0).round();

    if (index != page) {
      print('$index - $page');
      final view = views[index];
      page = index;
      html.window.history.pushState(null, 'none', '#/${view.title}');
      html.document.title = view.title;
      onPageChanged(view.title);
    }
  });
}
