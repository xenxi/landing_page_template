import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:landing_page_template/presentation/shared/main_menu/menu_item.dart';

import '../../../application/landing_bloc.dart';
import 'menu_title.dart';

class MainMenu extends HookWidget {
  const MainMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isOpen = useState(false);
    final controller =
        useAnimationController(duration: const Duration(milliseconds: 300));
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => _toggleMenu(controller, isOpen: isOpen),
        child: Container(
          clipBehavior: Clip.hardEdge,
          width: 120,
          decoration: BoxDecoration(
              color: Colors.black, borderRadius: BorderRadius.circular(6)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                child: MenuTitle(controller: controller),
              ),
              if (isOpen.value) ..._buildItems(context)
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildItems(BuildContext context) => [
        MenuItem(
            text: 'Home',
            delay: const Duration(milliseconds: 100),
            onTap: () => _navigateTo(context, index: 0)),
        MenuItem(
            text: 'About',
            delay: const Duration(milliseconds: 100),
            onTap: () => _navigateTo(context, index: 1)),
        MenuItem(
            text: 'Skills',
            delay: const Duration(milliseconds: 150),
            onTap: () => _navigateTo(context, index: 2)),
        MenuItem(
            text: 'Portfolio',
            delay: const Duration(milliseconds: 200),
            onTap: () => _navigateTo(context, index: 3)),
        MenuItem(
            text: 'Contact',
            delay: const Duration(milliseconds: 250),
            onTap: () => _navigateTo(context, index: 4)),
        MenuItem(
            text: 'Blog',
            delay: const Duration(milliseconds: 300),
            onTap: () => _navigateTo(context, index: 5))
      ];

  void _toggleMenu(AnimationController controller,
      {required ValueNotifier<bool> isOpen}) {
    if (isOpen.value) {
      controller.reverse();
    } else {
      controller.forward();
    }

    isOpen.value = !isOpen.value;
  }

  void _navigateTo(context, {required int index}) =>
      BlocProvider.of<LandingBloc>(context).add(PageChanged(index));
}
