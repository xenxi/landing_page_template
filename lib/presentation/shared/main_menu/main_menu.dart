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
        useAnimationController(duration: const Duration(milliseconds: 400));
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => _toggleMenu(controller, isOpen: isOpen),
        child: Container(
          width: 120,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          decoration: BoxDecoration(
              color: Colors.black, borderRadius: BorderRadius.circular(6)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MenuTitle(controller: controller),
              if (isOpen.value) ...[
                const MenuItem(text: 'Home'),
                const MenuItem(text: 'About'),
                const MenuItem(text: 'Skills'),
                const MenuItem(text: 'Portfolio'),
                const MenuItem(text: 'Contact'),
                const MenuItem(text: 'Blog')
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
