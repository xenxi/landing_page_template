import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:landing_page_template/presentation/views/about_view.dart';
import 'package:landing_page_template/presentation/views/blog_view.dart';
import 'package:landing_page_template/presentation/views/contact_view.dart';
import 'package:landing_page_template/presentation/views/home_view.dart';
import 'package:landing_page_template/presentation/views/portfolio_view.dart';
import 'package:landing_page_template/presentation/views/skills_view.dart';

import '../application/landing_bloc.dart';
import 'shared/main_menu/main_menu.dart';
import 'package:universal_html/html.dart' as html;

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
            ),
            const Positioned(top: 20, right: 20, child: MainMenu())
          ],
        ),
      ),
    );
  }
}

class _Body extends HookWidget {
  static const List<String> _pages = [
    'home',
    'about',
    'skills',
    'portfolio',
    'contact',
    'blog',
  ];
  final PageController controller;
  _Body({
    Key? key,
    required String initialPage,
  })  : controller = _createFromInitialPage(initialPage),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentIndex = useState(controller.initialPage);
    controller.addListener(() {
      final index = (controller.page ?? 0).round();

      if (index != currentIndex.value) {
        final page = _pages[index];
        currentIndex.value = index;
        html.window.history.pushState(null, 'none', '#/${page}');
        html.document.title = _pages[index];
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
        children: const [
          HomeView(),
          AboutView(),
          SkillsView(),
          PortfolioView(),
          ContactView(),
          BlogView()
        ],
      ),
    );
  }

  static int _getIndex(String page) {
    final index = _pages.indexOf(page);

    if (index < 0) return 0;
    return index;
  }

  static PageController _createFromInitialPage(String initialPage) {
    final pageIndex = _getIndex(initialPage);
    return PageController(initialPage: pageIndex);
  }
}
