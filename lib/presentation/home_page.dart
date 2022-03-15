import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:landing_page_template/presentation/views/view_data.dart';

import '../application/landing_bloc.dart';
import 'components/landing_scroller_builder.dart';
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
  final String initialPage;
  const _Body({
    Key? key,
    required this.initialPage,
    required this.views,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentIndex = useState(initialPage);
    final controller = fromInitialPage(
        inital: initialPage,
        views: views,
        onPageChanged: (page) => currentIndex.value = page);

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
}
