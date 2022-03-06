import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuItem extends HookWidget {
  final String text;
  final void Function()? onTap;
  const MenuItem({
    Key? key,
    required this.text,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isHover = useState(false);
    return MouseRegion(
      onEnter: (_) => isHover.value = true,
      onExit: (_) => isHover.value = false,
      child: AnimatedContainer(
        width: double.infinity,
        duration: const Duration(milliseconds: 400),
        curve: Curves.fastOutSlowIn,
        color: isHover.value ? Colors.pinkAccent : Colors.transparent,
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        child: Text(
          text,
          style: GoogleFonts.cinzel(color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
