import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

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
          height: 40,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
              color: Colors.black, borderRadius: BorderRadius.circular(6)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MenuTitle(controller: controller),
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
