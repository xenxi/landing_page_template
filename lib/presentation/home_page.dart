import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:landing_page_template/presentation/views/about_view.dart';
import 'package:landing_page_template/presentation/views/blog_view.dart';
import 'package:landing_page_template/presentation/views/contact_view.dart';
import 'package:landing_page_template/presentation/views/home_view.dart';
import 'package:landing_page_template/presentation/views/portfolio_view.dart';
import 'package:landing_page_template/presentation/views/skills_view.dart';

import '../application/landing_bloc.dart';
import 'shared/main_menu/main_menu.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LandingBloc(),
      child: Scaffold(
        body: Stack(
          children: [
            _Body(),
            const Positioned(top: 20, right: 20, child: MainMenu())
          ],
        ),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  final PageController controller = PageController();
  _Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
}
