import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class MenuTitle extends HookWidget {
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
