import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

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
        onTap: () {
          if (isOpen.value) {
            controller.reverse();
          } else {
            controller.forward();
          }

          isOpen.value = !isOpen.value;
        },
        child: Container(
          width: 120,
          height: 40,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
              color: Colors.black, borderRadius: BorderRadius.circular(6)),
          child: MenuTitle(controller: controller),
        ),
      ),
    );
  }
}

class MenuTitle extends StatelessWidget {
  const MenuTitle({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final AnimationController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          'Menú',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        const Spacer(),
        AnimatedIcon(icon: AnimatedIcons.menu_close, progress: controller),
      ],
    );
  }
}
