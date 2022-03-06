import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuItem extends HookWidget {
  final String text;
  final void Function()? onTap;
  final Duration delay;
  const MenuItem({
    Key? key,
    required this.text,
    this.onTap,
    this.delay = const Duration(),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isHover = useState(false);
    return ElasticIn(
      delay: delay,
      duration: const Duration(milliseconds: 300),
      child: MouseRegion(
        onEnter: (_) => isHover.value = true,
        onExit: (_) => isHover.value = false,
        child: AnimatedContainer(
          width: double.infinity,
          duration: const Duration(milliseconds: 300),
          curve: Curves.fastOutSlowIn,
          color: isHover.value ? Colors.purple : Colors.transparent,
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          child: Text(
            text,
            style: GoogleFonts.aBeeZee(color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
