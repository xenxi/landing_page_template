import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:universal_html/html.dart' as html;
import 'package:landing_page_template/presentation/views/view_data.dart';

import '../application/landing_bloc.dart';
import 'shared/main_menu/main_menu.dart';
import 'shared/values/home_view_data.dart';

class HomePage extends StatelessWidget {
  final String page;
  const HomePage({
    Key? key,
    this.page = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LandingBloc(),
      child: Scaffold(
        body: Stack(
          children: [
            _Body(
              initialPage: page,
              views: HomeViewData.views,
            ),
            const Positioned(top: 20, right: 20, child: MainMenu())
          ],
        ),
      ),
    );
  }
}

class _Body extends HookWidget {
  final List<ViewData> views;
  final PageController controller;
  _Body({
    Key? key,
    required String initialPage,
    required this.views,
  })  : controller = _createFromInitialPage(initialPage),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentIndex = useState(controller.initialPage);
    controller.addListener(() {
      final index = (controller.page ?? 0).round();

      if (index != currentIndex.value) {
        final view = views[index];
        currentIndex.value = index;
        html.window.history.pushState(null, 'none', '#/${view.title}');
        html.document.title = view.title;
      }
    });

    return BlocListener<LandingBloc, LandingState>(
      listener: (context, state) {
        controller.animateToPage(state.viewIndex,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut);
      },
      child: PageView(
        controller: controller,
        scrollDirection: Axis.vertical,
        children: views.map((e) => e.view).toList(),
      ),
    );
  }

  static int _getIndex(String page) {
    final initialView = HomeViewData.views.firstWhere(
        (element) => element.title == page,
        orElse: () => HomeViewData.views.first);

    return HomeViewData.views.indexOf(initialView);
  }

  static PageController _createFromInitialPage(String initialPage) {
    final pageIndex = _getIndex(initialPage);
    return PageController(initialPage: pageIndex);
  }
}
