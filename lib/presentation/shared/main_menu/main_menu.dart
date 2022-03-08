import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:landing_page_template/presentation/shared/main_menu/menu_item.dart';

import '../values/menu_data.dart';
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

  Iterable<Widget> _buildItems(BuildContext context) => MenuData.links(context)
      .map((menuData) => MenuItem(text: menuData.text, onTap: menuData.onTap));

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
