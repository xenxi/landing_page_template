import 'package:flutter/material.dart';
import 'package:landing_page_template/presentation/views/about_view.dart';
import 'package:landing_page_template/presentation/views/blog_view.dart';
import 'package:landing_page_template/presentation/views/contact_view.dart';
import 'package:landing_page_template/presentation/views/home_view.dart';
import 'package:landing_page_template/presentation/views/portfolio_view.dart';
import 'package:landing_page_template/presentation/views/skills_view.dart';

import 'shared/main_menu/main_menu.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: const [
          _Body(),
          Positioned(top: 20, right: 20, child: MainMenu())
        ],
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView(
      scrollDirection: Axis.vertical,
      children: const [
        HomeView(),
        AboutView(),
        SkillsView(),
        PortfolioView(),
        ContactView(),
        BlogView()
      ],
    );
  }
}
