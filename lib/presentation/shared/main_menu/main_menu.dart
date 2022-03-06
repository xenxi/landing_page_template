import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:landing_page_template/presentation/shared/main_menu/menu_item.dart';

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
              if (isOpen.value) ...[
                const MenuItem(
                  text: 'Home',
                ),
                const MenuItem(
                    text: 'About', delay: Duration(milliseconds: 100)),
                const MenuItem(
                    text: 'Skills', delay: Duration(milliseconds: 150)),
                const MenuItem(
                    text: 'Portfolio', delay: Duration(milliseconds: 200)),
                const MenuItem(
                    text: 'Contact', delay: Duration(milliseconds: 250)),
                const MenuItem(text: 'Blog', delay: Duration(milliseconds: 300))
              ]
            ],
          ),
        ),
      ),
    );
  }

  void _toggleMenu(AnimationController controller,
      {required ValueNotifier<bool> isOpen}) {
    if (isOpen.value) {
      controller.reverse();
    } else {
      controller.forward();
    }

    isOpen.value = !isOpen.value;
  }
}
